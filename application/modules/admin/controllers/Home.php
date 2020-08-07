<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends Admin_Controller {

	public function index()
	{
		$this->load->model('user_model', 'users');
		$this->mViewData['count'] = array(
			'users' => $this->users->count_all(),
			'proyectos' => $this->db->count_all_results('proyectos'),			

		);
		$this->render('home');
	}
}
