<?php

namespace Dengarin\Main\Controllers\Api;

use Dengarin\Main\Controllers\BaseController;
use Dengarin\Main\Models\User;

class IndexController extends BaseController
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