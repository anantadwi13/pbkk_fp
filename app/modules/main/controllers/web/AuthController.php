<?php

namespace Dengarin\Main\Controllers\Web;

use Dengarin\Main\Controllers\ModuleController;
use Dengarin\Main\Models\User;
use Dengarin\Main\Models\UserData;
use Phalcon\Validation;

class AuthController extends ModuleController
{
    public function initialize()
    {
        $this->view->title = 'Sign In';

        parent::initialize();
        $this->view->setLayout('auth');

        if ($this->isAuthenticated())
            $this->response->redirect('/');
    }

    public function signUpAction()
    {
        $this->view->title = 'Sign Up';

        if ($this->request->isPost()) {

            /**
             * Validation
             */
            $validation = new Validation();
            $user = new User();

            $validation->add('username', new Validation\Validator\Uniqueness([
                'message' => "Username has been taken!",
                'model' => $user
            ]));

            $validation->add('email', new Validation\Validator\Uniqueness([
                'message' => "Email has been taken!",
                'model' => $user
            ]));

            $validation->add('password', new Validation\Validator\Confirmation([
                'message' => "Password didn't match!",
                'with' => 'password_confirm'
            ]));

            $validation->add('account_type', new Validation\Validator\InclusionIn([
                'message' => "Account type isn't valid!",
                'domain' => [1, 2],
            ]));

            $messages = $validation->validate($this->request->getPost());

            if (count($messages)) {
                foreach ($messages as $message)
                    $this->flash->error($message->getMessage());
                return;
            }

            /**
             * Creating new user
             */

            $role = $this->request->getPost('account_type') == 2 ? User::ROLE_AMPLIFIER : User::ROLE_SOUND;

            $userdata = new UserData();

            $user->assign($this->request->getPost(), ['username', 'email', 'name', 'password']);
            $user->role = $role;
            $user->data = $userdata;
            if ($user->save()) {
                $this->flashSession->success('Account has been created successfully');
                $this->response->redirect(['for' => 'signin']);
            } else
                foreach ($user->getMessages() as $message)
                    $this->flash->error($message->getMessage());
        }
    }

    public function signInAction()
    {
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
            } else {
                $this->security->hash(rand());
                $this->flashSession->error('Credentials are incorrect');
            }
        }
    }
}