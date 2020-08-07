<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logout extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));
		$this->lang->load('auth');
	}

	function index($src = NULL)
	{

	    $logout = $this->ion_auth->logout();
	    $this->session->set_flashdata('message', $this->ion_auth->messages());



	    if ($src == 'admin')
	    {
	        redirect('auth/login', 'refresh');
	        //print_r($this->session->set_flashdata('message')); die; 
	    }
	    else
	    {
	      //print_r($this->session->set_flashdata('message')); die;
	        redirect('/', 'refresh');
	    }
	}



}
