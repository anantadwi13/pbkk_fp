<?php

return [
    'main' => [
        'className' => 'Dengarin\Main\Module',
        'path' => APP_PATH . '/modules/main/Module.php',
        'namespace' => [
            'base' => 'Dengarin\Main',
            'webController' => 'Dengarin\Main\Controllers\Web',
            'apiController' => 'Dengarin\Main\Controllers\Api'
        ],
        'routing' => [
            'useDefault' => true,
            'defaultController' => 'index',
            'defaultAction' => 'index',
        ],
    ],
    'collaboration' => [
        'className' => 'Dengarin\Collaboration\Module',
        'path' => APP_PATH . '/modules/collaboration/Module.php',
        'namespace' => [
            'base' => 'Dengarin\Collaboration',
            'webController' => 'Dengarin\Collaboration\Controllers\Web',
            'apiController' => 'Dengarin\Collaboration\Controllers\Api'
        ],
        'routing' => [
            'useDefault' => false,
            'defaultController' => 'index',
            'defaultAction' => 'index',
        ],
    ],
];
