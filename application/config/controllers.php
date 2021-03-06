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
	$core->havrileskowedding=function($c){
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
