<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Uploadimage_model extends CI_Model{

  public function __construct()
  {
    parent::__construct();
    $this->load->database();
  }

  public function get_all()
  {
    $this->db->select('*');
    $this->db->from('imagenes');
    return $this->db->get()->result();
  }

  public function get_fotos_proyecto($proyectoID, $usuarioID, $categoria)
  {
    $this->db->where('proyectoID', $proyectoID);
    $this->db->where('usuarioID', $usuarioID);
    $this->db->where('categoria', $categoria);
    $query = $this->db->get("imagenes");
    return $query->result();
  }
  public function get_fotos_por_proyecto($proyectoID, $usuarioID)
  {
    $this->db->where('proyectoID', $proyectoID);
    $this->db->where('usuarioID', $usuarioID);
    //return $this->db->get('imagenes')->row();


    $query = $this->db->get("imagenes");
        //echo $this->db->last_query();
    return $query->result();


  }

  public function get_by_id($id)
  {
    $this->db->where('imagenID', $id);
    return $this->db->get('imagenes')->row();
  }

  public function insert($data)
  {
    $this->db->insert('imagenes', $data);
  }

  public function update($id, $data)
  {
    $this->db->where('imagenID', $id);
    $this->db->update('imagenes', $data);
  }

  public function delete($id)
  {
    $this->db->where('imagenID', $id);
    $this->db->delete('imagenes');
  }

}
