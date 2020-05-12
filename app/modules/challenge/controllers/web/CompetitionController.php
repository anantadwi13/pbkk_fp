<?php

namespace Dengarin\Challenge\Controllers\Web;

use Dengarin\Challenge\Controllers\ModuleController;
use Dengarin\Challenge\Models\Competition;
use Dengarin\Challenge\Models\Submission;
use Dengarin\Main\Models\User;

class CompetitionController extends ModuleController
{
    const MARK = "_DENGAR-IN_";
    const SUBMISSION_PATH = "/public/challenge_submission/";

    public function indexAction()
    {
        $this->view->title = "Competition";
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
        // change the button if the challenge past due
        $this->view->setVars([
            'expired' => $sign,
            'readable_date' => $readable_date
        ]);
    }
    
    public function showAction()
    {
        /*
        * Read particular competition
        */
        $id = $this->dispatcher->getParam('id');
        $competition = Competition::findFirst($id);
        $this->view->competition = $competition;
        // unlocked submission if the challenge past due
        $dates = $competition->duedate;
        $now = time();
        $duedate = strtotime($dates);
        $diff = $now - $duedate;
        $sign = $diff <= 0 ? false : true;
        
        // get readable date
        $dues = getdate($duedate);
        $d = "$dues[weekday], $dues[month] $dues[mday] $dues[year]";
        $title = $competition->title . ' - Competition Management';

        // get id user from auth session
        $userid = $this->auth()->id;

        /*
        * Read any submission from user
        */
        $submission = Submission::findFirst([
            'conditions' => 'id = :id: and idcomp = :idcomp:',
            'bind' => [
                'id' => $userid,
                'idcomp' => $id,
            ]
        ]);
        $actual_file = explode(self::MARK, $submission->files);
        $actual_file = $actual_file[1];
        $this->view->setVars([
            'title' => $title,
            'expired' => $sign,
            'readable_date' => $d,
            'iduser' => $userid,
            'files' => $actual_file
        ]);

        if ($this->request->isPost())
        {
            if ($this->request->getPost("create") && $this->security->checkToken())
            {
                /*
                * Creating new submission
                */                
                if ($this->request->hasFiles())
                {
                    $user = User::findFirst($userid);
                    $filepath = '';
                    $files = $this->request->getUploadedFiles();
                    foreach ($files as $file) {
                        // regex of this title need to be verified for pathfile later
                        $image = $user->username . self::MARK . $file->getName();
                        $dir = $competition->title . self::MARK . $competition->duedate . "/";
                        $file->moveTo(
                            BASE_PATH . self::SUBMISSION_PATH . $dir . $image
                        );
                        $filepath = $image;
                    }                    
                    $submission = new Submission();
                    $submission->files = $filepath;
                    $submission->assign($this->request->getPost(),['idcomp','id']);
                    if ($submission->save()) {
                        $this->flashSession->success('Submission has been uploaded succesfully');
                        $this->response->redirect("/competition/" . $id);
                    }else{
                        foreach ($submission->getMessages() as $message)
                            $this->flash->error($message->getMessage());
                    }
                }else{
                    $this->flashSession->error('Failed to upload your submission');
                    $this->response->redirect("/competition/" . $id);
                }
            }elseif ($this->request->getPost("edit") && $this->security->checkToken()) {
                /*
                * Editing new submission
                */                
                if ($this->request->hasFiles())
                {
                    $user = User::findFirst($userid);
                    $directory = '';
                    $filepath = '';
                    $files = $this->request->getUploadedFiles();
                    foreach ($files as $file) {
                        // regex of this title need to be verified for pathfile later
                        $image = $user->username . self::MARK . $file->getName();
                        $dir = $competition->title . self::MARK . $competition->duedate . "/";
                        $file->moveTo(
                            BASE_PATH . self::SUBMISSION_PATH . $dir . $image
                        );
                        $directory = $dir;
                        $filepath = $image;
                    }                    
                    // delete the old submission
                    if (!unlink(BASE_PATH . self::SUBMISSION_PATH . $directory . $submission->files)) {
                        $this->flashSession->error('Failed to delete the old submission file');
                        $this->response->redirect("/competition/" . $id);
                    }
                    $submission->files = $filepath;
                    if ($submission->update()) {
                        $this->flashSession->success('Submission has been edited succesfully');
                        $this->response->redirect("/competition/" . $id);
                    }else{
                        foreach ($submission->getMessages() as $message)
                            $this->flash->error($message->getMessage());
                    }
                }else{
                    $this->flashSession->error('Failed to upload your new submission');
                    $this->response->redirect("/competition/" . $id);
                }                
            }elseif ($this->request->getPost("delete") && $this->security->checkToken()) {
                /*
                * Deleting submission
                */
                $directory = $competition->title . self::MARK . $competition->duedate . "/";
                if (unlink(BASE_PATH . self::SUBMISSION_PATH . $directory . $submission->files) && $submission->delete())
                {
                    $this->flashSession->success('Submission has been deleted succesfully');
                    $this->response->redirect("/competition/" . $id);
                } else {
                    foreach ($competition->getMessages() as $message)
                        $this->flash->error($message->getMessage());
                }
            }
        }
    }
}