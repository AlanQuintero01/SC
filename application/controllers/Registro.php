<?php



defined('BASEPATH') OR exit('No direct script access allowed');

class Registro extends My_controller {


  var $title = "Formulario de registro";
  var $description;
  var $keywords;
  var $countDesgloseRecursos = 3;
  var $countRecompensas = 5;

  function __construct()
	{
		parent::__construct();


		$this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));
    $this->load->library(array('form_validation', 'session'));


    $this->load->model('proyectos_model','modProyecto');
    $this->load->model('Uploadimage_model', 'uploadimage');
		$this->lang->load('auth');
    $this->load->helper('text');
	}


	public function index()
	{
    $title = 'Registro';
		$desc =  $desc = "La Plataforma de Crowdfunding es un mecanismo mediante el cual las Empresas 
		Sociales pueden obtener fondos en línea como una opción de financiamiento no tradicional
		a través de un esquema de aportaciones y recompensas, la cual fomentará e impulsará la cultura emprendedora.";

		$this->mViewData['title'] = $title;
		$this->mViewData['desc'] = $desc;


    $this->mViewData['tituloRegistro'] = "Formulario de Registro";

        /* Variables */
		$tables = $this->config->item('tables', 'ion_auth');

		/* Validate form input */
    $this->form_validation->set_rules('first_name', 'Nombre', 'required');
    $this->form_validation->set_rules('paterno', 'Apellido paterno', 'required');
		$this->form_validation->set_rules('materno', 'Apellido materno'); 
		$this->form_validation->set_rules('email', 'Correo', 'required|valid_email|is_unique['.$tables['users'].'.email]|matches[confirmar_email]');
		$this->form_validation->set_rules('confirmar_email', 'Confirmar correo', 'required|valid_email');
		$this->form_validation->set_rules('phone', 'Teléfono', 'required');
    // $this->form_validation->set_rules('usuario', 'Usuario', 'required');
		$this->form_validation->set_rules('perfil', 'Perfil', 'required'); 

		$this->form_validation->set_rules('password', 'Contraseña', 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[password_confirm]');
		$this->form_validation->set_rules('password_confirm', 'Confirmar contraseña', 'required');

		if ($this->form_validation->run() == TRUE)
		{
      $username = strtolower($this->input->post('usuario'));
			//$username = strtolower($this->input->post('first_name')) . ' ' . strtolower($this->input->post('last_name'));
			$email    = strtolower($this->input->post('email')); 
			$password = $this->input->post('password');

			$additional_data = array(
				'first_name' => $this->input->post('first_name'),
        'paterno'  => $this->input->post('paterno'),
				'materno'  => $this->input->post('materno'),
				'phone'      => $this->input->post('phone'),
				'telefono2'      => $this->input->post('telefono2'),
				'perfil'      => $this->input->post('perfil'),
			); 
		}

		if ($this->form_validation->run() == TRUE && $this->ion_auth->register($username, $password, $email, $additional_data))
		{
            //$this->session->set_flashdata('message', $this->ion_auth->messages());
            $this->session->set_flashdata('message', "Cuenta creada con éxito, YA PUEDES INICIAR SESIÓN");  


            /*
            #Redireccionar al mensaje de activar cuenta: cambio Martes 16 de Enero 18:39
            $token = time();
			      redirect('registro/activarcuenta/'.$token, 'refresh');
            */  

            redirect('login'); 
		}
		else
		{
      $this->mViewData['message'] = (validation_errors() ? validation_errors() : ($this->ion_auth->errors() ? $this->ion_auth->errors() : $this->session->flashdata('message')));

      $this->mViewData['first_name'] = array(
        'name'  => 'first_name',
        'id'    => 'first_name',
        'type'  => 'text',
        'class' => 'form-control',
        'placeholder' => '* Nombre',
        'value' => $this->form_validation->set_value('first_name'),
      );      

      $this->mViewData['paterno'] = array(
        'name'  => 'paterno',
        'id'    => 'paterno',
        'type'  => 'text',
        'class' => 'form-control',
        'placeholder' => '* Apellido paterno',
        'value' => $this->form_validation->set_value('paterno'),
      );			

      $this->mViewData['materno'] = array(
				'name'  => 'materno',
				'id'    => 'materno', 
				'type'  => 'text',
        'class' => 'form-control',
        'placeholder' => '* Apellido materno',
				'value' => $this->form_validation->set_value('materno'),
			);

			$this->mViewData['email'] = array(
				'name'  => 'email',
				'id'    => 'email',
				'type'  => 'email',
        'placeholder' => '* Correo electrónico',
        'class' => 'form-control',
				'value' => $this->form_validation->set_value('email'),
			);

			$this->mViewData['confirmar_email'] = array(
				'name'  => 'confirmar_email',
				'id'    => 'confirmar_email',
				'type'  => 'email',
        'class' => 'form-control',
        'placeholder' => '* Confirmar correo electrónico',
				'value' => $this->form_validation->set_value('confirmar_email'),
      );
      
      $this->mViewData['ciudad'] = array(
				'name'  => 'ciudad',
				'id'    => 'ciudad',
				'type'  => 'text',
        'class' => 'form-control',
        'placeholder' => '* Ciudad',
				'value' => $this->form_validation->set_value('ciudad'),
			);

			$this->mViewData['phone'] = array(
				'name'  => 'phone',
				'id'    => 'phone',
				'type'  => 'tel',
        'pattern' => '^((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$',
        'class' => 'form-control',
        'placeholder' => '* Teléfono celular',
				'value' => $this->form_validation->set_value('phone'),
			);

			$this->mViewData['telefono2'] = array(
				'name'  => 'telefono2',
				'id'    => 'telefono2',
				'type'  => 'tel',
        'pattern' => '^((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$',
        'class' => 'form-control',
        'placeholder' => 'Teléfono de casa/oficina',
				'value' => $this->form_validation->set_value('telefono2'),
			);


      $this->mViewData['usuario'] = array(
        'name'  => 'usuario',
        'id'    => 'usuario',
        'type'  => 'text',
        'class' => 'form-control',
        'placeholder' => 'Usuario',
        'value' => $this->form_validation->set_value('usuario'),
      );

			$this->mViewData['password'] = array(
				'name'  => 'password',
				'id'    => 'password',
				'type'  => 'password',
        'class' => 'form-control',
        'placeholder' => '* Contraseña',
				'value' => $this->form_validation->set_value('password'),
			);
			$this->mViewData['password_confirm'] = array(
				'name'  => 'password_confirm',
				'id'    => 'password_confirm',
				'type'  => 'password',
        'class' => 'form-control',
        'placeholder' => '* Confirmar contraseña',
				'value' => $this->form_validation->set_value('password_confirm'),
			);
            //$this->load->view('public/registro/formulario_registro', $this->data);

            $this->render('public/registro/formulario_registro', 'info'); 
        }
	}


  function get_slug($post_array) {
    $post_array['slug'] = $this->slugify($post_array['nombre_proyecto']);
    $post_array['etapaID'] = '1';
    return $post_array;  
  }  

  function _agregar_recompensa($primary_key , $row)
  {
    return site_url('registro/recompensas/').$row->proyectoID . "/" . $row->usuarioID; 
  }   

  public function _callback_vistaprevia_url($value, $row)
  {
    return "<a href='".site_url('proyecto/precampania/'.$row->proyectoID)."' target='_blank'>$value</a>";
  }

    function _agregar_foto($primary_key , $row)
  {
    return site_url('registro/foto/').$row->proyectoID . "/" . $row->usuarioID; 
  }       

  function _mostrar_proyectos($primary_key , $row)
  {
    return site_url('registro/proyecto'); 
  }  


      public function foto($proyectoID,$usuarioID)
  {


    $crud = $this->generate_crud("fmcf_imagenes");
    $crud->where('fmcf_imagenes'.'.proyectoID',$proyectoID);
    $crud->where('fmcf_imagenes'.'.usuarioID',$usuarioID);



        $crud->field_type('categoria','dropdown',
          array('logotipo' => 'Logotipo', "idea" => "La idea", "producto_servicio" => "Producto Servicio", "solucion" => "El problema que resuelve"));


    $crud->change_field_type('fecha_registro', 'hidden', date('Y-m-d H:i:s'));

    $crud->change_field_type('proyectoID', 'hidden', $proyectoID);
    $crud->change_field_type('usuarioID', 'hidden', $usuarioID);
    // $crud->columns('concepto','monto','cantidad','estatus');

    $crud->set_field_upload('ruta', 'assets/uploads/proyectos/2018');


    $crud->display_as('titulo','Título de la imagen');
    // $crud->display_as('usuarioID','Emprendedor');

    #Campos requeridos
    $crud->required_fields('monto_requerido','industriaID','usuarioID','etapaID','fecha_registro');
    $crud->add_action('Click para mostrar proyecto', '', '','fa fa-arrow-left',array($this,'_mostrar_proyectos'));

    $crud->unset_read();
    $crud->unset_export();
    $crud->unset_print();


    $crud->field_type('estatus','true_false');


    $crud->set_subject('Foto');

    $this->mPageTitle = 'Fotos del proyecto: ' . $this->_get_name_project($proyectoID);
    $this->render_crud();
  }    

  public function recompensas($proyectoID,$usuarioID)
  {


    $crud = $this->generate_crud("fmcf_recompensas");
    $crud->where('fmcf_recompensas'.'.proyectoID',$proyectoID);

    $crud->change_field_type('proyectoID', 'hidden', $proyectoID);
    $crud->change_field_type('usuarioID', 'hidden', $usuarioID);
    $crud->columns('concepto','monto','cantidad','estatus');

    #Relación con tabla usuarios
    // $crud->set_relation('proyectoID',$this->table,'nombre_proyecto');
    $crud->display_as('proyectoID','Proyecto');
    $crud->display_as('usuarioID','Emprendedor');

    #Campos requeridos
    $crud->required_fields('monto_requerido','industriaID','usuarioID','etapaID','fecha_registro');

    $crud->add_action('Click para mostrar proyecto', '', '','fa fa-arrow-left',array($this,'_mostrar_proyectos'));

    $crud->unset_read();
    $crud->unset_export();
    $crud->unset_print();


    $crud->field_type('estatus','true_false');


    $crud->set_subject('Recompensa');

    $this->mPageTitle = 'Recompensas del proyecto: ' . $this->_get_name_project($proyectoID);
    $this->render_crud();
  }

  function _get_name_project($proyectoID)
  {
    $nombreproyecto = $this->db->get_where('fmcf_proyectos',array('proyectoID' => $proyectoID))->row()->nombre_proyecto;
    $nombre_formato = ellipsize($nombreproyecto,33,.5);
    return $nombre_formato;
  }  

  public function proyecto()
  {

    $array_usuario = $this->session->userdata();
    $usuarioID = $this->session->userdata['user_id'];

    // print_r($array_usuario);
    // die;


    $crud = $this->generate_crud("scv2_proyectos");
    $crud->where("scv2_proyectos".'.usuarioID',$usuarioID);

    $crud->change_field_type('usuarioID', 'hidden', $usuarioID);
    $crud->change_field_type('fecha_registro', 'hidden', date('Y-m-d H:i:s'));

     $crud->change_field_type('usuarioID', 'hidden', $usuarioID);

    $crud->set_relation('industriaID','scv2_industrias','industria');
    $crud->set_relation('estado_republica_id','scv2_estadosrepublica','nombre');
    //$crud->set_relation('etapaID','proyectos_etapa','etapa');


    #IMAGEN
    $crud->set_field_upload('imagen_url', 'assets/uploads/proyectos/logos');
    #IMAGEN

    $crud->callback_before_insert(array($this,'get_slug'));

    $crud->set_subject('Proyecto');

    $crud->add_action('Agregar/Editar recompensa ', '', '','fa fa-arrow-up',array($this,'_agregar_recompensa'));
    $crud->add_action('Agregar/Editar foto ', '', '','fa fa-photo',array($this,'_agregar_foto'));
    $crud->callback_column('nombre_proyecto',array($this,'_callback_vistaprevia_url'));


    // $crud->set_relation('proyectoID','proyectos','nombre_proyecto');
    $crud->required_fields('nombre_proyecto','descripcion_corta','monto_requerido','industriaID','estado_republica_id');


    $crud->columns('nombre_proyecto','monto_requerido','fecha_registro','etapaID');
    $crud->unset_export();
    $crud->unset_print();
    $crud->unset_read();
    $crud->unset_delete();

    $crud->display_as('video_youtube','Link de tu video en Youtube');
    $crud->display_as('telefono','Teléfono');
    $crud->display_as('industriaID','Industria');
    $crud->display_as('estado_republica_id','Estado de la republica');
    $crud->display_as('etapaID','Estatus');


    // $state = $crud->getState();

    // if($state == "add"){
    // $crud->change_field_type('etapaID', 'hidden', '1');
    //       // echo "=>". $state;
    // // die; 
    // }

     error_reporting( E_ALL ); 

    $this->render_crud();
 
  }


  public function _proyecto()
  {

    $array_usuario = $this->session->userdata();
    $usuarioID = $this->session->userdata['user_id'];


    $data = array();
    $this->form_validation->set_rules('nombre_proyecto', 'Nombre de proyecto', 'required');
    $this->form_validation->set_rules('descripcion_corta', 'Descripción corta', 'required');
    $this->form_validation->set_rules('descripcion_proyecto', 'Descripción del proyecto', 'required');
    $this->form_validation->set_rules('problema_que_resuelve', 'Problema que resuelve', 'required');
    $this->form_validation->set_rules('producto_o_servicio', 'Producto o servicio', 'required');
    $this->form_validation->set_rules('monto_requerido', 'Monto Requerido', 'required');
    $this->form_validation->set_rules('industria', 'Industria', 'required');
    $this->form_validation->set_error_delimiters('<div class="alert alert-info">', '</div>');
    
        if ($this->form_validation->run() === FALSE) {
            $data["data"] = array();

            $array_industrias = $this->modProyecto->get_industrias();
            $array_estados_republica = $this->modProyecto->get_estados_republica();
            
            $this->mViewData['array_estados_republica'] = $array_estados_republica; 
            $this->mViewData['array_industrias'] = $array_industrias; 

            $this->render('public/registro/formulario_registro_proyecto', 'registro');
        } else {
            $this->modProyecto->guardarProyecto(null, $usuarioID);
            redirect(base_url());
        } 
  }

  public function editarproyecto($proyectoID=null)
  {

    $array_usuario = $this->session->userdata();
    $usuarioID = $this->session->userdata['user_id'];


    $data = array();
    $this->form_validation->set_rules('nombre_proyecto', 'Nombre del proyecto', 'required');
    $this->form_validation->set_rules('descripcion_corta', 'Descripción corta', 'required');
    $this->form_validation->set_rules('descripcion_proyecto', 'Descripción del proyecto', 'required');
    $this->form_validation->set_rules('monto_requerido', 'Monto Requerido', 'required');
    $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>');
    
      if ($this->form_validation->run() === FALSE) {

          $array_proyecto_usuario = $this->modProyecto->get_proyectos_por_usuario('', '', $proyectoID,$usuarioID);


          $array_industrias = $this->modProyecto->get_industrias();
          $array_estados_republica = $this->modProyecto->get_estados_republica();
          $this->mViewData['array_estados_republica'] = $array_estados_republica; 
          $this->mViewData['array_industrias'] = $array_industrias;   

          // echo "<pre>"; 
          // print_r($array_estados_republica);
          // die;

          if(count($array_proyecto_usuario) >= 1){
              $this->mViewData["data"] = $array_proyecto_usuario;
          } else {
            redirect('perfil');
          }
          $this->render('public/registro/formulario_editar_proyecto', 'registro');
      } else {
          $this->modProyecto->guardarProyecto($proyectoID, $usuarioID);
          redirect( base_url()); 
      } 
  }  





  function create_slug($string){
   $slug=preg_replace('/[^A-Za-z0-9-]+/', '-', $string);
   return $slug;
  }

  public function notificacion()
  {
    $this->data['title'] = "Notificaciones | Fibranest.lat";
    $this->data['description'] = "Respuesta";
    $this->data['mensaje'] = $this->session->flashdata('message');
    $this->load->view('public/usuarios/notificacion', $this->data);
  }

  public function cuenta_activa()
  {
    $this->data['title'] = "Cuenta activa | Fibranest.lat";
    $this->data['description'] = "Cuenta activa";
    $this->data['mensaje'] = $this->session->flashdata('message');
    $this->load->view('public/usuarios/cuenta_activa', $this->data);
  }

  public function activarcuenta($token = false)
  {
    if($token){
      $this->mViewData['title'] = "Registro - Activar cuenta ". $this->config->item('titulo_plataforma');
      $this->mViewData['description'] = "Activar cuenta en " . $this->config->item('nombre_plataforma');
      $this->mViewData['keywords'] = $this->config->item('keywords_plataforma');
      $this->mViewData['mensaje'] = $this->session->flashdata('message');
    } else {
      redirect("");
    }

    $this->render('public/notificaciones/activar_cuenta', 'empty'); 
  }


  /* CRUD PROYECTO */
  //////
  protected function generate_crud($table, $subject = '')
  {
    // create CRUD object
    $this->load->library('Grocery_CRUD');
    $crud = new grocery_CRUD();
    $crud->set_table($table);

    // auto-generate subject
    if ( empty($subject) )
    {
      $crud->set_subject(humanize(singular($table)));
    }

    // load settings from: application/config/grocery_crud.php
    $this->load->config('grocery_crud');
    $this->mCrudUnsetFields = $this->config->item('grocery_crud_unset_fields');

    if ($this->config->item('grocery_crud_unset_jquery'))
      $crud->unset_jquery();

    if ($this->config->item('grocery_crud_unset_jquery_ui'))
      $crud->unset_jquery_ui();

    if ($this->config->item('grocery_crud_unset_print'))
      $crud->unset_print();

    if ($this->config->item('grocery_crud_unset_export'))
      $crud->unset_export();

    if ($this->config->item('grocery_crud_unset_read'))
      $crud->unset_read();

    // foreach ($this->config->item('grocery_crud_display_as') as $key => $value)
    //   $crud->display_as($key, $value);

    // other custom logic to be done outside
    $this->mCrud = $crud;
    return $crud;
  }

  protected function unset_crud_fields()
  {
    $args = func_get_args();
    if(isset($args[0]) && is_array($args[0]))
    {
      $args = $args[0];
    }
    $this->mCrudUnsetFields = array_merge($this->mCrudUnsetFields, $args);
  }

    // Render CRUD
  protected function render_crud()
  {
    // logic specific for Grocery CRUD only
    $crud_obj_name = strtolower(get_class($this->mCrud));
    if ($crud_obj_name==='grocery_crud')
    {
      $this->mCrud->unset_fields($this->mCrudUnsetFields);  
    }

    // render CRUD
    $crud_data = $this->mCrud->render();

    // append scripts
    $this->add_stylesheet($crud_data->css_files, FALSE);
    $this->add_script($crud_data->js_files, TRUE, 'head');

    // display view
    $this->mViewData['crud_output'] = $crud_data->output;
    $this->render('crud');
  }
    //////

  
  function slugify($text)
  { 
    //$text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);


    $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $text)));
    return $slug; 
    //return strtolower(preg_replace('/[^A-Za-z0-9-]+/', '-', $text));
  }

  static public function __slugify($text)
  {
    // replace non letter or digits by -
    $text = preg_replace('~[^\pL\d]+~u', '-', $text);

    // transliterate
    $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);

    // remove unwanted characters
    $text = preg_replace('~[^-\w]+~', '', $text);

    // trim
    $text = trim($text, '-');

    // remove duplicate -
    $text = preg_replace('~-+~', '-', $text);

    // lowercase
    $text = strtolower($text);

    if (empty($text)) {
      return 'n-a';
    }

    return $text;
  }
  /* CRUD PROYECTO */


}
