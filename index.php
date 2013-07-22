<?php

/*
|--------------------------------------------------------------------------
| Set Root Path and Include Configuration and DI Containers
|--------------------------------------------------------------------------
*/

	$root_path=__DIR__;

	define('ROOTPATH', __DIR__);
	define('APPPATH', ROOTPATH . "/application");
	
	require_once("$root_path/application/config/config.php");
	require_once("$root_path/application/classes/class.core.php");
	require_once("$root_path/application/config/container.php");

/*
|--------------------------------------------------------------------------
| Determine Mode (Command Line or Web)
|--------------------------------------------------------------------------
*/

	$uri=(count($_SERVER['argv']) > 0) ? $_SERVER['argv'] : $_SERVER['REQUEST_URI'];
	
/*
|--------------------------------------------------------------------------
| Process Route
|--------------------------------------------------------------------------
*/
	
	if($core->route($uri)==false){
		header("HTTP/1.0 404 Not Found");
		die("404 not found");
		
	}