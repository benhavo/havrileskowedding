<?php

/*
|--------------------------------------------------------------------------
| System-Wide PHP Settings
|--------------------------------------------------------------------------
*/

	session_start();
	//print_r($_SESSION);
	ini_set('display_errors',1);
	date_default_timezone_set('America/New_York');

/*
|--------------------------------------------------------------------------
| Config Object and Base Url (required)
|--------------------------------------------------------------------------
*/

	$config=new stdClass;
	$config->base_url='localhost:8888/havrileskowedding';

/*
|--------------------------------------------------------------------------
| Admin user client ID
|--------------------------------------------------------------------------
*/

	$config->admin_client_id = 100;

/*
|--------------------------------------------------------------------------
| Database Configuration
|--------------------------------------------------------------------------
*/

	$config->db_host='localhost:8889';
	$config->db_user='root';
	$config->db_pass='root';
	$config->db_database='db';
	// $config->mailgun_url='https://api.mailgun.net/v2/capturehighered.mailgun.org/messages';
	// $config->mailgun_key='api:key-6qusbq-jqvwn61g024bnepsc-dtp83a6';
