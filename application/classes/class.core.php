<?php

class Core {

	protected $values=array();
	
	function __construct($incl_path){
		$this->incl_path=$incl_path;
	}

	function __set($id,$value){		
		$this->values[$id]=$value;
	}

	function __get($id){
		if(!isset($this->values[$id])){
			return false;
		}
		if(is_callable($this->values[$id])){
			return $this->values[$id]($this);
		}
		else {
			return $this->values[$id];
		}
	}

	function share($callable){
		return function($c) use ($callable){
			static $object;
			if(is_null($object)){
				$object=$callable($c);
			}
			return $object;
		};
	}
	
	function route($uri,$mode='web'){
		$params=array();
		if(is_array($uri)){
			$class=$uri[1];
			$method=$uri[2];
			$params=array_slice($uri,2);	
		}
		else {
			$parts=(strlen($uri)>1) ? array_slice(explode('/',$uri),1) : array();
			$class=str_replace('-','_',(empty($parts[0])) ? 'home' : $parts[0]);
			$method=str_replace('-','_',(empty($parts[1])) ? 'index' : $parts[1]);	
			$params=array_slice($parts,2);	
		}
		if(array_key_exists($class,$this->controllers)){
			if($mode=='web' && $this->controllers[$class]==true){
				return(false);
			}
			else {
				if($this->{$class}){
					if(method_exists($this->{$class},$method)){
						call_user_func_array(array($this->{$class},$method),$params);
						return(true);
					}
				}
			}
		}
		return(false);
	}

	function add_controller($name,$command_line_only=false){

		$this->values['controllers'][$name]=$command_line_only;

	}

	function incl($file){
		require_once($this->incl_path.'/'.$file);
	}

}