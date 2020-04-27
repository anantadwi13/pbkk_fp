<?php


namespace App\Common\Controllers;

use Dengarin\Main\Models\User;
use Phalcon\Acl\Adapter\Memory;
use Phalcon\Mvc\Controller;

/**
 * Class AppController
 *
 * @property Memory $acl
 * @property User|null $auth
 */
class AppController extends Controller
{
    protected $auth;

    public function initialize()
    {
        $this->attachAuth();
    }

    public function setAuth(User $user)
    {
        $this->clearAuth();
        $this->session->set('auth', $user);
    }

    private function attachAuth()
    {
        $this->auth = $this->auth();
        $this->view->setVar('auth', $this->auth);
    }

    public function clearAuth()
    {
        $this->auth = null;
        $this->session->remove('auth');
        $this->view->setVar('auth', null);
    }

    /**
     * @return User|null
     */
    public function auth()
    {
        return $this->session->get('auth', null);
    }

    public function isAuthenticated()
    {
        $user = $this->auth();
        if ($user)
            return true;
        return false;
    }

}