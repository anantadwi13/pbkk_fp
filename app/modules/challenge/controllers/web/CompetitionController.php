<?php

namespace Dengarin\Challenge\Controllers\Web;

use Dengarin\Challenge\Controllers\ModuleController;
use Dengarin\Challenge\Models\Competition;
use Dengarin\Challenge\Models\Submission;

class CompetitionController extends ModuleController
{
    public function indexAction()
    {
        $this->view->title = "Competition";
        /*
        * Read all competition
        */
        $this->view->competition = Competition::find();
    }
    
    public function showAction()
    {
        /*
        * Read particular competition
        */
        $id = $this->dispatcher->getParam('id');
        $competition = Competition::findFirst($id);
        $this->view->competition = $competition;
        $title = $competition->title . ' - Competition Management';
        $this->view->setVars([
            'title' => $title,
        ]);
        /*
        * Read any submission from user
        */
    }
}