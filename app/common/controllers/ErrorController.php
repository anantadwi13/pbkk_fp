<?php
declare(strict_types=1);

namespace App\Common\Controllers;

class ErrorController extends AppController
{
    public function initialize()
    {
        /** @var Config $config */
        $config = $this->container->getConfig();
        // Reset Base Directory Views
        $this->view->setViewsDir($config->application->commonResourceDir . '/views/');
        $this->view->setLayoutsDir($config->application->commonResourceDir . '/layouts/');
        $this->view->setPartialsDir($config->application->commonResourceDir . '/partials/');
        $this->view->setLayout('error');
    }

    public function permissionDeniedAction()
    {
        $this->response->setStatusCode(403);
    }

    public function notFoundAction()
    {
        $this->response->setStatusCode(404);
    }

    public function serverErrorAction()
    {

    }

}

