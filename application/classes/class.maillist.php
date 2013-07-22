<?php

class MailList {

	private $url;
	private $key;

	function __construct($config){
		$this->url = $config->mailgun_url;
		$this->key = $config->mailgun_key;

	}

	
	public function __get($id){
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

	public function __set($id, $value){	
		$this->values[$id]=$value;
		return 1;
	}

	public function sendMessage($recipient) {
        
        $ch = curl_init();
        $postFields = array(
                'from' => $recipient['from']
                ,'to' => $recipient['to']
                ,'subject' => $recipient['subject']
                ,'html' => $recipient['html']
                ,'recipient-variables' => $recipient['recVars']);
                
        curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
        curl_setopt($ch, CURLOPT_USERPWD, $this->key);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
        curl_setopt($ch, CURLOPT_URL, $this->url);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);

        $result = curl_exec($ch);
        curl_close($ch);

        return $result;

    }

}