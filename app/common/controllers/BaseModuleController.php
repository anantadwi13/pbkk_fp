<?php


namespace App\Common\Controllers;

use App\Utils\Sidebar\Item\Anchor;
use App\Utils\Sidebar\Item\SubMenu;
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
    private $sidebar;

    public function initialize()
    {
        parent::initialize();

        $this->setupSideBar();
    }


    private function setupSideBar(){
        $role = User::ROLE_GUEST;
        $sidebar = new Menu();

        if ($this->isAuthenticated())
            $role = $this->auth()->role;

        switch ($role){
            case User::ROLE_SOUND:
                $sidebar
                    ->addItem(new Anchor('Dashboard', $this->url->get(['for' => 'main-dashboard-index']), 'si si-cup'))
                    ->addItem(new Anchor('Find Users', $this->url->get(['for' => 'main-media-search']), 'si si-users'))
                    ->addHeading('Collaboration', 'Co')
                    ->addItem(
                        (new SubMenu('Events', 'si si-calendar'))
                            ->addItem(new Anchor('Manage Event', $this->url->get(['for' => 'collaboration-event-index'])))
                            ->addItem(new Anchor('Invitation', $this->url->get(['for' => 'collaboration-event-invitation'])))
//                            ->addItem(new Anchor('Calendar', $this->url->get(['for' => 'collaboration-event-index-2', 'controller'=>'aaa'])))
                    )
                    ->addHeading('Challenge', 'Ch')
                    ->addItem(new Anchor('Kompetisi', $this->url->get('/competition'), 'si si-trophy'));
                break;
            case User::ROLE_AMPLIFIER:
                $sidebar
                    ->addItem(new Anchor('Dashboard', $this->url->get(['for' => 'main-dashboard-index']), 'si si-cup'))
                    ->addItem(new Anchor('Find Users', $this->url->get(['for' => 'main-media-search']), 'si si-users'))
                    ->addHeading('Collaboration', 'Co')
                    ->addItem(
                        (new SubMenu('Events', 'si si-calendar'))
                            ->addItem(new Anchor('Manage Event', $this->url->get(['for' => 'collaboration-event-index'])))
                    );
                break;
            case User::ROLE_ADMIN:
                $sidebar
                    ->addItem(new Anchor('Dashboard', $this->url->get(['for' => 'main-dashboard-index']), 'si si-cup'))
                    ->addItem(new Anchor('Find Users', $this->url->get(['for' => 'main-media-search']), 'si si-users'));
                break;
            default:
                $sidebar
                    ->addItem(new Anchor('Home', $this->url->get('/'), 'si si-home'))
                    ->addItem(new Anchor('Find Users', $this->url->get(['for' => 'main-media-search']), 'si si-users'));
        }

        $this->setSideBar($sidebar);
    }

    public function onConstruct()
    {
        $role = User::ROLE_GUEST;
        if ($this->isAuthenticated())
            $role = $this->auth()->role;

        $controllerName = $this->router->getNamespaceName() . "\\" . $this->router->getControllerName() . 'Controller';
        $actionName = $this->router->getActionName();

        if (!$this->acl->isAllowed($role, strtolower($controllerName), strtolower($actionName)))
            if ($role === User::ROLE_GUEST)
                $this->response->redirect($this->url->get(['for' => 'signin']));
            else
                $this->redirectPermissionDenied();
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
        $this->sidebar = $sidebar;
        $this->view->sidebar = $sidebar;
    }

    /**
     * @return Menu|null
     */
    public function getSidebar()
    {
        return $this->sidebar;
    }
}