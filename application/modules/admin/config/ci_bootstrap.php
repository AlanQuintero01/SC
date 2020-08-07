<?php
defined('BASEPATH') OR exit('No direct script access allowed');


$config['ci_bootstrap'] = array(

	// Site name
	'site_name' => 'Social Crowd',

	// Default page title prefix
	'page_title_prefix' => '',

	// Default page title
	'page_title' => 'Control de proyectos de Social Crowd',

	// Default meta data
	'meta_data'	=> array(
		'author'		=> '',
		'description'	=> '',
		'keywords'		=> ''
	),
	
	// Default scripts to embed at page head or end
	'scripts' => array(
		'head'	=> array(
			'assets/dist/admin/adminlte.min.js',
			'assets/dist/admin/lib.min.js',
			'assets/dist/admin/app.min.js'
		),
		'foot'	=> array(
		),
	),

	// Default stylesheets to embed at page head
	'stylesheets' => array(
		'screen' => array(
			'assets/dist/admin/adminlte.min.css',
			'assets/dist/admin/lib.min.css',
			'assets/dist/admin/app.min.css'
		)
	),

	// Default CSS class for <body> tag
	'body_class' => '',
	
	// Multilingual settings
	'languages' => array(
	),

	// Menu items
	'menu' => array(
		'home' => array(
			'name'		=> 'Inicio',
			'url'		=> '',
			'icon'		=> 'fa fa-home',
		),
		'proyectos' => array(
			'name'		=> 'Proyectos',
			'url'		=> 'proyectos',
			'icon'		=> 'fa fa-list-ul',
			'children'  => array(
				'Lista'			=> 'proyectos',
				'Captura'			=> 'proyectos/captura',
				'Revision'			=> 'proyectos/revision',
				'Activos'			=> 'proyectos/activos',
				'Registrar'			=> 'proyectos/index/add',
			)
		),
		'user' => array(
			'name'		=> 'Usuarios',
			'url'		=> 'user',
			'icon'		=> 'fa fa-users',
			'children'  => array(
				'Lista'			=> 'user',
				'Crear'		=> 'user/create',
				'Grupos usuarios'	=> 'user/group',
			)
		),
		'panel' => array(
			'name'		=> 'Panel Administración',
			'url'		=> 'panel',
			'icon'		=> 'fa fa-cog',
			'children'  => array(
				'Administradores'			=> 'panel/admin_user',
				'Crear'		=> 'panel/admin_user_create',
				'Grupos Administradores'		=> 'panel/admin_user_group',
			)
		),
		'util' => array(
			'name'		=> 'Ajustes',
			'url'		=> 'util',
			'icon'		=> 'fa fa-cogs',
			'children'  => array(
				'Database Versions'		=> 'util/list_db',
			)
		),
		'logout' => array(
			'name'		=> 'Cerrar sesión',
			'url'		=> 'panel/logout',
			'icon'		=> 'fa fa-sign-out',
		)
	),

	// Login page
	'login_url' => 'admin/login',

	// Restricted pages
	'page_auth' => array(
		'user/create'				=> array('webmaster', 'admin', 'manager'),
		'user/group'				=> array('webmaster', 'admin', 'manager'),
		'panel'						=> array('webmaster'),
		'panel/admin_user'			=> array('webmaster'),
		'panel/admin_user_create'	=> array('webmaster'),
		'panel/admin_user_group'	=> array('webmaster'),
		'util'						=> array('webmaster'),
		'util/list_db'				=> array('webmaster'),
		'util/backup_db'			=> array('webmaster'),
		'util/restore_db'			=> array('webmaster'),
		'util/remove_db'			=> array('webmaster'),
	),

	// AdminLTE settings
	'adminlte' => array(
		'body_class' => array(
			'webmaster'	=> 'skin-red-light',
			'admin'		=> 'skin-blue-light',
			'manager'	=> 'skin-green-light',
			'staff'		=> 'skin-yellow-light',
		)
	),

	// Useful links to display at bottom of sidemenu
	
	'useful_links' => array(/*
		array(
			'auth'		=> array('webmaster', 'admin', 'manager', 'staff'),
			'name'		=> 'Frontend Website',
			'url'		=> '',
			'target'	=> '_blank',
			'color'		=> 'text-aqua'
		),
		array(
			'auth'		=> array('webmaster', 'admin'),
			'name'		=> 'API Site',
			'url'		=> 'api',
			'target'	=> '_blank',
			'color'		=> 'text-orange'
		),
		array(
			'auth'		=> array('webmaster', 'admin', 'manager', 'staff'),
			'name'		=> 'Github Repo',
			'url'		=> CI_BOOTSTRAP_REPO,
			'target'	=> '_blank',
			'color'		=> 'text-green'
		)*/
	),

	// Debug tools
	'debug' => array(
		'view_data'	=> FALSE,
		'profiler'	=> FALSE
	),
);

/*
| -------------------------------------------------------------------------
| Override values from /application/config/config.php
| -------------------------------------------------------------------------
*/
$config['sess_cookie_name'] = 'ci_session_admin';