<?php

class db {

	private $con='';
	private $schema='';
	private $result='';

	public function __construct($connection){
		preg_match("~(?<type>(mysql))://(?<user>\\w.+):(?<pass>\\w.+)@(?<host>\\w.+)/(?<db>\\w.+)$~ui",$connection,$matches);
		$this->con=mysql_connect($matches['host'],$matches['user'],$matches['pass']);
		if(!$this->con) exit(mysql_error());
		mysql_select_db($matches['db'],$this->con);
	}

	public function fetch($table,$id){

		$this->schema($table);
		return($this->query("SELECT * from $table where ".$this->schema[$table]['PRIMARY_KEY'].'='.$this->escape($id).';','object')->one());

	}

	public function insert($table,$data){
		$data=(is_object($data)) ? get_object_vars($data) : $data;
		$data=$this->prep($table,$data);
		return($this->query("INSERT INTO $table (".implode(array_keys($data),',').") VALUES (".implode(array_values($data),",").");"));
	}

	public function update($table,$data = new stdClass){
		$data=(is_object($data)) ? get_object_vars($data) : $data;
		$data=$this->prep($table,$data);
		$update=array();
		foreach($data as $key=>$value){ 
			if($key!=$this->schema[$table]['PRIMARY_KEY']) {
				$update[]="$key=$value";
			}
		}

		return($this->query("UPDATE $table SET ".implode(',',$update)." WHERE ".$this->schema[$table]['PRIMARY_KEY'].'='.$data[$this->schema[$table]['PRIMARY_KEY']])->affected());

	}

	public function delete($table,$id) {
		$this->schema($table);
		return($this->query("DELETE FROM $table WHERE ".$this->schema[$table]['PRIMARY_KEY'].'='.$this->escape($id).';')->affected());
	}

	private function schema($table){
		if(empty($this->schema[$table])){
			$data=$this->query("show fields from $table;")->many();
			foreach($data as $value){
				if($value->Key=='PRI') $this->schema[$table]['PRIMARY_KEY']=$value->Field;
				$this->schema[$table][$value->Field]['type']=$value->Type;
				$this->schema[$table][$value->Field]['quoted']=(preg_match('/(varchar|char|date|time|timestamp|datetime|text)/i',$value->Type)) ? true : false;
			}
		}
		return true;
	}

	public function query($sql){
		if($result = mysql_query($sql)){
			if(preg_match('/(SELECT|SHOW)/i',$sql)){
				$res=array();
				if (mysql_num_rows($result)>0){
					while ($row = mysql_fetch_array($result,MYSQL_ASSOC)) {
						$res[]=(object) $row;
					}
				}
				unset($result);
				$this->result=$res;
				return $this;
			}
			elseif(preg_match('/(UPDATE|DELETE|LOAD)/i',$sql)){
				return(mysql_affected_rows());
			}
			elseif(preg_match('/(INSERT)/i',$sql)){
				return(mysql_insert_id());
			}
		}
		else {
			echo(mysql_error());
			return false;
		}
	}

	public function escape($str){
		return(mysql_real_escape_string($str));
	}

	private function prep($table,$data){

		$this->schema($table);

		foreach($data as $key=>$value){
			if($this->schema[$table][$key]['quoted']==true){
				if(!preg_match('/(now\(\)|curdate\(\)|curtime\(\))/i',$value)){
					$data[$key]="'".$this->escape($value)."'";
				}
				else {
					if($value!=''){
						$data[$key]=$this->escape($value);
					}
					else {
						unset($data[$key]);
					}
				}
			}
			else {
				if($value!=''){
					$data[$key]=$this->escape($value);
				}
				else {
					unset($data[$key]);
				}
			}
		}

		return($data);
	}

	public function one(){

		if(count($this->result)>0){
			return((object) $this->result[0]);
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

	public function series(){

		if(count($this->result)>0){
			$res2=array();
			foreach($this->result as $key=>$value){
				$tmp=array_values(get_object_vars($value));
				$res2[]=$tmp[0];
			}
			return(implode(',',$res2));
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