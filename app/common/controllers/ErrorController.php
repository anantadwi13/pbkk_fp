<?php
declare(strict_types=1);

namespace App\Common\Controllers;

class ErrorController extends AppController
{
    public function initialize()
    {
        $this->view->setLayout('error');
    }

    public function notFoundAction()
    {
//        echo '404 - not found';
    }

    public function serverErrorAction()
    {
//        echo 'Server Error';
    }

}

