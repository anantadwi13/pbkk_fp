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
));


// admin
$router->add('/manage_competition',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'management',
    'action' => 'index',
))->setName('challenge-manage-competition');

$router->add('/manage_competition/submission/:int',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'management',
    'action' => 'show',
    'id' => 1,
));