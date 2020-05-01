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

// auth
$router->add('/signin',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'auth',
    'action' => 'signIn',
))->setName('signin');

$router->add('/signup',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'auth',
    'action' => 'signUp',
))->setName('signup');

$router->add('/u/{username}',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'media',
    'action' => 'portfolio',
));

$router->add('/u/{username}/follow',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'user',
    'action' => 'follow',
))->setName('main-user-follow');

$router->add('/u/{username}/unfollow',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'user',
    'action' => 'unfollow',
))->setName('main-user-unfollow');

$router->add('/dashboard',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'dashboard',
    'action' => 'index',
))->setName('main-dashboard-index');

// admin

$router->add('/dashboard/user',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'user',
    'action' => 'index',
))->setName('main-user-index');

$router->add('/dashboard/user/verification',array(
    'namespace' => $webNamespace,
    'module' => $moduleName,
    'controller' => 'user',
    'action' => 'verification',
))->setName('main-user-verification');