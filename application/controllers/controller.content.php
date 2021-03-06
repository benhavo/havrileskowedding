<?php

class Content{
	
	private $templum;
	private $user_model;
	private $campaign_model;
	private $client_model;
	private $dashboard_model;
	private $session;
	private $post;
	private $base_url;
	private $capture_client_id;
	private $fout;

	function __construct($templum,$user_model,&$session,&$post,$base_url){

		$this->templum=$templum;
		$this->user_model=$user_model;
		$this->session=&$session;
		$this->post=&$post;
		$this->base_url=$base_url;
		
	}
	function index(){

	}

	public function story(){
		$this->render('content/story',array('username' => $this->session['user']));
	}
	public function events(){
		$this->render('content/events',array('username' => $this->session['user']));
	}
	public function hotels(){
		$this->render('content/hotels',array('username' => $this->session['user']));
	}
	public function travel(){
		$this->render('content/travel',array('username' => $this->session['user']));
	}
	public function registry(){
		$this->render('content/registry',array('username' => $this->session['user']));
	}
	private function render($tpl,$args=array(),$return_str=false){

		foreach($args as $key=>$value){
			$this->templum->setVar($key,$value);
		}

		$template=$this->templum->template($tpl);

		if($return_str==false){
			echo($template->render());
		}
		else {
			return($template->render());
		}

	}

}