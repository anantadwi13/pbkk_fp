<?php

namespace Dengarin\Main\Controllers\Web;

use Dengarin\Main\Controllers\ModuleController;

class VerifyController extends ModuleController
{
    public function verifyAction()
    {
        $this->view->setVars([
            'name' => 'Testing',
            'role' => 'Admin',
            'title' => 'Title',
            'body' => 'This is body'
        ]);
        echo "This is index of web controller";
    }
}