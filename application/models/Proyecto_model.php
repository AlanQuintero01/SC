<?php 
 class Proyecto_model extends MY_Model
 {  

    public function get_proyectos_by_id($proyectoID){
        
        $this->db->select('*');
        $this->db->from('proyectos');
        $this->db->where('proyectoID',$proyectoID); 
        $consulta = $this->db->get();
        $resultado = $consulta->result();
        //echo $this->db->last_query();
        return $resultado;    
    }  

    public function get_proyectos_estatus(){

        //$this->db->order_by('nombre','ASC');
        $this->db->where("estatus", 'activo');
        $query = $this->db->get('proyectos');
        //echo $this->db->last_query();
        return $query->result(); 
    } 

    public function get_elements_proyecto($proyectoID)
    {

        $query = $this->db->query('SELECT 
        P.nombreProyecto,
        P.descripcionCorta,
        P.idea,
        P.montoRequerido,
        P.equipo,
        P.mercado,
        P.producto,
        P.problema,
        P.impacto,
        P.ingresos
        FROM proyectos P
        WHERE P.proyectoID = "' . $proyectoID .'"
        ');
        //echo $this->db->last_query();
        return $query->result();
    } 

    public function get_videos_by_proyecto($proyectoID,$categoria)
    {
        $this->db->where('proyectoID',$proyectoID);
        $this->db->where('categoria',$categoria);
        $query = $this->db->get('videos');
        //echo $this->db->last_query();
        return $query->result();  
    }

    public function get_recompensas_proyecto($proyectoID)
    {
        $this->db->where('proyectoID',$proyectoID);
        $query = $this->db->get('recompensas');
        //echo $this->db->last_query();
        return $query->result();  
    }

    public function get_fotos_proyecto($proyectoID,$categoria)
    {
        $this->db->where('proyectoID',$proyectoID);
        $this->db->where('categoria',$categoria);
        $query = $this->db->get('imagenes');
        //echo $this->db->last_query();
        return $query->result();
    }

    public function obtener_aportacion_by_proyecto_id($proyectoID)
    {
        $this->db->select_sum('total','montoRecaudado');;
        $this->db->from('aportaciones');
        $this->db->where('proyectoID',$proyectoID);
        $this->db->where('estatus',1);
        $query = $this->db->get();
        $result = $query->result();

        //echo $this->db->last_query();
        return $result[0]->montoRecaudado;
    } 

}