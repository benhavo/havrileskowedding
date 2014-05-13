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
		$file = fopen('log.txt','w');
		fwrite($file, print_r($this->post,true));
		fclose($file);
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
