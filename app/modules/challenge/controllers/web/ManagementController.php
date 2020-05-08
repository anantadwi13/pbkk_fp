<?php

namespace Dengarin\Challenge\Controllers\Web;

use Dengarin\Challenge\Controllers\ModuleController;
use Dengarin\Challenge\Models\Competition;
use Dengarin\Challenge\Models\Submission;
use Phalcon\Dispatcher;

class ManagementController extends ModuleController
{
    public function rrmdir($dir): bool
    { 
        if (is_dir($dir)) { 
            $objects = scandir($dir); 
            foreach ($objects as $object) { 
                if ($object != "." && $object != "..") { 
                if (is_dir($dir."/".$object))
                    rrmdir($dir."/".$object);
                else
                    unlink($dir."/".$object); 
                } 
            }
            rmdir($dir);
            return true; 
        }else {
            return false;
        }
    }
    
    public function indexAction()
    {
        $this->view->title = 'Competition Management';
        /*
        * Read all competition
        */
        $this->view->competition = Competition::find();
        $dates = $this->view->competition;
        $sign = [];
        $readable_date = [];
        foreach ($dates as $date) {            
            $now = time();
            $duedate = strtotime($date->duedate);
            $diff = $now - $duedate;
            $sign[] = $diff <= 0 ? false : true;
            $dues = getdate($duedate);
            $d = "$dues[weekday], $dues[month] $dues[mday] $dues[year]";
            $readable_date[] = $d;
        }
        $this->view->setVars([
            'expired' => $sign,
            'readable_date' => $readable_date
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

                    // make submission directory
                    $submission_folder = $competition->title . "_DENGAR-IN_" . $competition->duedate;
                    if (!mkdir(BASE_PATH . "/public/challenge_submission/" . $submission_folder)) {
                        $this->flashSession->error('Failed to create submission directory');
                        $this->response->redirect(['for' => 'challenge-manage-competition']);
                    }

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
                    $this->flashSession->error('Your format image file is incorrect or have reach our size limit');
                    $this->response->redirect(['for' => 'challenge-manage-competition']);
                }
            }elseif ($this->request->getPost("edit")  && $this->security->checkToken()) {
                /*
                * Editing competition
                */
                $competition = Competition::findFirst($this->request->getPost('id'));
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
                        // detachment image file at the web server
                        if (!unlink(BASE_PATH . "/public/challenge_competition/" . $competition->image)){
                            $this->flashSession->error('Failed to delete the old image poster');
                            $this->response->redirect(['for' => 'challenge-manage-competition']);
                        }
                        $competition->image = $filepath;
                        // datepicker didn't work and need to convert,
                        // so I temporarily debug with this
                        // $date = explode("-",$competition->duedate);
                        // array_unshift($date, array_pop($date));
                        // $date = join("-",$date);
                        // $competition->duedate = $date;
                    }
                    // rename submission directory
                    $old_submission_folder = $competition->title . "_DENGAR-IN_" . $competition->duedate;
                    $competition->assign($this->request->getPost(),['title', 'description', 'duedate']);
                    $new_submission_folder = $competition->title . "_DENGAR-IN_" . $competition->duedate;
                    if (!rename(BASE_PATH . "/public/challenge_submission/" . $old_submission_folder,
                        BASE_PATH . "/public/challenge_submission/" . $new_submission_folder))
                    {
                        $this->flashSession->error('Failed to migrate the entire submission directory');
                        $this->response->redirect(['for' => 'challenge-manage-competition']);
                    }

                    if ($competition->update()){
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
                $competition = Competition::findFirst($this->request->getPost('id'));
                // delete submission directory
                $submission_folder = $competition->title . "_DENGAR-IN_" . $competition->duedate;
                if (!$this->rrmdir(BASE_PATH . "/public/challenge_submission/" . $submission_folder)) {
                    $this->flashSession->error('Failed to delete entire submission directory');
                    $this->response->redirect(['for' => 'challenge-manage-competition']);
                }

                // detachment image file at the web server
                $image = $competition->image;
                if (unlink(BASE_PATH . "/public/challenge_competition/" . $image) && $competition->delete())
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
            'id' => $id
        ]);
    }
}