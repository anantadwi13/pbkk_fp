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

$router->add('/collaboration/event', [
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'event',
    'action' => 'index',
])->setName('collaboration-event-index');

$router->add('/api/collaboration/event', [
    'namespace' => $apiNamespace,
    'module' => $moduleName,
    'controller' => 'event',
    'action' => 'index',
])->setName('api-collaboration-event-index');

$router->add('/collaboration/event/invitation', [
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'event',
    'action' => 'invitation',
])->setName('collaboration-event-invitation');

$router->add('/collaboration/event/{id}/followup', [
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'event',
    'action' => 'followUp',
])->setName('collaboration-event-followup');

$router->add('/collaboration/event/add', [
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'event',
    'action' => 'create',
])->setName('collaboration-event-create');

$router->add('/@{username}/collaborate', [
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'event',
    'action' => 'collaborate',
])->setName('collaboration-event-collab');

$router->add('/collaboration/event/{id}/edit', [
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'event',
    'action' => 'update',
])->setName('collaboration-event-update');

$router->add('/collaboration/event/{id}/delete', [
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'event',
    'action' => 'delete',
])->setName('collaboration-event-delete');
