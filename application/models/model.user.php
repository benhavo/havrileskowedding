<?php


class User_Model {

	private $db;

	public function __construct($db){

		$this->db=$db;

	}

	public function authenticate($password){

		$auth="
			SELECT id,uname,role_id
			FROM users
			WHERE pword=$password
		";

		echo $auth;
		exit;
		if($user=$this->db->run($auth)->one()){
			return(true);
		}
		else {
			return(false);
		}
		
	}

}