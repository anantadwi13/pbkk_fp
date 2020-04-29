<?php

/**
 * Custom Router
 *
 * @var array $module
 * @var string $moduleName
 */

$webNamespace = $module['namespace']['webController'];
$apiNamespace = $module['namespace']['apiController'];

/**
 *
 * Example
 *
 * $router->add('/test', [
 *      'namespace' => $webNamespace,       // $webNamespace or $apiNamespace
 *      'module' => $moduleName,            // Keep it default
 *      'controller' => 'test,
 *      'action' => 'delete',
 *      'params'=> 1
 * ]);
 *
 */

$router->add('/collaboration/event/:params', [
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'event',
    'action' => 'index',
    'params' => 1,
])->setName('collaboration-event-index');

$router->add('/collaboration/event/add', [
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'event',
    'action' => 'create',
])->setName('collaboration-event-create');

$router->add('/collaboration/event/{id}/delete', [
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'event',
    'action' => 'delete',
])->setName('collaboration-event-delete');

$router->add('/collaboration/aaaa/{username}', [
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'event',
    'action' => 'index',
])->setName('collaboration-sound-profile');
