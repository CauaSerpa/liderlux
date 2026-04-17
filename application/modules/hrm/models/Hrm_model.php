<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Hrm_model extends CI_Model {

   public function create_designation($data = [])
    {    
        return $this->db->insert('designation',$data);
    }

    public function update_designation($data = [])
    {
        return $this->db->where('id',$data['id'])
            ->update('designation',$data); 
    } 


     public function single_designation_data($id){
        return $this->db->select('*')
            ->from('designation')
            ->where('id', $id)
            ->get()
            ->row();
    }

    public function delete_designation($id){
        $this->db->where('id', $id)
            ->delete("designation");
        if ($this->db->affected_rows()) {
            return true;
        } else {
            return false;
        }
    }


     public function designation_list(){
        return $this->db->select('*')
                        ->from('designation')
                        ->get()
                        ->result_array();
     }

     /*employee part*/
     public function single_employee_data($id){
        return $this->db->select('a.*, b.roleid AS user_type')
            ->from('employee_history a')
            ->join('sec_userrole b','a.id = b.user_id')
            ->where('a.id', $id)
            ->get()
            ->row();
     }

    // Permission
	public function user_list(){
		$this->db->select('*');
		$this->db->from('sec_role');
        if (!$this->permission1->method('manage_employee', 'read')->access()) {
            $this->db->like('type', 'Vendedor', 'after'); // Busca "Vendedor%"
        }
		$query = $this->db->get();
		if ($query->num_rows() > 0) {
			return $query->result_array();	
		}
		return false;
	}

     public function create_employee($data = []){
          $this->db->insert('employee_history',$data);

          $id =$this->db->insert_id();
     $coa = $this->headcode();
           if($coa->HeadCode!=NULL){
                $headcode=$coa->HeadCode+1;
           }else{
                $headcode="502040001";
            }
    $c_acc=$id.'-'.$data['first_name'].''.$data['last_name'];
    $createby=$this->session->userdata('id');
    $createdate=date('Y-m-d H:i:s');
    $employee_coa = [
             'HeadCode'         => $headcode,
             'HeadName'         => $c_acc,
             'PHeadName'        => 'Employee Ledger',
             'HeadLevel'        => '3',
             'IsActive'         => '1',
             'IsTransaction'    => '1',
             'IsGL'             => '0',
             'HeadType'         => 'L',
             'IsBudget'         => '0',
             'IsDepreciation'   => '0',
             'DepreciationRate' => '0',
             'CreateBy'         => $createby,
             'CreateDate'       => $createdate,
        ];
        $this->db->insert('acc_coa',$employee_coa);

    // Loop para garantir que o user_id seja único
    while ($this->db->where('user_id', $id)->get('users')->num_rows() > 0 || 
           $this->db->where('user_id', $id)->get('user_login')->num_rows() > 0) {
        $id++;
    }

    $employee_user = [
            'user_id'       => $id,
            'last_name'     => $data['last_name'],
            'first_name'    => $data['first_name'],
            'address'       => $data['address_line_1'] ?? null,
            'phone'         => $data['phone'] ?? null,
            'status'        => '10',
        ];
        $this->db->insert('users',$employee_user);

    $employee_user_login = [
            'user_id'       => $id,
            'username'      => $data['email'],
			'password' 	    => (!empty($this->input->post('password'))?md5('gef'.$this->input->post('password')):$this->input->post('oldpassword')),
            'user_type'     => '10',
            'status'        => '10',
        ];
        $this->db->insert('user_login',$employee_user_login);

    $create_by   = $this->session->userdata('id');
    $create_date = date('Y-m-d h:i:s');
    $employee_user_role = [
            'user_id'       => $id,
            'roleid'        => $this->input->post('user_type'),
            'createby'      => $create_by,
            'createdate'    => $create_date
        ];
        $this->db->insert('sec_userrole',$employee_user_role);

        return true;
     }
     
        public function headcode(){
        $query=$this->db->query("SELECT MAX(HeadCode) as HeadCode FROM acc_coa WHERE HeadLevel='3' And HeadCode LIKE '50204000%'");
        return $query->row();

    }

      public function designation_dropdown(){
        $this->db->select('*');
        $this->db->from('designation');
        $query=$this->db->get();
        $data=$query->result();
        $list[''] = display('select_option');
        if(!empty($data)){
            foreach ($data as  $value) {
                $list[$value->id]=$value->designation;
            }
        }
        return $list;
    }

    public function update_employee($data = []){

        $employee_user = [
                'last_name'     => $data['last_name'],
                'first_name'    => $data['first_name'],
                'address'       => $data['address_line_1'] ?? null,
                'phone'         => $data['phone'] ?? null,
                'status'        => '10',
            ];
            $this->db->where('user_id',$data['id'])
                ->update('users',$employee_user);
    
        $employee_user_login = [
                'username'  => $data['email'],
            ];
            
            if (!empty($this->input->post('password'))) {
                $employee_user_login['password'] = md5('gef' . $this->input->post('password'));
            }
            
            $this->db->where('user_id', $data['id'])
                     ->update('user_login', $employee_user_login);

        $employee_user_role = [
                'roleid'        => $this->input->post('user_type')
            ];
            $this->db->where('user_id',$data['id'])
                ->update('sec_userrole',$employee_user_role);


         return $this->db->where('id',$data['id'])
            ->update('employee_history',$data); 
            
    }

       // Employee list
      public function employee_list(){
        $this->db->select('*');
        $this->db->from('employee_history');
        $this->db->order_by('id', 'DESC');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
   }

      public function employee_details($id){
        $this->db->select('a.*,b.designation');
        $this->db->from('employee_history a');
        $this->db->join('designation b','a.designation = b.id');
        $this->db->where('a.id', $id);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
   }

     public function delete_employee($id){
        $this->db->where('id', $id)
            ->delete("employee_history");
        if ($this->db->affected_rows()) {
            return true;
        } else {
            return false;
        }
    }

       // Seller list
      public function seller_list(){
        $this->db->select('*');
        $this->db->from('employee_history');
        $this->db->where('createby', $this->session->userdata('id'));
        $this->db->order_by('id', 'DESC');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
        return false;
   }

}

