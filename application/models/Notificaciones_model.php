<?php

class Notificaciones_model extends CI_Model {
    public function registrar_pago($data)
	{
		$this->db->insert('aportaciones', $data);
		return $this->db->insert_id();
	}

	public function registrar_pago_fallido($data)
	{
		$this->db->insert('aportaciones_fallidas', $data);
		return $this->db->insert_id();
	}

	function _get_aportaciones()
	{
		$this->db->from('aportaciones');
		$this->db->where('estatus','1');
		$query = $this->db->get();
		return $query->result();
	}

	function get_aportaciones()
	{
		$this->db->select('u.first_name, u.paterno, u.materno, u.email, u.telefono_celular, a.*,  p.nombreProyecto');
		$this->db->from('aportaciones a');
		$this->db->join('scv2_users u', 'a.usuarioID = u.id', 'left');
		$this->db->join('proyectos p', 'p.proyectoID = a.proyectoID', 'left');
		$this->db->order_by('fechaRegistro','DESC');
		$this->db->where('a.estatus','1');
		$query = $this->db->get();
		//echo $this->db->last_query();
		return $query->result();
	}


	function get_datatables()
	{
		$this->_get_datatables_query();
		if($_POST['length'] != -1)
		$this->db->limit($_POST['length'], $_POST['start']);
		$query = $this->db->get();
		return $query->result();
	}

	function count_filtered()
	{
		$this->_get_datatables_query();
		$query = $this->db->get();
		return $query->num_rows();
	}

	public function count_all()
	{
		$this->db->from($this->table);
		return $this->db->count_all_results();
	}


	public function get_by_id_($id)
	{
		$this->db->from($this->table);
		$this->db->where('ProyectoID',$id);
		$query = $this->db->get();
		return $query->row();
	}

	public function get_proyecto_by_id($proyectoID)
	{
		$this->db->from("nuevos_proyectos");
		$this->db->where('proyectoID',$proyectoID);
		$query = $this->db->get();
		return $query->row();
	}

	public function update($where, $data)
	{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
	}

	public function actualizar_recompensas_by_proyecto_id($where, $data)
	{
		$this->db->update('recompensas', $data, $where);
		return $this->db->affected_rows();
	}


	public function get_categorias()
	{
		$this->db->from("categorias");
		$this->db->where('Estatus',1);
		$query = $this->db->get();

		return $query->result();
	}	

	public function get_user_by_id($usuarioID)
	{
		$this->db->from("users");
		$this->db->where('id',$usuarioID);
		$query = $this->db->get();

		return $query->row(); 
	}
}