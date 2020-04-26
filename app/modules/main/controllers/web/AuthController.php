<?php


namespace Dengarin\Main\Controllers\Web;

use Dengarin\Main\Controllers\ModuleController;

class AuthController extends ModuleController
{
    public function initialize()
    {
        parent::initialize();
        $this->view->setLayout('auth');
    }

    public function signUpAction()
    {
        echo 'signUp';
    }

    public function signInAction(){
        echo 'signIn';
    }
}