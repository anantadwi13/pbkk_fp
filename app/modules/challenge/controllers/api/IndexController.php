<?php

namespace Dengarin\Challenge\Controllers\Api;

use Dengarin\Challenge\Controllers\ModuleController;

class IndexController extends ModuleController
{
    public function initialize(){
        $this->view->disable();
    }

    public function indexAction()
    {
        echo '{"version":1}';
    }
}