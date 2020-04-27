<?php

namespace Dengarin\Main\Controllers\Web;

use App\Utils\Sidebar\Item\Anchor;
use App\Utils\Sidebar\Item\SubMenu;
use Dengarin\Main\Controllers\ModuleController;
use Dengarin\Main\Models\User;

class UserController extends ModuleController
{
    public function indexAction()
    {
        $this->view->setVars([
            'name' => 'Testing',
            'title' => 'Dashboard',
            'body' => 'This is body'
        ]);
    }

    public function verificationAction(){

    }
}