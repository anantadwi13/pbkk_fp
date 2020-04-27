<?php

namespace Dengarin\Main\Controllers\Web;

use Dengarin\Main\Controllers\ModuleController;

class DashboardController extends ModuleController
{
    public function indexAction()
    {
        $this->view->setVars([
            'name' => 'Testing',
            'title' => 'Dashboard',
            'body' => 'This is body'
        ]);
    }

    public function signOutAction(){
        $this->clearAuth();
        $this->response->redirect('/signin');
    }

    public function managementAction(){
        $this->view->setVars([
            'name' => 'Testing',
            'role' => 'Admin',
            'title' => 'Manajemen Akun',
        ]);
    }
}