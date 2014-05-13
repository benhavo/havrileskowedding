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
	$config->base_url='http://www.havrileskowedding.com';

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

	//$config->db_host='havrileskoweddingcom.ipagemysql.com';
	//$config->db_user='benhavo';
	//$config->db_pass='Danielle22!';
	$config->db_host='localhost';
	$config->db_user='root';
	$config->db_pass='root';
	
	$config->db_database='wedding';
	$config->mailgun_url='https://api.mailgun.net/v2/capturehighered.mailgun.org/messages';
	$config->mailgun_key='api:key-6qusbq-jqvwn61g024bnepsc-dtp83a6';
	$config->gmaps_url='';
	$config->gmaps_key='AIzaSyAplExytwmGE58EGhy3EkvkQuZ3TCKU6KI';