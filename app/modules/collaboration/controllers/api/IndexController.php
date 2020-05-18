<?php

namespace Dengarin\Collaboration\Controllers\Api;

use Dengarin\Collaboration\Controllers\ModuleController;
use Dengarin\Main\Models\User;

class IndexController extends ModuleController
{
    public function initialize(){
        $this->view->disable();
    }

    public function indexAction()
    {
        echo '{"version":1}';
    }

    public function getAction(){
        $u = User::find();
        echo json_encode($u->toArray());
    }
}