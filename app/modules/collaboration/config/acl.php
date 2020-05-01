<?php

use Dengarin\Collaboration\Controllers\Web\EventController;
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
    [EventController::class, ['index', 'invitation', 'create', 'update', 'delete', 'followUp']],
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
    [Enum::DENY, User::ROLE_GUEST, EventController::class, ['index', 'invitation', 'create', 'update', 'delete', 'followUp']],
    [Enum::DENY, User::ROLE_AMPLIFIER, EventController::class, ['invitation', 'create']],
];

foreach ($accesses as $access){
    $action = [];
    if (is_array($access[3]))
        foreach ($access[3] as $accessList) $action[] = strtolower($accessList);
    else $action = $access[3];

    $controller = strtolower($access[2]);

    if ($access[0] === Enum::ALLOW) $acl->allow($access[1], $controller, $action);
    else $acl->deny($access[1], $controller, $action);
}