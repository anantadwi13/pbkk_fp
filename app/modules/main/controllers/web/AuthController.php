<?php

namespace Dengarin\Main\Controllers\Web;

use Dengarin\Main\Controllers\ModuleController;
use Dengarin\Main\Models\User;

class AuthController extends ModuleController
{
    public function initialize()
    {
        parent::initialize();
        $this->view->setLayout('auth');

        if ($this->isAuthenticated())
            $this->response->redirect('/');
    }

    public function signUpAction()
    {
        echo 'signUp';
    }

    public function signInAction(){
        if ($this->request->isPost() && $this->security->checkToken()) {
            $username = $this->request->getPost('login-username');
            $password = $this->request->getPost('login-password');

            /** @var User $user */
            $user = User::findFirst([
                'conditions' => 'username = :username:',
                'bind' => ['username' => $username]
            ]);

            if ($user && $this->security->checkHash($password, $user->password)) {
                $this->setAuth($user);
                $this->flashSession->success('Login Success!');
                $this->response->redirect('/dashboard');
            }
            else {
                $this->security->hash(rand());
                $this->flashSession->error('Credentials are incorrect');
            }
        }
    }
}