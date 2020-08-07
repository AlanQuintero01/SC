<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {
	function __construct()
    {
        parent::__construct();

		$this->load->model('proyecto_model','modProyect');    
	}

	public function index($proyectoID=null)
	{
		$title = "Social Crowd MX - Plataforma de Crowdfunding";

		$desc = "La Plataforma de Crowdfunding es un mecanismo mediante el cual las Empresas 
		Sociales pueden obtener fondos en línea como una opción de financiamiento no tradicional
		a través de un esquema de aportaciones y recompensas, la cual fomentará e impulsará la cultura emprendedora.";

		$array_activos = $this->modProyect->get_proyectos_estatus("activo");

		
		foreach($array_activos As $proyecto)
		{

			$logo = $this->modProyect->get_fotos_proyecto($proyecto->proyectoID, "logotipo");

			$array_proyectos_activos[] = array("rutaImagen" => $logo[0]->rutaImagen,
											"proyectoID" => $proyecto->proyectoID,
											"nombreProyecto" => $proyecto->nombreProyecto,
											"descripcionCorta" => $proyecto->descripcionCorta
		);
	
		}
/*
	
		echo "<pre>"; 
		print_r($array_proyectos_activos);

		die;*/

		
		$this->mViewData['array_activos'] = $array_activos; 
		$this->mViewData['title'] = $title; 
		$this->mViewData['desc'] = $desc; 
		$this->mViewData['array_proyectos_activos'] = $array_proyectos_activos; 

		$this->render('public/home/index', 'full_width');
	}

}
