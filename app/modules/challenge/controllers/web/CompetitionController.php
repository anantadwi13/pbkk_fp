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
}