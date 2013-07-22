<?php

//http://www.imavex.com/php-pdo-wrapper-class/
//$mysql = new db("mysql:host=127.0.0.1;port=8889;dbname=mydb", "dbuser", "dbpasswd");
//$sqlite = new db("sqlite:db.sqlite");

function db_error($error){

	echo($error);
	exit;
}

class db extends PDO {

	private $error;
	private $sql;
	private $bind;
	private $errorCallbackFunction;
	private $errorMsgFormat;
	public $result;

	public function __construct($dsn, $user="",$passwd="") {

		$options = array(PDO::ATTR_PERSISTENT=>false,PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION);

		try {
			parent::__construct($dsn, $user, $passwd, $options);
		} 
		catch (PDOException $e) {
			$this->error = $e->getMessage();
		}

	}

	private function debug(){

		if(!empty($this->errorCallbackFunction)) {
			$error = array("Error" => $this->error);
			if(!empty($this->sql))
				$error["SQL Statement"] = $this->sql;
			if(!empty($this->bind))
				$error["Bind Parameters"] = trim(print_r($this->bind, true));

			$msg = "";
			if($this->errorMsgFormat == "html") {

				$css=".db-error, .db-error pre  { font: 12px Arial, Helvetica, sans-serif; }";
				$css.=".db-error { padding: 0.75em;margin: 0.75em;border: 1px solid #990000;max-width: 400px;color: #990000;background-color: #FDF0EB;-moz-border-radius: 0.5em;-webkit-border-radius: 0.5em;}";
				$css.=".db-error h3 { margin: 0; padding-bottom: 0.25em; border-bottom: 1px solid #990000; }";
				$css.=".db-error label { display: block;padding-top: 1em;font-weight: bold;}";
				$css.=".db-error pre { margin: 0;}";

				if(!empty($error["Bind Parameters"]))
					$error["Bind Parameters"] = "<pre>" . $error["Bind Parameters"] . "</pre>";
				$msg .= '<style type="text/css">' . "\n" . $css . "\n</style>";
				$msg .= "\n" . '<div class="db-error">' . "\n\t<h3>SQL Error</h3>";
				foreach($error as $key => $val)
					$msg .= "\n\t<label>" . $key . ":</label>" . $val;
				$msg .= "\n\t</div>\n</div>";
			}
			elseif($this->errorMsgFormat == "text") {
				$msg .= "SQL Error\n" . str_repeat("-", 50);
				foreach($error as $key => $val)
					$msg .= "\n\n$key:\n$val";
			}

			$func = $this->errorCallbackFunction;
			$func($msg);
		}

	}

	public function delete($table,$where,$bind=""){

		$sql = "DELETE FROM " . $table . " WHERE " . $where . ";";
		$this->run($sql,$bind);

	}

	private function filter($table,$info) {

		$driver = $this->getAttribute(PDO::ATTR_DRIVER_NAME);

		if($driver == 'sqlite') {

			$sql = "PRAGMA table_info('" . $table . "');";
			$key = "name";

		}
		elseif($driver == 'mysql') {

			$sql = "DESCRIBE " . $table . ";";
			$key = "Field";

		}
		else {	

			$sql = "SELECT column_name FROM information_schema.columns WHERE table_name = '" . $table . "';";
			$key = "column_name";

		}	

		if(false!==($list=$this->run($sql)->many())){
			$fields = array();
			foreach($list as $record){
				$fields[] = $record->{$key};
			}
				
			return array_values(array_intersect($fields, array_keys($info)));

		}

		return array();

	}

	private function cleanup($bind) {

		if(!is_array($bind)){

			if(!empty($bind)){
				$bind = array($bind);
			}
			else {
				$bind = array();
			}

		}

		return $bind;

	}

	public function insert($table,$info){

		$fields = $this->filter($table, $info);
		$sql = "INSERT INTO " . $table . " (" . implode($fields, ", ") . ") VALUES (:" . implode($fields, ", :") . ");";
		
		$bind = array();

		foreach($fields as $field){
			$bind[":$field"] = $info[$field];
		}

		return $this->run($sql, $bind);

	}

	public function run($sql,$bind="") {

		$this->sql = trim($sql);
		$this->bind = $this->cleanup($bind);
		$this->error = "";

		try {

			$pdostmt = $this->prepare($this->sql);

			if($pdostmt->execute($this->bind) !== false) {

				if(preg_match("/^(" . implode("|", array("select", "describe", "pragma", "show")) . ") /i", $this->sql)){
					$this->result=$pdostmt->fetchAll(PDO::FETCH_OBJ);
					return($this);
					//return $pdostmt->fetchAll(PDO::FETCH_OBJ);
				}
				elseif(preg_match("/^(" . implode("|", array("insert")) . ") /i", $this->sql)){
					$this->result=$this->lastInsertId();
					return($this);
					//return $pdostmt->rowCount();
				}
				elseif(preg_match("/^(" . implode("|", array("delete", "load", "update")) . ") /i", $this->sql)){
					$this->result=$pdostmt->rowCount();
					return($this);
					//return $pdostmt->rowCount();
				}

			}

		} catch (PDOException $e) {
			$this->error = $e->getMessage();	
			$this->debug();
			return false;
		}
	}

	public function select($table, $where="", $bind="", $fields="*") {
		$sql = "SELECT " . $fields . " FROM " . $table;
		if(!empty($where))
			$sql .= " WHERE " . $where;
		$sql .= ";";
		return $this->run($sql, $bind);
	}

	public function setErrorCallbackFunction($errorCallbackFunction, $errorMsgFormat="html") {
		
		//Variable functions for won't work with language constructs such as echo and print, so these are replaced with print_r.
		if(in_array(strtolower($errorCallbackFunction), array("echo", "print")))
			$errorCallbackFunction = "print_r";

		if(function_exists($errorCallbackFunction)) {
			$this->errorCallbackFunction = $errorCallbackFunction;	
			if(!in_array(strtolower($errorMsgFormat), array("html", "text")))
				$errorMsgFormat = "html";
			$this->errorMsgFormat = $errorMsgFormat;	
		}	
		
	}

	public function update($table, $info, $where, $bind="") {
		$fields = $this->filter($table, $info);
		$fieldSize = sizeof($fields);

		$sql = "UPDATE " . $table . " SET ";
		for($f = 0; $f < $fieldSize; ++$f) {
			if($f > 0)
				$sql .= ", ";
			$sql .= $fields[$f] . " = :update_" . $fields[$f]; 
		}
		$sql .= " WHERE " . $where . ";";

		$bind = $this->cleanup($bind);
		foreach($fields as $field)
			$bind[":update_$field"] = $info[$field];
		
		return $this->run($sql, $bind);
	}

	public function one(){
		
		if(count($this->result)>0){
			return($this->result[0]);
		}
		else {
			return false;
		}

	}

	public function many(){

		if(count($this->result)>0){
			return($this->result);
		}
		else {
			return false;
		}

	}

	public function id(){

		return($this->result);

	}

	public function affected(){

		return($this->result);

	}

}

