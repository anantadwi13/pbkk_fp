<?php

namespace Dengarin\Main\Controllers\Web;

use Dengarin\Main\Controllers\ModuleController;

class DashboardController extends ModuleController
{
    public function indexAction()
    {
        $this->view->setVars([
            'name' => 'Testing',
            'title' => 'Title',
            'body' => 'This is body'
        ]);
    }

    public function signOutAction(){
        $this->clearAuth();
        $this->response->redirect('/signin');
    }
}