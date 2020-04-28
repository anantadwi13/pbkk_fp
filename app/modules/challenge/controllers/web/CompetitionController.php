<?php

namespace Dengarin\Challenge\Controllers\Web;

use Dengarin\Challenge\Controllers\ModuleController;

class CompetitionController extends ModuleController
{
    public function indexAction()
    {
        $this->view->title = "Competition";
    }
}