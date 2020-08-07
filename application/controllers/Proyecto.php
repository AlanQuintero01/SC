<?php 
defined('BASEPATH') OR exit('No direct script access allowed');  
class Proyecto extends MY_Controller {          
	function __construct()     
	{         
		parent::__construct(); 
		
		$this->load->model('proyecto_model','modProyect');    
		$this->load->model('notificaciones_model','modAportacion');    
		$this->load->model('user');		
		
	}
 
	public function index($proyectoID=null)
	{

		
		
		#Validar si el usuario ha iniciado sesión
		$array_sesion_usuario = $this->ion_auth->user()->row();
		if($array_sesion_usuario == NULL){
			$this->mViewData['usuarioID'] =   		null;
			$this->mViewData['nombreUsuario'] =     null;
			$this->mViewData['usuario_paterno'] =   null;
			$this->mViewData['usuario_materno'] =   null;
			$this->mViewData['correo'] =   			null;
			$this->mViewData['usuario_telefono'] =  null;
			$this->mViewData['estatuslogin'] = 0; 
		} else {
			$this->mViewData['usuarioID'] =   		$array_sesion_usuario->id;
			$this->mViewData['nombreUsuario'] =     trim($array_sesion_usuario->first_name);
			$this->mViewData['usuario_paterno'] =   $array_sesion_usuario->paterno;
			$this->mViewData['usuario_materno'] =   $array_sesion_usuario->materno;
			$this->mViewData['correo'] =   			$array_sesion_usuario->email;
			$this->mViewData['usuario_telefono'] =  $array_sesion_usuario->telefono_celular; 
			$this->mViewData['estatuslogin'] = 1; 
		}
		
		$array_aportaciones = $this->modAportacion->get_aportaciones($proyectoID);
		/*
		echo'<pre>';
		print_r($array_aportaciones);
		die;*/

		$array_elementos = $this->modProyect->get_elements_proyecto($proyectoID);
		$array_recompensas = $this->modProyect->get_recompensas_proyecto($proyectoID);

		$array_fotos_logo = $this->modProyect->get_fotos_proyecto($proyectoID, "logotipo");

		$array_fotos_producto_servicio = $this->modProyect->get_fotos_proyecto($proyectoID, "producto_servicio");
		$array_fotos_solucion = $this->modProyect->get_fotos_proyecto($proyectoID, "solucion");
		$array_fotos_idea = $this->modProyect->get_fotos_proyecto($proyectoID, "idea");
		$array_fotos_mercado = $this->modProyect->get_fotos_proyecto($proyectoID, "mercado");
		$array_fotos_impacto = $this->modProyect->get_fotos_proyecto($proyectoID, "impacto");

		$array_videos_principal = $this->modProyect->get_videos_by_proyecto($proyectoID, "principal");
		$array_videos_idea = $this->modProyect->get_videos_by_proyecto($proyectoID, "idea");

		$youtube_id_prin = $this->youtube_parse_youtube_id($array_videos_principal[0]->url);

		if (empty($array_videos_idea)){
		}else{
			$youtube_id_idea = $this->youtube_parse_youtube_id($array_videos_idea[0]->url);

		}
		

		$montoRecaudado = $this->modProyect->obtener_aportacion_by_proyecto_id($proyectoID); 

		$montoRestante = $array_elementos[0]->montoRequerido - $montoRecaudado;

		$porcentaje = $this->porcentaje($array_elementos[0]->montoRequerido , $montoRecaudado, 2);

/*
		print_r($porcentaje);
		die;*/

		$title = 'SCMX - ' . $array_elementos[0]->nombreProyecto;
		$desc =  $array_elementos[0]->descripcionCorta;

		$this->mViewData['montoRestante'] = $montoRestante;
		$this->mViewData['title'] = $title;
		$this->mViewData['desc'] = $desc;
		$this->mViewData['montoRecaudado'] = $montoRecaudado;
		
		$this->mViewData['porcentaje'] = $porcentaje;

		$this->mViewData['array_elementos'] = $array_elementos;
		$this->mViewData['array_recompensas'] = $array_recompensas;

		$this->mViewData['array_fotos_logo'] = $array_fotos_logo;


		$this->mViewData['array_fotos_idea'] = $array_fotos_idea;
		$this->mViewData['array_fotos_producto_servicio'] = $array_fotos_producto_servicio;
		$this->mViewData['array_fotos_solucion'] = $array_fotos_solucion;
		$this->mViewData['array_fotos_mercado'] = $array_fotos_mercado;
		$this->mViewData['array_fotos_impacto'] = $array_fotos_impacto;

		$this->mViewData['array_videos_principal'] = $array_videos_principal;
		$this->mViewData['array_videos_idea'] = $array_videos_idea;
	
		$this->mViewData['youtube_id_prin'] = $youtube_id_prin;  
		$this->mViewData['youtube_id_idea'] = $youtube_id_idea;  
		
		$this->mViewData['array_aportaciones'] = $array_aportaciones;  
		 
		$this->render('public/proyecto/detalle', 'full_width');
		
	} 

	function youtube_parse_youtube_id($data){
		// IF 11 CHARS
		if( strlen($data) == 11 )
		{
				return $data;
		}
		preg_match( "/^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/", $data, $matches);
		return isset($matches[2]) ? $matches[2] : false;
	}

	#le pasamos un array como segundo argumento, estos son los parámetros
	public function _remap($method, $params = array())
	{
		//comprobamos si existe el método, no queremos que al llamar
		//a un método codeigniter crea que es un parámetro del index
		if(!method_exists($this, $method))
		{
			$this->index($method, $params);
		} else{
			return call_user_func_array(array($this, $method), $params);
		}
	} 

	function porcentaje($montoRequerido, $montoRecaudado, $redondear) {
		//return round($parte / $total * 100);
  
		$formato_monto_requerido = str_replace(',', '', $montoRequerido);
	  $formato_monto_recaudado = str_replace(',', '', $montoRecaudado);
  
		return number_format($formato_monto_recaudado / $formato_monto_requerido * 100, $redondear);
	} 

 }