<?php

/*
|--------------------------------------------------------------------------
| Controller declaration
|--------------------------------------------------------------------------
|  * User Authentication
|
*/

	$core->home=function($c){
		$c->incl('controllers/controller.home.php');
		return(new Home($c->templum,$c->user_model,$_SESSION,$_POST,$c->config->base_url));
	};
	$core->content=function($c){
		$c->incl('controllers/controller.content.php');
		return(new Content($c->templum,$c->user_model,$_SESSION,$_POST,$c->config->base_url));
	};
	$core->ajax=function($c){
		$c->incl('controllers/controller.ajax.php');
		return(new Ajax($c->user_model,$c->campaign_model,$c->client_model,$_SESSION,$_POST,$c->config->base_url));
	};
	$core->test=function($c){
		$c->incl('controllers/controller.test.php');
		return(new Test($c->templum,$c->user_model,$_SESSION,$_POST,$c->config->base_url,$c->config->gmaps_url,$c->config->gmaps_key));
	};

	$core->test=function($c){
		$c->incl('controllers/controller.email.php');
		return(new Email($c->templum, $c->user_model, $_SESSION, $_POST, $c->config->base_url));	
	};
