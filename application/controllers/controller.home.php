<?php

class Home {
	
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

	public function index(){
		if(!isset($this->session['user'])){
			header("location: /home/login");
			die();
		} else {
			$data = new stdClass;
			$this->render('home/home',$data);
		}
	}

	public function login(){
		if(empty($this->post)){
			$this->render('home/login',array('login_error'=>false));
		}else {
			if($user=$this->user_model->authenticate($this->post['username'],$this->post['password'])){		
				$this->session['user']=$user;
				header("location: /home");
			}
			else {
				$this->render('home/login',array('login_error'=>true,'username'=>$this->post['username']));
			}
		}
	}

	function logout(){
		unset($this->session['user']);
		header("location: /");
	}
	
	function info(){
		phpinfo();
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