<?php
declare(strict_types=1);

use Phalcon\Config;
use Phalcon\Di;
use Phalcon\Escaper;
use Phalcon\Events\Event;
use Phalcon\Flash\Direct as Flash;
use Phalcon\Flash\Session as FlashSession;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\Model\Metadata\Memory as MetaDataAdapter;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Php as PhpEngine;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Mvc\ViewBaseInterface;
use Phalcon\Session\Adapter\Stream as SessionAdapter;
use Phalcon\Session\Manager as SessionManager;
use Phalcon\Url as UrlResolver;
use Phalcon\Acl\Adapter\Memory as ACLMemory;

/**
 * Shared configuration service
 * @var Di $container
 * @var Config $config
 */
$container->setShared('config', function () use ($config) {
    return $config;
});

$container->set('urlToUri', function ($url) {
    return preg_replace("/^(https:\/\/|http:\/\/)(([?a-zA-Z0-9-.\+]{2,256}\.[a-z]{2,8}\b)|localhost)/",
        "", $url);
});

$container->setShared('request_uri', function () {
    $config = $this->getConfig();
    $base_request_uri = $this->get('urlToUri', [$config->application->baseUri]);

    return $base_request_uri == '/' ? $_SERVER['REQUEST_URI'] : str_replace($base_request_uri, '', $_SERVER['REQUEST_URI']);
});

/**
 * The URL component is used to generate all kind of urls in the application
 */
$container->setShared('url', function () {
    $config = $this->getConfig();

    $url = new UrlResolver();
    $url->setBaseUri($config->application->baseUri . '/');

    return $url;
});

$container->setShared('voltService', function (ViewBaseInterface $view) {
    $config = $this->getConfig();

    if (!is_dir($config->application->cacheDir)) {
        mkdir($config->application->cacheDir);
    }

    $compileAlways = $config->mode == 'DEVELOPMENT' ? true : false;

    $volt = new VoltEngine($view, $this);
    $volt->setOptions(
        [
            'always' => $compileAlways,
            'extension' => '.php',
            'separator' => '_',
            'stat' => true,
            'path' => $config->application->cacheDir,
            'prefix' => '-prefix-',
        ]
    );

    return $volt;
});

/**
 * Setting up the view component
 */
$container->setShared('view', function () {
    $config = $this->getConfig();

    $view = new View();
    $view->setDI($this);
    $view->setViewsDir($config->application->commonResourceDir . '/views/');
    $view->setLayoutsDir($config->application->commonResourceDir . '/layouts/');
    $view->setPartialsDir($config->application->commonResourceDir . '/partials/');
    $view->setLayout('main');
    $view->setTemplateAfter('template');
    $view->disableLevel(View::LEVEL_MAIN_LAYOUT);

    $view->registerEngines([
        '.volt' => 'voltService',
        '.phtml' => PhpEngine::class

    ]);

    return $view;
});

/**
 * Database connection is created based in the parameters defined in the configuration file
 */
$container->setShared('db', function () {
    $config = $this->getConfig();

    $class = 'Phalcon\Db\Adapter\Pdo\\' . $config->database->adapter;
    $params = [
        'host' => $config->database->host,
        'username' => $config->database->username,
        'password' => $config->database->password,
        'dbname' => $config->database->dbname,
        'port' => $config->database->port,
        'charset' => $config->database->charset
    ];

    if ($config->database->adapter == 'Postgresql' || $config->database->adapter == 'Sqlite') {
        unset($params['charset']);
    }

    return new $class($params);
});


/**
 * If the configuration specify the use of metadata adapter use it or use memory otherwise
 */
$container->setShared('modelsMetadata', function () {
    return new MetaDataAdapter();
});

/**
 * Start the session the first time some component request the session service
 */
$container->setShared('session', function () {
    $session = new SessionManager();
    $files = new SessionAdapter([
        'savePath' => sys_get_temp_dir(),
    ]);
    $session->setAdapter($files);
    $session->start();

    return $session;
});

/**
 * Register the session flash service with the Twitter Bootstrap classes
 */
$container->set('flash', function () {
    $escaper = new Escaper();
    $flash = new Flash($escaper);
    $flash->setImplicitFlush(false);
    $flash->setCssClasses([
        'error' => 'alert alert-danger',
        'success' => 'alert alert-success',
        'notice' => 'alert alert-info',
        'warning' => 'alert alert-warning'
    ]);

    return $flash;
});

/**
 * Register the session flash service with the Twitter Bootstrap classes
 */
$container->set('flashSession', function () {
    $escaper = new Escaper();
    $flash = new FlashSession($escaper, $this->get('session'));
    $flash->setCssClasses([
        'error' => 'alert alert-danger',
        'success' => 'alert alert-success',
        'notice' => 'alert alert-info',
        'warning' => 'alert alert-warning'
    ]);

    return $flash;
});

$container->setShared('dispatcher', function () {

    $eventsManager = $this->getShared('eventsManager');

    $eventsManager->attach(
        'dispatch:beforeException',
        function (Event $event, Dispatcher $dispatcher, Exception $exception) {
            // 404
            if ($exception instanceof \Phalcon\Dispatcher\Exception) {
                $config = $dispatcher->getDI()->getConfig();

                //Show error on development mode
                if ($config->mode==='DEVELOPMENT')
                    return true;

                $dispatcher->forward(
                    [
                        'namespace' => 'App\Common\Controllers',
                        'controller' => 'error',
                        'action' => 'notFound',
                    ]
                );

                return false;
            }
        }
    );

    $dispatcher = new Dispatcher();

    //Bind the EventsManager to the dispatcher
    $dispatcher->setEventsManager($eventsManager);

    return $dispatcher;

});

$container->setShared('acl', function () {
    $acl = new ACLMemory();

    include_once __DIR__ . '/acl.php';

    return $acl;
});