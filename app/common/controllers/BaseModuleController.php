<?php


namespace App\Common\Controllers;

use App\Utils\Sidebar\Item\Anchor;
use App\Utils\Sidebar\Menu;
use Dengarin\Main\Models\User;
use Phalcon\Acl\Adapter\Memory;

/**
 * Class AppController
 *
 * @property Memory $acl
 */
class BaseModuleController extends AppController
{
    protected $auth;

    public function initialize()
    {
        $sidebar = new Menu();
        $sidebar->addItem(new Anchor('Dashboard', $this->url->get('/'), 'si si-cup'))
            ->addHeading('Collaboration', 'Co')
            ->addItem(new Anchor('Sounds', $this->url->get('/sound'), 'si si-volume-2'))
            ->addItem(new Anchor('Jadwal', $this->url->get('/calendar'), 'si si-calendar'))
            ->addItem(new Anchor('Invitation', $this->url->get('/sound'), 'si si-envelope-letter'))
            ->addHeading('Challenge', 'Ch')
            ->addItem(new Anchor('Kompetisi', $this->url->get('/competition'), 'si si-trophy'));

        $this->setSideBar($sidebar);
    }

    public function onConstruct()
    {
        $role = User::ROLE_GUEST;
        $this->attachAuth();
        if ($this->isAuthenticated())
            $role = $this->auth()->role;

        $controllerName = $this->router->getNamespaceName() . "\\" . $this->router->getControllerName() . 'Controller';
        $actionName = $this->router->getActionName();

        if (!$this->acl->isAllowed($role, strtolower($controllerName), strtolower($actionName)))
            if ($role === User::ROLE_GUEST)
                $this->response->redirect('/signin');
            else
                $this->redirectPermissionDenied();
    }

    public function setAuth(User $user)
    {
        $this->clearAuth();
        $this->session->set('auth', $user);
    }

    private function attachAuth(){
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

    public function redirectNotFound()
    {
        $this->dispatcher->forward(
            [
                'namespace' => 'App\Common\Controllers',
                'controller' => 'error',
                'action' => 'notFound',
            ]
        );
    }

    public function redirectPermissionDenied()
    {
        $this->dispatcher->forward(
            [
                'namespace' => 'App\Common\Controllers',
                'controller' => 'error',
                'action' => 'permissionDenied',
            ]
        );
    }

    /**
     * @param Menu|null $sidebar
     */
    public function setSideBar($sidebar)
    {
        $this->view->sidebar = $sidebar;
    }
}