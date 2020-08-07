<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Proyectos extends Admin_Controller {

    public function __construct()
    {
      parent::__construct();
      $this->load->library('form_builder');
    }	

    public function index(){

      $proyecto = $this->generate_crud('proyectos');
      $proyecto->columns('proyectoID', 'nombreProyecto', 'montoRequerido', 'fechaRegistro','estatus');
      $proyecto->field_type('estatus','dropdown',array('captura' => 'Captura', 'revision' => 'Revisión'));

      $proyecto->order_by('proyectoID','desc');
      $proyecto->change_field_type('fechaRegistro', 'hidden', date('Y-m-d H:i:s'));
      $proyecto->change_field_type('fechaCambio', 'hidden', date('Y-m-d H:i:s'));
      $proyecto->change_field_type('url', 'hidden');

      $proyecto->display_as('nombreProyecto','Nombre del proyecto'); 
      $proyecto->display_as('descripcionProyecto','Descripción del Proyecto');
      $proyecto->display_as('montoRequerido','Monto requerido');
      $proyecto->display_as('descripcionCorta','Descripcion corta');
      $proyecto->display_as('problema','Problema que resuelve');
      $proyecto->display_as('impacto','Impacto social');
      $proyecto->display_as('estatus','Estatus del proyecto');
      $proyecto->display_as('fechaRegistro','Fecha de registro');
      $proyecto->display_as('fechaCambio','Fecha de cambio');
      $proyecto->display_as('paginaWeb','Pagina web');

      $proyecto->required_fields('nombreProyecto',
                            'descripcionProyecto',
                            'montoRequerido',
                            'descripcionCorta',
                            'problema',
                            'impacto',
                            'estatus',
                            'problema');

      $proyecto->unset_read();
      $proyecto->unset_delete();
      $this->mPageTitle = 'Lista de proyectos';
      $this->render_crud();

    }

    public function captura()
    {

      $captura = $this->generate_crud('proyectos');
      $captura-> where ('estatus', 'captura');

      $captura->columns('proyectoID', 'nombreProyecto', 'montoRequerido', 'estatus');
      $captura->change_field_type('fechaCambio', 'hidden', date('Y-m-d H:i:s'));

      $captura->add_action('Agregar/Editar foto ', '', '','fa fa-photo',array($this,'_agregar_foto'));
      $captura->add_action('Agregar/Editar recompensa ', '', '','fa fa-tag',array($this,'_agregar_recompensa'));
      $captura->add_action('Agregar/Editar video ', '', '','fa fa-youtube-play',array($this,'_agregar_video'));

      $captura->field_type('estatus','dropdown',array('revision' => 'Revisión', 'activo' => 'Activo'));

      $this->mPageTitle = 'Proyectos en CAPTURA';
      
      $captura->unset_add();
      $captura->unset_read();
      $captura->unset_delete();
      $this->render_crud(); 
    }

    public function revision()
    {

      $revision = $this->generate_crud('proyectos');
      $revision-> where ('estatus', 'revision');

      $revision->columns('proyectoID', 'nombreProyecto', 'montoRequerido', 'estatus');
      
      $revision->change_field_type('fechaCambio', 'hidden', date('Y-m-d H:i:s'));

      $revision->add_action('Agregar/Editar foto ', '', '','fa fa-photo',array($this,'_agregar_foto'));
      $revision->add_action('Agregar/Editar recompensa ', '', '','fa fa-tag',array($this,'_agregar_recompensa'));
      $revision->add_action('Agregar/Editar video ', '', '','fa fa-youtube-play',array($this,'_agregar_video'));

      $revision->field_type('estatus','dropdown',array('activo' => 'Activo'));

      $this->mPageTitle = 'Proyectos en Revisión';
      
      $revision->unset_add();
      $revision->unset_read();
      $revision->unset_delete();
      $this->render_crud(); 
    }

    public function activos()
    {

      $activos = $this->generate_crud('proyectos');
      $activos-> where ('estatus', 'activo');

      $activos->columns('proyectoID', 'nombreProyecto', 'montoRequerido', 'estatus');
      
      $activos->change_field_type('fechaCambio', 'hidden', date('Y-m-d H:i:s'));

      $this->mPageTitle = 'Proyectos ACTIVOS';
      
      $activos->unset_add();
      $activos->unset_read();
      $activos->unset_delete();
      $this->render_crud(); 
    }
    
    public function recompensas($proyectoID)
	{

      $recompensas = $this->generate_crud('recompensas');

      $recompensas->columns('proyectoID', 'monto', 'descripcion','numAport', 'cantidad','fechaRegistro');
      $recompensas->where('recompensas'.'.proyectoID',$proyectoID);
      $recompensas->change_field_type('proyectoID', 'hidden', $proyectoID);

      #Campos requeridos
      $recompensas->required_fields('monto','concepto');

      $recompensas->field_type('estatus','true_false');

      $this->mPageTitle = 'Recompensas'; 
      $this->render_crud();
      }

      public function foto($proyectoID)
      {
    
      $foto = $this->generate_crud("imagenes");

      $foto->set_subject('Imagen');

      $foto->columns('proyectoID', 'categoria', 'rutaImagen');
      $foto->where('imagenes'.'.proyectoID',$proyectoID);
      $foto->change_field_type('proyectoID', 'hidden', $proyectoID);
      
      $foto->field_type('categoria','dropdown',
      array('logotipo' => 'Logotipo', "idea" => "La idea", "producto_servicio" => "Producto Servicio", "solucion" => "El problema que resuelve"));
    
      $foto->set_field_upload('rutaImagen','assets/uploads/proyectos/2019');
      $foto->display_as('rutaImagen','Ruta');


      $foto->unset_read();
      $foto->unset_export();
      $foto->unset_print();


      $foto->field_type('estatus','true_false');

      $this->mPageTitle = 'Fotos del proyecto: ';
      $this->render_crud();
    } 

    public function videos($proyectoID)
    {
  
      $video = $this->generate_crud("videos");

      $video->columns('proyectoID', 'categoria', 'url');
      $video->where('videos'.'.proyectoID',$proyectoID);
      $video->change_field_type('proyectoID', 'hidden', $proyectoID);
      
      $video->field_type('categoria','dropdown',
    array('principal' => 'Principal', "idea" => "La idea", "producto_servicio" => "Producto Servicio", "solucion" => "El problema que resuelve"));
    
      $video->display_as('url','Url de youtube');


      $video->unset_read();
      $video->unset_export();
      $video->unset_print();

      $video->field_type('estatus','true_false');

      $this->mPageTitle = 'Videos del proyecto: ';
      $this->render_crud();
    } 

    function _agregar_recompensa($primary_key , $row)
    {
      return site_url('admin/proyectos/recompensas/').$row->proyectoID; 
    } 
    
    function _agregar_foto($primary_key , $row)
	  {
		  return site_url('admin/proyectos/foto/').$row->proyectoID; 
    }  
    
    function _agregar_video($primary_key , $row)
    {
      return site_url('admin/proyectos/videos/').$row->proyectoID; 
    } 
    
}