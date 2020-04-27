<?php


namespace App\Common\Controllers;

use App\Utils\Sidebar\Item\Anchor;
use App\Utils\Sidebar\Item\SubMenu;
use App\Utils\Sidebar\Menu;
use Phalcon\Mvc\Controller;

class AppController extends Controller
{
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

    /**
     * @param Menu|null $sidebar
     */
    public function setSideBar($sidebar)
    {
        $this->view->sidebar = $sidebar;
    }
}