<?php
declare(strict_types=1);

namespace Dengarin\Collaboration\Controllers;

use App\Common\Controllers\BaseModuleController;

class ModuleController extends BaseModuleController
{
    public function initialize(){
        parent::initialize();

        $this->view->setLayoutsDir(__DIR__ . '/../resources/layouts/');
    }
}