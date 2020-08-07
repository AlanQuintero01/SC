<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Proyectos_model extends CI_Model {

    var $table = 'proyectos'; 

    public function __construct()
    {
        parent::__construct();
    }



    /***************************************************************************/
    /*REGISTRO PROYECTO
    Ajuste en los campos de registro: 10:00 am Martes 16 de Enero 2018
    */  

    public function guardarProyecto($proyectoID = 0,$usuarioID)
    {
          $data = array(
              'nombre_proyecto' => $this->input->post('nombre_proyecto'),
              'descripcion_corta' => $this->input->post('descripcion_corta'),
              'descripcion_proyecto' => $this->input->post('descripcion_proyecto'),
              'monto_requerido' => $this->input->post('monto_requerido'),
              'video_youtube' => $this->input->post('video_youtube'),
              'usuarioID' => $usuarioID,
              'industriaID' => $this->input->post('industria'),
              'estado_republica_id' => $this->input->post('estado_republica'),
              'problema_que_resuelve' => $this->input->post('problema_que_resuelve'),
              'producto_o_servicio' => $this->input->post('producto_o_servicio'),
          );

          if ($proyectoID == 0) {
              return $this->db->insert($this->table, $data);
          } else {
              $this->db->where('proyectoID', $proyectoID);
              return $this->db->update($this->table, $data);
          }
    } 


    /* CONSULTAR PROYECTO */
    public function get_proyectos_by_usuario($usuarioID,$limit)
    {
        $this->db->where('usuarioID',$usuarioID);
        $this->db->order_by('proyectoID','DESC');
        $this->db->limit($limit);   
        $query = $this->db->get($this->table);
        return $query->result(); 
    }


    /* EDITAR PROYECTO */
    function get_proyectos_por_usuario($limit, $start, $proyectoID=0,$usuarioID)
    {
        if(empty($proyectoID)){
            $this->db->limit($limit, $start);
            $query = $this->db->get($this->table);
            if ($query->num_rows() > 0) {
                foreach ($query->result() as $row) {
                    $data[] = $row;
                }
                return $data;
            }
            return false;
        } else {
                $this->db->select('fmcf_proyectos.*,fmcf_industrias.industria');
                $this->db->from('fmcf_proyectos');
                $this->db->join('fmcf_industrias', 'fmcf_industrias.industriaID=fmcf_proyectos.industriaID','left');
                $this->db->where('fmcf_proyectos.proyectoID = '.$proyectoID);
                $this->db->where('fmcf_proyectos.usuarioID = '.$usuarioID);
                $query = $this->db->get();

            return $query->row_array();
        }

    } 


    public function get_estados_republica()
    {
        $this->db->order_by('nombre','ASC');
        $this->db->where("estatus", 1);
        $query = $this->db->get('fmcf_estadosrepublica');
        return $query->result(); 
    }    

    public function get_industrias()
    {
        $this->db->order_by('industria','ASC');
        $this->db->where("estatus", 1);
        $query = $this->db->get('fmcf_industrias');
        return $query->result(); 
    }

    #CONSULTAR PROYECTO
    public function get_proyecto_por_id($proyectoID)
    {
        $this->db->select('fmcf_proyectos.usuarioID,fmcf_proyectos.nombre_proyecto,fmcf_proyectos.descripcion_corta,fmcf_proyectos.descripcion_proyecto,fmcf_proyectos.producto_o_servicio,fmcf_proyectos.problema_que_resuelve,fmcf_proyectos.desglose_recursos, fmcf_proyectos.monto_requerido,fmcf_proyectos.imagen_url,fmcf_proyectos.video_youtube,fmcf_users.first_name');
        $this->db->from($this->table);
        $this->db->join('fmcf_users', 'fmcf_proyectos.usuarioID = fmcf_users.id');
        $this->db->where('proyectoID',$proyectoID);
        $query = $this->db->get();
        return $query->result();
    }      

    public function get_proyecto_por_slug($slug)
    {
        $this->db->select('fmcf_proyectos.proyectoID, fmcf_proyectos.usuarioID,fmcf_proyectos.nombre_proyecto,fmcf_proyectos.descripcion_corta,fmcf_proyectos.descripcion_proyecto,fmcf_proyectos.producto_o_servicio,fmcf_proyectos.problema_que_resuelve,fmcf_proyectos.desglose_recursos, fmcf_proyectos.monto_requerido,fmcf_proyectos.imagen_url,fmcf_proyectos.video_youtube, fmcf_proyectos.leyenda_recompensas, fmcf_users.first_name');
        $this->db->from($this->table);
        $this->db->join('fmcf_users', 'fmcf_proyectos.usuarioID = fmcf_users.id');
        $this->db->where('slug',$slug);
        $query = $this->db->get();
        return $query->result(); 
    }  

    public function get_recompensas_by_proyecto($proyectoID)
    {
        $this->db->where('proyectoID',$proyectoID);
        $this->db->where('estatus',1);
        $this->db->order_by('monto','ASC');
        $query = $this->db->get('fmcf_recompensas'); 

        //echo $this->db->last_query();    
        return $query->result();   
    }    


    public function get_fotos_by_proyecto($proyectoID,$categoria)
    {
        $this->db->where('proyectoID',$proyectoID);
        $this->db->where('categoria',$categoria);
        $this->db->where('estatus',1);
        $query = $this->db->get('fmcf_imagenes');
        return $query->result();  
    }
    #CONSULTAR PROYECTO

    #INSERT

    public function _registro_proyecto($data){
        $this->db->insert($this->table, $data);
    }
    public function registro_proyecto($data){
        $this->db->insert($this->table, $data);

        $insertId = $this->db->insert_id();
        return  $insertId;
    }

    public function registro_desglose_recursos($data)
    {
      $this->db->insert('desglose_recursos', $data);
      return $this->db->insert_id();
    }

    public function registro_recompensas($data)
    {
      $this->db->insert('recompensas', $data);
      return $this->db->insert_id();
    }

    public function registro_redessociales($data){
        $this->db->insert("redes_sociales", $data);
    } 


    public function get_proyecto_by_slug($slug)
    {
        $this->db->where('slug',$slug);
        $query = $this->db->get($this->table);
        return $query->result();
    }

    public function get_project_by_id($proyectoID)
    {
        $this->db->where('proyectoID',$proyectoID);
        $query = $this->db->get($this->table);
        return $query->result();
    }    

    public function get_usuario_by_id($usuarioID)
    {
        $this->db->where('id',$usuarioID);
        $query = $this->db->get("users");
        return $query->result(); 
    }



        public function total_aportacion_por_recompensaID($proyectoID,$recompensaID)
    {
        $this->db->select('COUNT(recompensaID) As recompensasElegidas');
        $this->db->from('fmcf_aportaciones');
        $this->db->where('proyectoID',$proyectoID);
        $this->db->where('recompensaID',$recompensaID);
        $query = $this->db->get();
        return $query->row();
    }


    public function get_desglose_por_proyecto($proyectoID)
    {
        $this->db->where('proyectoID',$proyectoID);
        $query = $this->db->get('desglose_recursos');
        return $query->result();  
    }

    public function get_recompensas_by_recompensaid($recompensaID)
    {
        $this->db->where('recompensaID',$recompensaID);
        $query = $this->db->get('recompensas');
        return $query->result();
    }

    public function puntos_atractivos($proyectoID)
    {
        $this->db->where('proyectoID',$proyectoID);
        $query = $this->db->get("puntos_atractivos");
        return $query->result();
    }

    public function get_proyecto_by_id($proyectoID)
    {
        $this->db->where('proyectoID',$proyectoID);
        $query = $this->db->get($this->table);
        return $query->result();
    }

    public function get_sum_intencion_aportacion($proyectoID)
    {

        $query = $this->db->select_sum('monto', 'Total');
        $this->db->where('proyectoID',$proyectoID);
        $query = $this->db->get('intencion_aportacion');
        $result = $query->result();

        return $result[0]->Total;
    }

    public function obtener_aportacion_by_proyecto_id($proyectoID)
    {
        $this->db->select_sum('total','montoRecaudado');;
        $this->db->from('fmcf_aportaciones');
        $this->db->where('proyectoID',$proyectoID);
        $query = $this->db->get();
        $result = $query->result();

        //echo $this->db->last_query();
        return $result[0]->montoRecaudado;
    } 

    public function get_sum_aportacion($proyectoID)
    {

        $query = $this->db->select_sum('monto', 'Total');
        $this->db->where('proyectoID',$proyectoID);
        $query = $this->db->get('aportaciones');
        $result = $query->result();

        return $result[0]->Total;
    }

    public function get_proyectos()
    {
        $this->db->order_by('proyectoID','DESC');
        $query = $this->db->get($this->table);
        return $query->result();
    }    

    public function get_proyectos_activos()
    {
        // $this->db->order_by('proyectoID','DESC');
        // $this->db->where("etapaID", 4);
        // $query = $this->db->get($this->table);
        // return $query->result();



        $this->db->select('*');
        $this->db->from('fmcf_proyectos');
        $this->db->join('fmcf_industrias', 'fmcf_proyectos.industriaID = fmcf_industrias.industriaID');
        $this->db->where("etapaID", 4);
        $query = $this->db->get();
        return $query->result(); 
    }

    public function get_casos_de_exito()
    {
        $this->db->select('*');
        $this->db->from('fmcf_proyectos');
        $this->db->join('fmcf_industrias', 'fmcf_proyectos.industriaID = fmcf_industrias.industriaID');
        $this->db->where("etapaID", 7);
        $query = $this->db->get(); 
        return $query->result(); 
    }   

    public function _get_proximos_proyectos()
    {
        $this->db->order_by('proyectoID','DESC');
        $this->db->where("estatus", 1);
        $this->db->where("proyecto_estatus", "proximamente");
        $query = $this->db->get('proyectos');
        return $query->result();
    }

    public function get_proximos_proyectos()
    {
        $this->db->select('imagenes.nombre As nombre_foto, proyectos.nombre_proyecto, proyectos.correo, proyectos.monto_requerido, proyectos.descripcion_proyecto, proyectos.descripcion_corta, proyectos.industria, proyectos.slug');
        $this->db->from('proyectos');
        $this->db->join('imagenes', 'proyectos.proyectoID = imagenes.proyectoID');
        $this->db->where('imagenes.categoria','foto_proyecto');
        $this->db->where("proyecto_estatus", "campania");
        $query = $this->db->get();
        return $query->result();
    }

    public function get_foto_proyecto($proyectoID)
    {
        $this->db->where('proyectoID',$proyectoID);
        $query = $this->db->get('imagenes');
        return $query->result();
    }

    public function get_projects()
    {
        $this->db->order_by('proyectoID','DESC');
        $query = $this->db->get($this->table);
        return $query->result();
    }





    public function get_count_record($table)
    {
        $query = $this->db->count_all($table);
        return $query;
    }

}
