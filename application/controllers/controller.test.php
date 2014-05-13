<?php

class Test{
	
	private $templum;
	private $user_model;
	private $campaign_model;
	private $client_model;
	private $dashboard_model;
	private $session;
	private $post;
	private $base_url;
	private $gmaps_url;
	private $gmaps_key;
	private $fout;

	function __construct($templum,$user_model,&$session,&$post,$base_url,$gmaps_url,$gmaps_key){

		$this->templum=$templum;
		$this->user_model=$user_model;
		$this->session=&$session;
		$this->post=&$post;
		$this->base_url=$base_url;
		$this->gmaps_url=$gmaps_url;
		$this->gmaps_key=$gmaps_key;
		
	}
	public function index(){
		$this->render('content/maps_demo',array('gmaps_key' => $this->gmaps_key));
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