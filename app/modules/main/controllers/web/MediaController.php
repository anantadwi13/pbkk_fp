<?php

namespace Dengarin\Main\Controllers\Web;

use Dengarin\Main\Controllers\ModuleController;
use Dengarin\Main\Models\User;

class MediaController extends ModuleController
{
    public function portfolioAction($username)
    {
        /** @var User $user */
        $user = User::findFirstByUsername($username);

        if ($this->isAuthenticated())
            $this->view->followed = $this->auth->getRelated('following', [
                    'conditions' => 'following_user_id = :following:',
                    'bind' => [
                        'following' => $user->id,
                    ]
                ])->count() > 0;

        if (!$user || $user->role == User::ROLE_ADMIN) {
            $this->redirectNotFound();
            return;
        }

        $this->view->user = $user;
    }

    public function searchAction()
    {
        $search = $this->request->get('search');

        if ($search) {
            $conditions = '
                role != :role: and status & ?0 != ?1 and status & ?2 = ?3 and (
                    username like ?4 or
                    name like ?5 or
                    email like ?6
                )
            ';
            $bind = [
                'role' => User::ROLE_ADMIN,
                0 => User::STATUS_DISABLED,
                1 => User::STATUS_DISABLED,
                2 => User::STATUS_VERIFIED_ACCOUNT,
                3 => User::STATUS_VERIFIED_ACCOUNT,
                4 => sprintf("%%%s%%", $this->request->get('search')),
                5 => sprintf("%%%s%%", $this->request->get('search')),
                6 => $search,
            ];
        } else {
            $conditions = 'role != :role1: and role != :role2: and status & ?0 != ?1 and status & ?2 = ?3';
            $bind = [
                'role1' => User::ROLE_ADMIN,
                'role2' => User::ROLE_AMPLIFIER,
                0 => User::STATUS_DISABLED,
                1 => User::STATUS_DISABLED,
                2 => User::STATUS_VERIFIED_ACCOUNT,
                3 => User::STATUS_VERIFIED_ACCOUNT,
            ];
        }

        $users = User::find([
            'conditions' => $conditions,
            'bind' => $bind
        ]);

        $this->view->users = $users;
    }
}