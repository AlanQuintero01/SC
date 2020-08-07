<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));
		$this->lang->load('auth');
        $this->load->library('facebook');
        $this->load->model('user');
	}


    function index()
	{
        $title = 'Login';
		$desc =  $desc = "La Plataforma de Crowdfunding es un mecanismo mediante el cual las Empresas 
		Sociales pueden obtener fondos en línea como una opción de financiamiento no tradicional
		a través de un esquema de aportaciones y recompensas, la cual fomentará e impulsará la cultura emprendedora.";

		$this->mViewData['title'] = $title;
		$this->mViewData['desc'] = $desc;

        $userData = array();
        if($this->facebook->is_authenticated()){


             $this->session->set_userdata('estatuslogin', TRUE); 

            //echo "ok"; die;
            redirect('fblogin');  
        } else{ 
            $fbuser = '';
            $this->mViewData['authUrl'] =  $this->facebook->login_url();
        }


        if ( ! $this->ion_auth->logged_in())
        {

            /* Valid form */
            $this->form_validation->set_rules('identity', 'Usuario', 'required');
            $this->form_validation->set_rules('password', 'Password', 'required');


            if ($this->form_validation->run() == TRUE)
            {
                $remember = (bool) $this->input->post('remember');

                if ($this->ion_auth->login($this->input->post('identity'), $this->input->post('password'), $remember))
                {
                    if ( ! $this->ion_auth->is_admin())
                    {
                        $this->session->set_flashdata('message', $this->ion_auth->messages());

												#Obtener última referencia
                        $referred_from = $this->session->userdata('referred_from');
                        $array_usuario = $this->ion_auth->user()->row();

                        $this->session->set_userdata('usuario', $array_usuario->first_name);
                        $this->session->set_userdata('estatuslogin', TRUE); 

												#Redireccionar dependiendo de donde viene la sesión
												if(isset($referred_from)){
													  redirect($referred_from, 'refresh');
												} else {
													  redirect("perfil", 'refresh');
												}
                    } else {

                        $this->session->set_userdata('estatuslogin', 0); 

                        /* Data */
                        $this->mViewData['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');

                        /* Load Template */
                        $this->template->auth_render('auth/choice', $this->mViewData);
												//redirect('admin','refresh');
                    }
                } else {
                    $this->session->set_flashdata('message', $this->ion_auth->errors());
				    				redirect('login', 'refresh');
                }
            } else {
                $this->mViewData['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');

                $this->mViewData['identity'] = array(
                    'name'        => 'identity',
                    'id'          => 'identity',
                    'type'        => 'text',
					'class'				=> 'form-control',
                    'value'       => $this->form_validation->set_value('identity'),
                    'placeholder' => 'Correo electrónico',
                    'autocomplete' => 'off',
                );
                $this->mViewData['password'] = array(
                    'name'        => 'password',
                    'id'          => 'password',
                    'type'        => 'password',
                    'class'       => 'form-control',
                    'value'       => '',
					'autocomplete' => 'off',
                    'placeholder' => 'Contraseña'
                );

                #Render
                $this->render('public/user/login', 'full_width');
            }
        } else{
            redirect('/', 'refresh');
        }
    }

    public function cerrarsesionfb() {
        // Remove local Facebook session
        $this->facebook->destroy_session();
        // Remove user data from session
        $this->session->unset_userdata('userData');
        // Redirect to login page
        redirect('/login/facebook');
    }






}
