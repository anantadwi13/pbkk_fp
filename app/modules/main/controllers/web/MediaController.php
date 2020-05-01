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

        $this->view->followed = $this->auth->getRelated('following', [
            'conditions' => 'following_user_id = :following:',
            'bind' => [
                'following' => $user->id,
            ]
        ])->count() > 0;

        if (!$user){
            $this->redirectNotFound();
            return;
        }

        $this->view->user = $user;
    }
}