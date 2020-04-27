<?php

use Dengarin\Main\Controllers\Web\AuthController;
use Dengarin\Main\Controllers\Web\DashboardController;
use Dengarin\Main\Controllers\Web\IndexController;
use Dengarin\Main\Controllers\Web\MediaController;
use Dengarin\Main\Controllers\Web\UserController;
use Dengarin\Main\Models\User;
use Phalcon\Acl\Adapter\Memory;
use Phalcon\Acl\Enum;
use Phalcon\Di;

/** @var Di $di */
/** @var Memory $acl */


$acl = $di->get('acl');

$acl->setDefaultAction(Enum::ALLOW);

/**
 * Register Component (controller and action)
 */
$components = [
    [IndexController::class, ['index']],
    [DashboardController::class, ['index']],
    [AuthController::class, ['index', 'signup']],
    [MediaController::class, ['index']],
    [UserController::class, ['index', 'verification']],
];

foreach ($components as $component) {
    $action = [];
    if (is_array($component[1]))
        foreach ($component[1] as $accessList) $action[] = strtolower($accessList);
    else $action = $component[1];

    $acl->addComponent(strtolower($component[0]), $action);
}

/**
 * Defining Access Controls
 */
$accesses = [
    [Enum::DENY, User::ROLE_GUEST, DashboardController::class, ['index']],
    [Enum::DENY, User::ROLE_GUEST, MediaController::class, ['index']],
    [Enum::DENY, User::ROLE_GUEST, UserController::class, ['index', 'verification']],

    [Enum::DENY, User::ROLE_SOUND, UserController::class, ['index', 'verification']],

    [Enum::DENY, User::ROLE_AMPLIFIER, UserController::class, ['index', 'verification']],
];

foreach ($accesses as $access) {
    $action = [];
    if (is_array($access[3]))
        foreach ($access[3] as $accessList) $action[] = strtolower($accessList);
    else $action = $access[3];

    $controller = strtolower($access[2]);

    if ($access[0] === Enum::ALLOW) $acl->allow($access[1], $controller, $action);
    else $acl->deny($access[1], $controller, $action);
}