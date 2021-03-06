<?php

namespace Dengarin\Collaboration\Controllers\Web;

use DateTime;
use Dengarin\Collaboration\Controllers\ModuleController;
use Dengarin\Collaboration\Models\Event;
use Dengarin\Collaboration\Validation\EventValidation;
use Dengarin\Main\Models\User;
use Exception;
use Phalcon\Messages\Message;
use Phalcon\Mvc\Model\Resultset;
use Phalcon\Validation;

class EventController extends ModuleController
{
    /**
     * Manage event
     * for Sound and Amplifier user
     */
    public function indexAction()
    {
        $this->view->setLayout('datatables');

        $conditions = '';
        $bind = [];
        switch ($this->auth->role) {
            case User::ROLE_AMPLIFIER:
                $conditions = 'amplifier_user_id = :user_id:';
                $bind = ['user_id' => $this->auth()->id];
                break;
            case User::ROLE_SOUND:
                $conditions = 'sound_user_id = :user_id:';
                $bind = ['user_id' => $this->auth()->id];
                break;
        }

        $this->view->events = Event::find([
            'conditions' => $conditions,
            'bind' => $bind
        ]);
    }

    /**
     * Invitation Action for Sound Users
     */
    public function invitationAction()
    {
        $this->view->setLayout('datatables');

        /** @var Event[] $events */
        $events = Event::find([
            'conditions' => 'sound_user_id = :sound_id: and status & ?0 != ?1 and status & ?2 != ?3',
            'bind' => [
                'sound_id' => $this->auth()->id,
                0 => Event::STATUS_FOLLOWED_UP,
                1 => Event::STATUS_FOLLOWED_UP,
                2 => Event::STATUS_DELETED,
                3 => Event::STATUS_DELETED,
            ]
        ]);

        foreach ($events as $event)
            if (!$event->isStatus(Event::STATUS_READ)) {
                $event->enableStatus(Event::STATUS_READ);
                $event->update();
            }

        $this->view->events = $events;
    }


    /**
     * Create Action for Sound Users
     * @throws Exception
     */
    public function createAction()
    {
        $this->view->setLayout('form');

        if ($this->request->isPost() && $this->security->checkToken()) {
            /**
             * Validation
             */
            $validator = new EventValidation(EventValidation::TYPE_SOUND_CREATE, $this->auth->id);
            $errors = $validator->validate($this->request->getPost());

            if ($errors->count()) {
                foreach ($errors as $error)
                    $this->flashSession->error($error->getMessage());
                return;
            }

            $time_start = (new DateTime($this->request->get('start_date') . ' ' . $this->request->get('start_time')))
                ->format('Y-m-d H:i:s');
            $time_end = (new DateTime($this->request->get('end_date') . ' ' . $this->request->get('end_time')))
                ->format('Y-m-d H:i:s');

            /**
             * Insert Event
             */

            $event = new Event();
            $event->assign($this->request->getPost(), ['name', 'description', 'location']);
            $event->sound_user_id = $this->auth->id;
            $event->time_start = $time_start;
            $event->time_end = $time_end;
            $event->enableStatus(Event::STATUS_READ | Event::STATUS_FOLLOWED_UP | Event::STATUS_ACCEPTED);
            if ($event->save()) {
                $this->flashSession->success('Event has been created successfully');
                $this->response->redirect($this->url->get(['for' => 'collaboration-event-index']));
            } else
                foreach ($event->getMessages() as $message)
                    $this->flash->error($message->getMessage());
        }
    }

    public function collaborateAction($username){
        $this->view->setLayout('form');

        /** @var User $user */
        $user = User::findFirstByUsername($username);
        if (!$user || $user->isStatus(User::STATUS_DISABLED) || $user->role != User::ROLE_SOUND){
            $this->redirectNotFound();
            return;
        }

        if ($this->request->isPost() && $this->security->checkToken()) {
            /**
             * Validation
             */
            $validator = new EventValidation(EventValidation::TYPE_AMPLIFIER_CREATE, $user->id);
            $errors = $validator->validate($this->request->getPost());

            if ($errors->count()) {
                foreach ($errors as $error)
                    $this->flashSession->error($error->getMessage());
                $this->view->user = $user;
                return;
            }

            $time_start = (new DateTime($this->request->get('start_date') . ' ' . $this->request->get('start_time')))
                ->format('Y-m-d H:i:s');
            $time_end = (new DateTime($this->request->get('end_date') . ' ' . $this->request->get('end_time')))
                ->format('Y-m-d H:i:s');

            /**
             * Insert Event
             */

            $event = new Event();
            $event->assign($this->request->getPost(), ['name', 'description', 'location']);
            $event->sound_user_id = $user->id;
            $event->amplifier_user_id = $this->auth->id;
            $event->time_start = $time_start;
            $event->time_end = $time_end;
            if ($event->save()) {
                $this->flashSession->success('Event has been created successfully');
                $this->response->redirect($this->url->get(['for' => 'collaboration-event-index']));
            } else
                foreach ($event->getMessages() as $message)
                    $this->flash->error($message->getMessage());
        }

        $this->view->user = $user;
    }

    public function updateAction($id)
    {
        $this->view->setLayout('form');

        /** @var Event $event */
        $event = Event::findFirst($id);

        if (!$event || ($this->auth->role == User::ROLE_SOUND && $event->sound_user_id != $this->auth->id) ||
            ($this->auth->role == User::ROLE_AMPLIFIER && $event->amplifier_user_id != $this->auth->id)) {
            $this->redirectNotFound();
            return;
        } elseif ($this->auth->role == User::ROLE_SOUND && $event->amplifier_user_id != null) {
            $this->redirectPermissionDenied();
            return;
        } elseif ($event->isStatus(Event::STATUS_DELETED) ||
            ($event->amplifier_user_id && $event->isStatus(Event::STATUS_FOLLOWED_UP))) {
            $this->flashSession->error('Unable to edit deleted/rejected/accepted event!');
            $this->response->redirect($this->url->get(['for' => 'collaboration-event-index']));
            return;
        }


        if ($this->request->isPost() && $this->security->checkToken()) {
            /**
             * Validation
             */
            $validator_type = $this->auth->role == User::ROLE_SOUND ? EventValidation::TYPE_SOUND_UPDATE : EventValidation::TYPE_AMPLIFIER_UPDATE;

            $validator = new EventValidation($validator_type);
            $errors = $validator->validate($this->request->getPost());

            if ($errors->count()) {
                foreach ($errors as $error)
                    $this->flashSession->error($error->getMessage());
                $this->view->event = $event;
                return;
            }

            $time_start = (new DateTime($this->request->get('start_date') . ' ' . $this->request->get('start_time')))
                ->format('Y-m-d H:i:s');
            $time_end = (new DateTime($this->request->get('end_date') . ' ' . $this->request->get('end_time')))
                ->format('Y-m-d H:i:s');

            /**
             * Update Event
             */

            $event->assign($this->request->getPost(), ['name', 'description', 'location']);
            $event->time_start = $time_start;
            $event->time_end = $time_end;
            if ($this->auth->role == User::ROLE_SOUND) {
                $event->enableStatus(Event::STATUS_READ);
                $event->enableStatus(Event::STATUS_FOLLOWED_UP);
                if ($this->request->get('status') == 1)
                    $event->enableStatus(Event::STATUS_ACCEPTED);       // Accept
                else
                    $event->disableStatus(Event::STATUS_ACCEPTED);      // Reject
            }

            if ($event->update()) {
                $this->flashSession->success('Event has been updated successfully');
                $this->response->redirect($this->url->get(['for' => 'collaboration-event-index']));
            } else
                foreach ($event->getMessages() as $message)
                    $this->flash->error($message->getMessage());
        }

        $this->view->event = $event;
    }

    public function deleteAction()
    {
        if ($this->request->isPost() && $this->security->checkToken()) {
            try {
                $id = $this->dispatcher->getParam('id');
                /** @var Event $event */
                $event = Event::findFirst($id);

                if (($this->auth->role == User::ROLE_SOUND && $event->sound_user_id != $this->auth->id) ||
                    ($this->auth->role == User::ROLE_AMPLIFIER && $event->amplifier_user_id != $this->auth->id)) {
                    $this->redirectNotFound();

                } elseif ($event->isStatus(Event::STATUS_FOLLOWED_UP) && $event->isStatus(Event::STATUS_ACCEPTED)) {
                    $this->flashSession->error('Unable to delete accepted event!');

                } elseif ($event->delete())
                    $this->flashSession->success('Event has been deleted successfully');

                else
                    foreach ($event->getMessages() as $error)
                        $this->flashSession->error($error->getMessage());

            } catch (Exception $e) {
                $this->flashSession->error('Error! ' . $e->getMessage());
            }
        }

        $this->response->redirect($this->url->get(['for' => 'collaboration-event-index']));
        return;
    }

    public function followUpAction($id)
    {
        if ($this->request->isPost() && $this->security->checkToken()) {
            try {
                $status = $this->request->getPost('status');

                /** @var Event $event */
                $event = Event::findFirst($id);
                $success = null;
                $errors = null;

                if ($status == 1) {
                    $validator = new EventValidation(EventValidation::TYPE_SOUND_ACCEPT);
                    $errors = $validator->validate($event->toArray());
                    foreach ($errors as $error)
                        $this->flashSession->error($error->getMessage());


                    $event->enableStatus(Event::STATUS_ACCEPTED);
                    $event->enableStatus(Event::STATUS_FOLLOWED_UP);
                    $success = 'Invitation has been accepted!';
                } elseif ($status == 0) {
                    $event->disableStatus(Event::STATUS_ACCEPTED);
                    $event->enableStatus(Event::STATUS_FOLLOWED_UP);
                    $success = 'Invitation has been rejected!';
                }

                if ((!$errors || !$errors->count()) && $success && $event->update())
                    $this->flashSession->success($success);
                else
                    foreach ($event->getMessages() as $error)
                        $this->flashSession->error($error->getMessage());

            } catch (Exception $e) {
                $this->flashSession->error('Error! ' . $e->getMessage());
            }
        }


        $this->response->redirect($this->url->get(['for' => 'collaboration-event-invitation']));
    }

    public function ratingAction($id){
        if (!$this->request->isPost() || !$this->security->checkToken()){
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        }

        /** @var Event $event */
        $event = Event::findFirst($id);
        $rating = $this->request->getPost('rating');

        if ($rating > 5 || $rating <= 0){
            $this->flashSession->error('Invalid rating!');
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        }
        elseif (!$event || ($event->sound_user_id != $this->auth->id && $event->amplifier_user_id != $this->auth->id) ||
            $event->isStatus(Event::STATUS_DELETED)){
            $this->redirectNotFound();
            return;
        } elseif (!$event->isStatus(Event::STATUS_FOLLOWED_UP) || !$event->isStatus(Event::STATUS_ACCEPTED)){
            $this->flashSession->error('Event not accepted!');
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        } elseif (new DateTime($event->time_end) >= new DateTime('now')){
            $this->flashSession->error('Event not finished yet!');
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        } elseif ($event->amplifier_user_id == null){
            $this->flashSession->error("No need rating custom event!");
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        } else {
            switch ($this->auth->role){
                case User::ROLE_SOUND:
                    $event->rating_amplifier = $rating;
                    break;
                case User::ROLE_AMPLIFIER:
                    $event->rating_sound = $rating;
                    break;
            }

            if ($event->update()){
                $this->flashSession->success('Success!');
                $this->response->redirect($this->request->getHTTPReferer());
                return;
            }

            foreach ($event->getMessages() as $message)
                $this->flashSession->error($message->getMessage());
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        }
    }
}