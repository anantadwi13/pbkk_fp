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

        $sidebar->addItem(new Anchor('Dashboard', $this->url->get(['for' => 'main-dashboard-index']), 'si si-cup'));

        switch ($role){
            case User::ROLE_SOUND:
                $sidebar
                    ->addHeading('Collaboration', 'Co')
                    ->addItem(
                        (new SubMenu('Events', 'si si-calendar'))
                            ->addItem(new Anchor('Manage Event', $this->url->get(['for' => 'collaboration-event-index'])))
//                            ->addItem(new Anchor('Calendar', $this->url->get(['for' => 'collaboration-event-index-2', 'controller'=>'aaa'])))
                    )
                    ->addItem(new Anchor('Invitation', $this->url->get('/sound'), 'si si-envelope-letter'))
                    ->addHeading('Challenge', 'Ch')
                    ->addItem(new Anchor('Kompetisi', $this->url->get('/competition'), 'si si-trophy'));
                break;
            case User::ROLE_AMPLIFIER:
                break;
            case User::ROLE_ADMIN:
                $sidebar
                    ->addHeading('Collaboration', 'Co')
//                    ->addItem(new Anchor('Sounds', $this->url->get(['for' => 'collaboration-sound-index']), 'si si-volume-2'))
                    ->addHeading('Challenge', 'Ch')
                    ->addItem(new Anchor('Kompetisi', $this->url->get('/competition'), 'si si-trophy'));
                break;
            default:
                $sidebar
                    ->addHeading('Collaboration', 'Co')
//                    ->addItem(new Anchor('Sounds', $this->url->get(['for' => 'collaboration-sound-index']), 'si si-volume-2'))
                    ->addHeading('Challenge', 'Ch')
                    ->addItem(new Anchor('Kompetisi', $this->url->get('/competition'), 'si si-trophy'));
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