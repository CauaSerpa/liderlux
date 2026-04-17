<?php

return
[
    'paths' => [
        'migrations' => __DIR__ . '/db/migrations',
        'seeds'      => __DIR__ . '/db/seeds',
    ],

    'environments' => [
        'default_migration_table' => 'phinxlog',

        'default_environment' => getenv('APP_ENV') ?: 'development',

        'development' => [
            'adapter' => 'mysql',
            'host' => getenv('DB_HOST') ?: '127.0.0.1',
            'name' => getenv('DB_DATABASE') ?: '',
            'user' => getenv('DB_USERNAME') ?: '',
            'pass' => getenv('DB_PASSWORD') ?: '',
            'port' => 3306,
            'charset' => 'utf8mb4',
        ],

        'demo' => [
            'adapter' => 'mysql',
            'host' => getenv('DB_HOST'),
            'name' => getenv('DB_DATABASE'),
            'user' => getenv('DB_USERNAME'),
            'pass' => getenv('DB_PASSWORD'),
            'charset' => 'utf8mb4',
        ],

        'production' => [
            'adapter' => 'mysql',
            'host' => getenv('DB_HOST'),
            'name' => getenv('DB_DATABASE'),
            'user' => getenv('DB_USERNAME'),
            'pass' => getenv('DB_PASSWORD'),
            'charset' => 'utf8mb4',
        ],
    ],

    'version_order' => 'creation'
];
