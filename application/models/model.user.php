<?php


class User_Model {

	private $db;

	public function __construct($db){

		$this->db=$db;

	}

	public function authenticate($email,$password){

		$bind=array(
			':password'=>$password
		);

		$auth="
			SELECT id,uname,role_id
			FROM users
			WHERE pword=:password
		";

		if($user=$this->db->run($auth,$bind)->one()){
			return(true);
		/*	$user->rights=new stdClass;

			if($rights=$this->get_user_rights($user->role_id)){
		
				foreach($rights as $key=>$value){
					$user->rights->{$value->right_tag}=true;
				}

			} else {
				$user->rights->default=true;
			}

			return($user);
			$this->db->update('users',array('last_access'=>date("Y-m-d H:m:s")),"id =". $user->id);*/
		}
		else {
			return(false);
		}
		
	}

	public function get_user_rights($role_id){

		$bind=array(
			':role_id'=>$role_id
		);

		$rights="
			SELECT 
			ur.right_tag
			FROM users_rights ur
			JOIN users_roles_rights urr on ur.id=urr.right_id
			WHERE urr.role_id=:role_id
		";

		return($this->db->run($rights,$bind)->many());

	}

	public function get_users($role=NULL){

		$user_sql = "
			SELECT u.*,r.role_name,c.name as client_name,c.id as client_id
			FROM users u
			JOIN users_roles r ON u.role_id = r.id
			JOIN clients c ON u.client_id = c.id
			ORDER BY c.name
		";

		return($this->db->run($user_sql)->many());

	}

	public function get_user($user_id){

		$bind=array(
			':user_id'=>$user_id
		);

		$user_sql = "
			SELECT u.*,r.role_name,c.name as client_name
			FROM users u
			JOIN users_roles r ON u.role_id = r.id
			JOIN clients c ON u.client_id = c.id
			WHERE u.id = :user_id
		";

		return($this->db->run($user_sql,$bind)->one());

	}

	public function ins_user($data){
		if($this->db->insert('users',$data)) {
			return($this->db->lastInsertId('id'));
		} else {
			return false;
		}
		

	}

	public function ins_dummy_pool_user($data) {
		if($this->db->insert('pool',$data)) {
			return($this->db->lastInsertId('id'));
		} else {
			return false;
		}

	}

	public function upd_user($data,$user_id){

		return($this->db->update('users',$data,"id = $user_id"));

	}

	public function get_roles(){

		$role_sql = "
			SELECT *
			FROM users_roles
		";

		return($this->db->run($role_sql)->many());

	}

	public function get_roles_rights($role_id=NULL){

		$bind=array(
			':role_id'=>$role_id
		);

		if(!is_null($role_id)) {
			$where = "WHERE rl.id=$role_id";
		} else {
			$where = '';
		}
		
		$role_sql = "
			SELECT rl.id AS role_id,rr.right_id,rl.role_name,
				rt.right_name,rt.right_description,rt.right_tag
			FROM users_roles rl 
			LEFT JOIN users_roles_rights rr ON rl.id = rr.role_id
			LEFT JOIN users_rights rt ON rt.id = rr.right_id
			$where
			ORDER BY rr.role_id
		";
		
		$roles = $this->db->run($role_sql,$bind)->many();
		$roles_array = array();

		$current_role_id = $roles[0]->role_id;
		$roles_array[$current_role_id] = new stdClass;

		foreach ($roles as $key => $value) {
			
			$right = new stdClass;
			
			if($value->role_id == $current_role_id){

				$right->right_id = $value->right_id;
				$right->right_name = $value->right_name;
				$right->right_description = $value->right_description;
				$right->right_tag = $value->right_tag;
				//$roles_array[$current_role_id] = new stdClass;
				$roles_array[$current_role_id]->role_name = $value->role_name;
				$roles_array[$current_role_id]->role_id = $value->role_id;

				$roles_array[$current_role_id]->rights[$key] = $right;

			} else {

				$current_role_id = $value->role_id;
				$right->right_id = $value->right_id;
				$right->right_name = $value->right_name;
				$right->right_description = $value->right_description;
				$right->right_tag = $value->right_tag;
				$roles_array[$current_role_id] = new stdClass;
				$roles_array[$current_role_id]->role_name = $value->role_name;
				$roles_array[$current_role_id]->role_id = $value->role_id;
				$roles_array[$current_role_id]->rights[$key] = $right;
				
			}
		}

		$roles_array = array_values($roles_array);
		return($roles_array);
	}

	public function ins_role($data) {
		$this->db->insert('users_roles',array('role_name'=>$data->role_name));
		$role_id = $this->db->lastInsertId('id');

		if(!empty($data->role_rights)) {
			foreach($data->role_rights as $key=>$value) {
				$this->db->insert('users_roles_rights',array('role_id'=>$role_id,'right_id'=>$value));
			}
		}
		return($role_id);
	}

	public function upd_role($data) {
		$this->db->update('users_roles',array('role_name'=>$data->role_name),"id=$data->role_id");
		
		$this->db->delete('users_roles_rights',"role_id=$data->role_id");

		if(!empty($data->role_rights)) {
			foreach($data->role_rights as $key=>$value) {
				$this->db->insert('users_roles_rights',array('role_id'=>$data->role_id,'right_id'=>$value));
			}
		}

		return($data->role_id);
	}

	public function get_rights($right_id=NULL) {
		$bind=array(
			':right_id'=>$right_id
		);

		if(!is_null($right_id)) {
			$where = "WHERE id = :right_id";
		} else {
			$where = '';
		}

		$rights="
			SELECT *, id as right_id
			FROM users_rights
			$where
		";

		return($this->db->run($rights,$bind)->many());
	}

	public function ins_right($data) {
		return($this->db->insert('users_rights',$data));
	}

	public function upd_right($data) {
		$right_id = $data['right_id'];
		unset($data['right_id']);
		return($this->db->update('users_rights',$data,"id=$right_id"));
	}


}