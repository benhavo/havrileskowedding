<?php

/*
|--------------------------------------------------------------------------
| Container Bootstrap, Config Import and Controller/Model Inclusion
|--------------------------------------------------------------------------
*/

	$core=new Core($root_path.'/application');
	$core->config=$config;
	$core->root_path = $root_path;
	$core->db_schema = $config->db_database;

	require_once("$root_path/application/config/controllers.php");
	require_once("$root_path/application/config/models.php");

/*
|--------------------------------------------------------------------------
| Allowed Controllers -- use add_controller('name',true) for cli only
|--------------------------------------------------------------------------
*/

	$core->add_controller('home');
	$core->add_controller('content');
	$core->add_controller('havrileskowedding');

/*
|--------------------------------------------------------------------------
| Database Configuration
|--------------------------------------------------------------------------
*/

	$core->db=$core->share(function($c){

		$c->incl('classes/class.database.php');
		$mysql = new db(
			"mysql:host={$c->config->db_host};port=8889;dbname={$c->config->db_database}",
			$c->config->db_user,$c->config->db_pass
		);
		//$mysql->setErrorCallbackFunction('db_error');

		return($mysql);

	});

/*
|--------------------------------------------------------------------------
| Template Engine and HTML to PDF Rendering Engine
|--------------------------------------------------------------------------
*/

	$core->templum=$core->share(function($c){

		$c->incl('classes/class.templum.php');

		$templum=new Templum('application/views');
		$templum->setAutoEscape(False);
		$templum->setVar('user',(!empty($_SESSION['user']) ? $_SESSION['user'] : ''));
		$templum->setVar('client',(!empty($_SESSION['client']) ? $_SESSION['client'] : ''));
		$templum->setVar('clients',(!empty($_SESSION['clients']) ? $_SESSION['clients'] : ''));
		$templum->setVar('base_url',$c->config->base_url);
		return $templum;

	});

/*
|--------------------------------------------------------------------------
| Mailgun Engine
|--------------------------------------------------------------------------
*/

	$core->mailgun = $core->share(function($c){

		$c->incl('classes/class.maillist.php');
		return(new MailList($c->config));

	});
