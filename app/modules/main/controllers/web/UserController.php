<?php

namespace Dengarin\Main\Controllers\Web;

use App\Utils\Sidebar\Item\Anchor;
use App\Utils\Sidebar\Item\SubMenu;
use Dengarin\Main\Controllers\ModuleController;
use Dengarin\Main\Models\Friend;
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

    public function followAction($username){
        if (!$this->request->isPost()) {
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        }

        $user = User::findFirstByUsername($username);

        if (!$user){
            $this->flashSession->error('User not found!');
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        }
        elseif ($user->id == $this->auth->id){
            $this->flashSession->error('Unable to follow yourself!');
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        }

        $friend = new Friend();
        $friend->user_id = $this->auth->id;
        $friend->following_user_id = $user->id;
        $friend->enableStatus(Friend::STATUS_TAKE_ACTION | Friend::STATUS_ACCEPTED);

        if ($friend->save()){
            $this->flashSession->success('Followed ' . $user->name);
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        } else {
            $this->flashSession->error('Unable to follow ' . $user->name);
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        }
    }

    public function unFollowAction($username){
        if (!$this->request->isPost()) {
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        }

        $user = User::findFirstByUsername($username);

        if (!$user){
            $this->flashSession->error('User not found!');
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        }
        elseif ($user->id == $this->auth->id){
            $this->flashSession->error('Unable to follow user!');
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        }

        /** @var Friend $friend */
        $friend = Friend::findFirst([
            'conditions' => 'user_id = :user_id: and following_user_id = :following:',
            'bind' => [
                'user_id' => $this->auth->id,
                'following' => $user->id
            ]
        ]);

        if ($friend && $friend->delete()){
            $this->flashSession->success('Unfollowed ' . $user->name);
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        } else {
            $this->flashSession->success('Unable to unfollow ' . $user->name);
            $this->response->redirect($this->request->getHTTPReferer());
            return;
        }
    }
}