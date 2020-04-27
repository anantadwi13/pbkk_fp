<?php

namespace Dengarin\Collaboration\Controllers\Web;

use Dengarin\Collaboration\Controllers\ModuleController;
use Dengarin\Main\Models\User;

class IndexController extends ModuleController
{
    public function indexAction()
    {
        echo $this->url->get(['for'=>'signin']);
    }
}