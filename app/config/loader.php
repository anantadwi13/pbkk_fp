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

    /**
     * To be used for all modules
     */
    'Dengarin\Main\Models' => APP_PATH . '/modules/main/models',
]);

$loader->registerClasses([
    'Dengarin\Challenge\Models\Submission' => APP_PATH . '/modules/challenge/models/Submission.php',
]);

$loader->register();
