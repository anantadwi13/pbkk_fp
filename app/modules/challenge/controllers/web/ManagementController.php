<?php

namespace Dengarin\Challenge\Controllers\Web;

use Dengarin\Challenge\Controllers\ModuleController;
use Dengarin\Challenge\Models\Competition;
use Dengarin\Challenge\Models\Submission;
use Phalcon\Dispatcher;

class ManagementController extends ModuleController
{
    public function indexAction()
    {
        $this->view->setVars([
            'title' => 'Competition Management',
            'body' => 'This is body' 
        ]);

        if ($this->request->isPost()){
            // Creating new competition
            $competition = new Competition();
            $competition->assign($this->request->getPost(),['title', 'description', 'duedate', 'image']);
            // datepicker didn't work so I temporarily debug with this
            $date = explode("-",$competition->duedate);
            array_unshift($date, array_pop($date));
            $date = join("-",$date);
            $competition->duedate = $date;
            var_dump($competition); 
            if ($competition->save()){
                $this->flashSession->success('Challenge has been created succesfully');
                $this->response->redirect(['for' => 'manage_competition']);
            } else {
                foreach ($competition->getMessages() as $message)
                    $this->flash->error($message->getMessage());
            }
        }
    }

    public function showAction()
    {
        $id = $this->dispatcher->getParam('id');
        $title = $id . ' - Competition Management';
        $this->view->setVars([
            'title' => $title,
            'body' => 'This is body',
            'id' => $id
        ]);
    }
}