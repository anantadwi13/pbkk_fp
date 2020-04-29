<?php

namespace Dengarin\Collaboration\Controllers\Web;

use DateTime;
use Dengarin\Collaboration\Controllers\ModuleController;
use Dengarin\Collaboration\Models\Event;
use Exception;
use Phalcon\Messages\Message;
use Phalcon\Validation;

class EventController extends ModuleController
{
    public function indexAction()
    {
        $this->view->setLayout('datatables');

        $this->view->events = Event::find([
            'conditions' => 'sound_user_id = :sound_id:',
            'bind' => [
                'sound_id' => $this->auth()->id
            ]
        ]);
    }

    public function createAction()
    {
        $this->view->setLayout('form');

        if ($this->request->isPost()) {
            $validator = new Validation();
            $validator->add(['name'], new Validation\Validator\PresenceOf([
                'message' => ':field is required!'
            ]));
            $validator->add(['start_date', 'end_date'], new Validation\Validator\Date([
                'format' => 'Y-m-d',
                'message' => 'Invalid date!'
            ]));
            $validator->add(['start_time', 'end_time'], new Validation\Validator\Date([
                'format' => 'H:i',
                'message' => 'Invalid time!'
            ]));
            $errors = $validator->validate($this->request->getPost());

            $time_start = new DateTime($this->request->get('start_date') . ' ' . $this->request->get('start_time'));
            $time_end = new DateTime($this->request->get('end_date') . ' ' . $this->request->get('end_time'));

            if ($time_start >= $time_end)
                $errors->appendMessage(new Message('Invalid date range!'));

            if ($errors->count()) {
                foreach ($errors as $error)
                    $this->flashSession->error($error->getMessage());
                return;
            }

            $event = new Event();
            $event->assign($this->request->getPost(), ['name', 'description', 'location']);
            $event->sound_user_id = $this->auth->id;
            $event->time_start = $time_start->format('Y-m-d H:i:s');
            $event->time_end = $time_end->format('Y-m-d H:i:s');
            $event->enableStatus(Event::STATUS_CUSTOM | Event::STATUS_READ | Event::STATUS_ACCEPTED);
            if ($event->save()) {
                $this->flashSession->success('Event has been created successfully');
                $this->response->redirect($this->url->get(['for' => 'collaboration-event-index']));
            } else
                foreach ($event->getMessages() as $message)
                    $this->flash->error($message->getMessage());
        }
    }

    public function deleteAction()
    {
        if ($this->request->isPost()) {
            try {
                $id = $this->router->getParams()['id'];
                /** @var Event $event */
                $event = Event::findFirst($id);
                if ($event->delete())
                    $this->flashSession->success('Event has been deleted successfully');
                else
                    foreach ($event->getMessages() as $error)
                        $this->flashSession->error($error->getMessage());
            } catch (Exception $e) {
                $this->flashSession->error('Error!');
            }
        }

        $this->response->redirect($this->url->get(['for' => 'collaboration-event-index']));
        return;
    }
}