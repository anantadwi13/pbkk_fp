<?php

namespace Dengarin\Collaboration\Controllers\Api;

use Dengarin\Collaboration\Controllers\ModuleController;
use Dengarin\Collaboration\Models\Event;

class EventController extends ModuleController
{
    public function initialize()
    {
        $this->view->disable();
    }

    public function indexAction()
    {
        $res = [];

        $conditions = "status & ?0 != ?1 and status & ?2 = ?3 and status & ?4 = ?5 ";
        $bind = [
            0 => Event::STATUS_DELETED,
            1 => Event::STATUS_DELETED,
            2 => Event::STATUS_FOLLOWED_UP,
            3 => Event::STATUS_FOLLOWED_UP,
            4 => Event::STATUS_ACCEPTED,
            5 => Event::STATUS_ACCEPTED,
        ];

        if ($this->request->getPost('sound_id')){
            $conditions .= ' and sound_user_id = :sound_id:';
            $bind['sound_id'] = $this->request->getPost('sound_id');
        } else {
            $conditions .= ' and amplifier_user_id = :amplifier_id:';
            $bind['amplifier_id'] = $this->request->getPost('amplifier_id');
        }

        /** @var Event[] $events */
        $events = Event::find([
            'conditions' => $conditions,
            'bind' => $bind
        ]);

        if ($events)
            foreach ($events as $event) {
                $res[] = [
                    'title' => $event->name,
                    'start' => $event->time_start,
                    'end' => $event->time_end,
                    'color' => '#fae9e8',
                ];
                $color = rand();
            }
        $this->response->setJsonContent($res);
        return false;
    }
}