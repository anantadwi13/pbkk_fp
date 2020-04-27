<?php

namespace Dengarin\Main\Controllers\Web;

use Dengarin\Main\Controllers\ModuleController;

class MediaController extends ModuleController
{
    public function portfolioAction()
    {
        $this->view->setVars([
            'name' => 'Testing',
            'title' => 'Title',
            'body' => 'This is body'
        ]);
        echo "This is index of web controller";
    }
}