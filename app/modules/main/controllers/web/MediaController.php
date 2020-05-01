<?php

namespace Dengarin\Main\Controllers\Web;

use Dengarin\Main\Controllers\ModuleController;

class MediaController extends ModuleController
{
    public function portfolioAction()
    {
        $this->view->setVars([
            'name' => 'Testing',
            'title' => 'Portfolio',
            'body' => 'This is body'
        ]);
    }
    public function searchAction(){
        
    }
}