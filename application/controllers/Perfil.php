<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Perfil extends MY_Controller {



	function __construct()
	{
		parent::__construct();
		$this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), 
        $this->config->item('error_end_delimiter', 'ion_auth'));
		$this->lang->load('auth'); 
        $this->load->model('proyectos_model','modProyecto');


        // Load facebook library
        $this->load->library('facebook');
        
        //Load user model
        $this->load->model('user');
	}


    function index() 
	{
        $title = 'Perfil';
		$desc =  $desc = "La Plataforma de Crowdfunding es un mecanismo mediante el cual las Empresas 
		Sociales pueden obtener fondos en línea como una opción de financiamiento no tradicional
		a través de un esquema de aportaciones y recompensas, la cual fomentará e impulsará la cultura emprendedora.";

		$this->mViewData['title'] = $title;
		$this->mViewData['desc'] = $desc;
        if ($this->ion_auth->logged_in())
        { 

            $array_usuario_sesion = $this->session->userdata();
            $array_usuario = $this->ion_auth->user()->row();

            // echo "<pre>"; 
            // print_r($array_usuario);
            // print_r($array_usuario_sesion);
            // die; 

            $nombre_usuario = $array_usuario->first_name;
            $paterno = $array_usuario->paterno; 
            $materno = $array_usuario->materno;
            $email = $array_usuario->email;
            $username = $array_usuario->username; 

            #Validar si el emprendedor tiene un proyecto registrado
            $usuarioID = $array_usuario->id;
            $array_proyecto_usuario = $this->modProyecto->get_proyectos_by_usuario($usuarioID,$limit=5);

            // echo "<pre>"; 
            // print_r($array_proyecto_usuario);
            // die;

            if(count($array_proyecto_usuario) >= 1){
               $this->mViewData['array_proyecto_usuario'] = $array_proyecto_usuario; 
            } 



            $this->mViewData['nombre_completo'] =  strtoupper($nombre_usuario . " " . $paterno . " " . $materno);
            $this->mViewData['correo'] = $email; 
            $this->mViewData['usuario'] = $username; 

            #Render
            $this->render('public/user/perfil', 'full_width');

        } else {
            redirect('login'); 
        } 

   }

}
