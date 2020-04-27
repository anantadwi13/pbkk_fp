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
            'title' => 'Verifikasi Akun',
            'body' => 'This is body'
        ]);
    }
}