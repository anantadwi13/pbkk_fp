<?php
declare(strict_types=1);

namespace Dengarin\Challenge\Controllers;

use App\Common\Controllers\BaseModuleController;
use App\Utils\Sidebar\Item\Anchor;
use App\Utils\Sidebar\Item\SubMenu;
use Dengarin\Main\Models\User;

class ModuleController extends BaseModuleController
{
    public function initialize(){
        parent::initialize();

        $sidebar = $this->getSidebar();
        if ($this->isAuthenticated())
            switch ($this->auth->role){
                case User::ROLE_ADMIN:
                    $sidebar->addHeading('Admin', 'Ad')
                        ->addItem(
                            (new SubMenu('Pengguna', 'si si-user'))
                                ->addItem(new Anchor('Kelola', $this->url->get(['for'=>'main-user-index'])))
                                ->addItem(new Anchor('Verifikasi', $this->url->get(['for'=>'main-user-verification'])))
                        );
                    break;
            }
        $this->setSideBar($sidebar);
    }
}