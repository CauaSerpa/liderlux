<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$active_group = 'default';
$query_builder = TRUE;
$active_record = TRUE;//ci version 2.x

$db['default'] = array(
    'dsn'   => '',
    'hostname' => $_ENV['DB_HOST'] ?? getenv('DB_HOST') ?? '127.0.0.1',
    'username' => $_ENV['DB_USERNAME'] ?? getenv('DB_USERNAME') ?? '',
    'password' => $_ENV['DB_PASSWORD'] ?? getenv('DB_PASSWORD') ?? '',
    'database' => $_ENV['DB_DATABASE'] ?? getenv('DB_DATABASE') ?? '',
    'dbdriver' => 'mysqli',
    'dbprefix' => '',
    'pconnect' => FALSE,
    'db_debug' => (ENVIRONMENT !== 'production'),
    'cache_on' => FALSE,
    'cachedir' => '',
    'char_set' => 'utf8',
    'dbcollat' => 'utf8_general_ci',
    'swap_pre' => '',
    'encrypt'  => FALSE,
    'compress' => FALSE,
    'autoinit' => TRUE,
    'stricton' => FALSE,
    'failover' => array(),
    'save_queries' => TRUE
);
 