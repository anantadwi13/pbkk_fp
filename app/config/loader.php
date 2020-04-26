<?php

use Phalcon\Config;
use Phalcon\Loader;

$loader = new Loader();

/** @var Config $config */
/**
 * We're a registering a set of directories taken from the configuration file
 */

$loader->registerNamespaces([
    'Phalcon\Db' => APP_PATH . '/lib/Phalcon/Db',
    'App\Common\Controllers' => APP_PATH . '/common/controllers',
    'App\Utils' => APP_PATH . '/utils',
]);

$loader->register();
