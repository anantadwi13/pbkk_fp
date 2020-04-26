<?php

namespace Dengarin\Main\Controllers\Web;

use Dengarin\Main\Controllers\BaseController;

class IndexController extends BaseController
{
    public function indexAction()
    {
        $this->view->setVars([
            'name' => 'Testing',
            'title' => 'TItle',
            'body' => 'This is body'
        ]);
        echo "This is index of web controller";
    }
}