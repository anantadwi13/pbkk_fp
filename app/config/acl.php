<?php

use Dengarin\Main\Models\User;
use Phalcon\Acl\Adapter\Memory;
use Phalcon\Acl\Enum;

/** @var Memory $acl */

$acl->setDefaultAction(Enum::DENY);

$acl->addRole(User::ROLE_ADMIN);
$acl->addRole(User::ROLE_AMPLIFIER);
$acl->addRole(User::ROLE_SOUND);
