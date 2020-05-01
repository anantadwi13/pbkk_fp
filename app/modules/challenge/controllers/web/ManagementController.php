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
        $this->view->title = 'Competition Management';
        /*
        * Read all competition
        */
        $this->view->competition = Competition::find();
        $dates = $this->view->competition;
        // debug expired date later
        // foreach ($dates as $date) {            
        //     $now = date_create("now");
        //     $duedate = date_create($date->duedate);
        //     var_dump(date_diff($now,$duedate));
        // }
        // exit();
        $this->view->setVars([
            'getdate' => getdate(),
        ]);

        if ($this->request->isPost())
        {
            if ($this->request->getPost("create"))
            {
                /*
                * Creating new competition
                */
                if ($this->request->hasFiles())
                {
                    $filepath = '';
                    $files = $this->request->getUploadedFiles();
                    foreach ($files as $file) {
                        // regex of this title need to be verified for pathfile later
                        $image = $this->request->getPost("title") . "_DENGAR-IN_" . $file->getName();
                        $file->moveTo(
                            BASE_PATH . "/public/challenge_competition/" . $image
                        );
                        $filepath = $image;
                    }
                    // fix it later
                    // if (!$files->isUploadedFile())
                    // {
                    //     $this->flash->error('File hasn\'t been uploaded');
                    // }
                    $competition = new Competition();
                    $competition->assign($this->request->getPost(),['title', 'description', 'duedate']);
                    $competition->image = $filepath;
                    // datepicker didn't work and need to convert,
                    // so I temporarily debug with this
                    // $date = explode("-",$competition->duedate);
                    // array_unshift($date, array_pop($date));
                    // $date = join("-",$date);
                    // $competition->duedate = $date;
                    if ($competition->save()){
                        $this->flashSession->success('Challenge has been created succesfully');
                        $this->response->redirect(['for' => 'challenge-manage-competition']);
                    } else {
                        foreach ($competition->getMessages() as $message)
                            $this->flash->error($message->getMessage());
                    }
                }else {
                    $this->flashSession->error('Your format image file is incorrect');
                    $this->response->redirect(['for' => 'challenge-manage-competition']);
                }
            }elseif ($this->request->getPost("edit")  && $this->security->checkToken()) {
                /*
                * Editing competition
                */
                $competition = Competition::findFirst($this->request->getPost('idcomp'));
                if ($competition)
                {
                    if ($this->request->hasFiles())
                    {
                        $filepath = '';
                        $files = $this->request->getUploadedFiles();
                        foreach ($files as $file) {
                            // regex of this title need to be verified for pathfile later
                            $image = $this->request->getPost("title") . "_DENGAR-IN_" . $file->getName();
                            $file->moveTo(
                                BASE_PATH . "/public/challenge_competition/" . $image
                            );
                            $filepath = $image;
                        }
                        // fix it later
                        // if (!$files->isUploadedFile())
                        // {
                        //     $this->flash->error('File hasn\'t been uploaded');
                        // }
                        $competition->image = $filepath;
                        // datepicker didn't work and need to convert,
                        // so I temporarily debug with this
                        // $date = explode("-",$competition->duedate);
                        // array_unshift($date, array_pop($date));
                        // $date = join("-",$date);
                        // $competition->duedate = $date;
                    }
                    $competition->assign($this->request->getPost(),['title', 'description', 'duedate']);
                    if ($competition->save()){
                        $this->flashSession->success('Challenge has been edited succesfully');
                        $this->response->redirect(['for' => 'challenge-manage-competition']);
                    } else {
                        foreach ($competition->getMessages() as $message)
                            $this->flash->error($message->getMessage());
                    }
                }
            }elseif ($this->request->getPost("delete")  && $this->security->checkToken()) {
                /*
                * Deleting new competition
                */
                $competition = Competition::findFirst($this->request->getPost('idcomp'));
                // detachment image file for later
                if ($competition->delete())
                {
                    $this->flashSession->success('Challenge has been deleted succesfully');
                    $this->response->redirect(['for' => 'challenge-manage-competition']);
                } else {
                    foreach ($competition->getMessages() as $message)
                        $this->flash->error($message->getMessage());
                }
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