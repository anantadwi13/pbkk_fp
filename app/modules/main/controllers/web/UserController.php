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
        $this->view->title = 'Kelola Pengguna';
        $this->view->users = User::find();
    }

    public function verificationAction()
    {
        if ($this->request->isPost() && $this->security->checkToken()) {
            $status = $this->request->getPost('verify')==1 ? User::STATUS_VERIFIED_ACCOUNT : User::STATUS_DISABLED;

            /** @var User $user */
            $user = User::findFirst($this->request->getPost('id'));
            if ($user) {
                $user->enableStatus($status);
                if ($user->save()) {
                    if ($status == User::STATUS_VERIFIED_ACCOUNT)
                        $this->flashSession->success('Berhasil verifikasi ' . $user->username);
                    else
                        $this->flashSession->success('Berhasil ban ' . $user->username);
                } else{
                    $this->flashSession->error('Gagal verifikasi!');
                }
                $this->response->redirect(['for'=>'main-user-verification']);
                return;
            }
        }

        $this->view->title = 'Verifikasi Pengguna';
        // find all user where status account is not verified
        $this->view->users = User::find([
            'conditions' => 'status & ?0 != ?1 and status & ?2 != ?3',
            'bind' => [
                0 => User::STATUS_VERIFIED_ACCOUNT,
                1 => User::STATUS_VERIFIED_ACCOUNT,
                2 => User::STATUS_DISABLED,
                3 => User::STATUS_DISABLED,
            ]
        ]);
    }
}