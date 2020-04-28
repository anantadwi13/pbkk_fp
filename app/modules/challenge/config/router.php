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

// sound
$router->add('/competition',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'competition',
    'action' => 'index',
))->setName('competition');

$router->add('/competition/:int',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'competition',
    'action' => 'show',
    'id' => 1,
))->setName('per_competition');


// admin
$router->add('/manage_competition',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'management',
    'action' => 'index',
))->setName('manage_competition');

$router->add('/manage_competition/:int',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'management',
    'action' => 'show',
    'id' => 1,
))->setName('manage_submission');