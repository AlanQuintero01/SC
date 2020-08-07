<?php
defined('BASEPATH') OR exit('No direct script access allowed');

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

class Notificaciones extends MY_Controller {

	function __construct() 
	{
		parent::__construct();
		$this->load->model('notificaciones_model','modAportaciones'); 
	} 

	public function index()
	{ 
		if($_POST) {
			
			#OBTENER EL MÉTODO DE PAGO
			$event = $_POST['event'];

            if($event == "paycash"){

				$reference = $_POST['reference'];
				if(!empty($reference)){ 
					$cadena = explode("-",$reference);

					$proyectoID = $cadena[0];
					$usuarioID = $cadena[1];
					$recompensaID = $cadena[2];
					$nombreAportador = $cadena[1];
				}


				#Quitar comas a la cantidad reportada por BanWire
				$post_total = $_POST['total'];                              
				$total = str_replace(',','',$post_total);         

				$data = array("auth_code" => $_POST['auth_code'],
									"event" => $_POST['event'],
									"hash" => $_POST['hash'],
									"id" => $_POST['id'],
									"reference" => $_POST['reference'],
									"status" => $_POST['status'],
									"total" => $total, 
									"proyectoID" => $proyectoID,
									"usuarioID" => $usuarioID,
									"recompensaID" => $recompensaID,
									"nombreAportador" => $nombreAportador,
									"fechaInsert" => date('Y-m-d H:i:s'),
									"estatus" => 1
									);   


				if($_POST['status'] == 'paid'){
					$aportacionID = $this->modAportaciones->registrar_pago($data);
				} else {
					$aportacionID = $this->modAportaciones->registrar_pago_fallido($data); 
				}
                    }else{
					#Crear evidencia del resultado
					$output = print_r($_POST, true);  
					$dataTXT = print_r($data, true);   

					#Crear evidencia del resultado
					$ruta_servidor = "/home/scmx/public_html/merida/lgs/";
					$nombre_archivo_log = $ruta_servidor . time() . "_paycash_" . ".txt";   
					$log_transaccion = fopen($nombre_archivo_log, "w") or die("Unable to open file!");
					$txt_info = $output; 
					fwrite($log_transaccion, $txt_info);
					$txt_info = $dataTXT;      
					fwrite($log_transaccion, $txt_info);
					fclose($log_transaccion); 
                    }
		


			#SI ES POR TARJETA DE CRÉDITO
			if($event == "card"){

				$reference = $_POST['reference'];
				if(!empty($reference)){ 
					$cadena = explode("-",$reference);

					$proyectoID = $cadena[0];
					$usuarioID = $cadena[1];
					$recompensaID = $cadena[2];
					$nombreAportador = $cadena[1];
				}


				#Quitar comas a la cantidad reportada por BanWire
				$post_total = $_POST['total'];                              
				$total = str_replace(',','',$post_total);         

				$data = array("auth_code" => $_POST['auth_code'],
									"event" => $_POST['event'],
									"hash" => $_POST['hash'],
									"id" => $_POST['id'],
									"reference" => $_POST['reference'],
									"status" => $_POST['status'],
									"total" => $total, 
									"proyectoID" => $proyectoID,
									"usuarioID" => $usuarioID,
									"recompensaID" => $recompensaID,
									"nombreAportador" => $nombreAportador,
									"fechaInsert" => date('Y-m-d H:i:s'),
									"estatus" => 1
									);   


				if($_POST['status'] == 'paid'){
					$aportacionID = $this->modAportaciones->registrar_pago($data);
					
					#Crear evidencia del resultado
					$output = print_r($aportacionID, true);  
					$dataTXT = print_r($data, true);   

					#Crear evidencia del resultado
					$ruta_servidor = "/home/scmx/public_html/merida/lgs/";
					$nombre_archivo_log = $ruta_servidor . time() . "_ms_mysql_" . ".txt";   
					$log_transaccion = fopen($nombre_archivo_log, "w") or die("Unable to open file!");
					$txt_info = $output; 
					fwrite($log_transaccion, $txt_info);
					$txt_info = $dataTXT;      
					fwrite($log_transaccion, $txt_info);
					fclose($log_transaccion); 
					
				} else {
					$aportacionID = $this->modAportaciones->registrar_pago_fallido($data); 
				}

					#Crear evidencia del resultado
					$output = print_r($_POST, true);  
					$dataTXT = print_r($data, true);   

					#Crear evidencia del resultado
					$ruta_servidor = "/home/scmx/public_html/merida/lgs/";
					$nombre_archivo_log = $ruta_servidor . time() . "_card_" . ".txt";   
					$log_transaccion = fopen($nombre_archivo_log, "w") or die("Unable to open file!");
					$txt_info = $output; 
					fwrite($log_transaccion, $txt_info);
					$txt_info = $dataTXT;      
					fwrite($log_transaccion, $txt_info);
					fclose($log_transaccion); 
			} 			

			#SI ES POR OXXO
			if($event == "oxxo"){

				$reference = $_POST['reference'];
				if(!empty($reference)){ 
					$cadena = explode("-",$reference);

					$proyectoID = $cadena[0];
					$usuarioID = $cadena[1];
					$recompensaID = $cadena[2];
					$nombreAportador = $cadena[1];
				} 

				#Quitar comas a la cantidad reportada por BanWire
				$post_total = $_POST['total'];                              
				$total = str_replace(',','',$post_total);  

				$data = array("auth_code" => $_POST['auth_code'],
									"event" => $_POST['event'],
									"hash" => $_POST['hash'],
									"id" => $_POST['id'],
									"reference" => $_POST['reference'],
									"status" => $_POST['status'],
									"total" => $total, 
									"proyectoID" => $proyectoID,
									"usuarioID" => $usuarioID,
									"recompensaID" => $recompensaID,
									"nombreAportador" => $nombreAportador,
									"estatus" => 1
									);  

				if($_POST['status'] == 'paid'){
					$aportacionID = $this->modAportaciones->registrar_pago($data);
				} else {
					$aportacionID = $this->modAportaciones->registrar_pago_fallido($data);
				} 

					#Crear evidencia del resultado
					$output = print_r($_POST, true);  
					$dataTXT = print_r($data, true);   

					#Crear evidencia del resultado
					$ruta_servidor = "/home/scmx/public_html/merida/lgs/";
					$nombre_archivo_log = $ruta_servidor . time() . "_oxxo_" . ".txt";   
					$log_transaccion = fopen($nombre_archivo_log, "w") or die("Unable to open file!");
					$txt_info = $output; 
					fwrite($log_transaccion, $txt_info);
					$txt_info = $dataTXT;      
					fwrite($log_transaccion, $txt_info);
					fclose($log_transaccion); 

			} 		 	

			#SI ES POR OXXO
			if($event == "speifast"){

				$reference = $_POST['reference'];
				if(!empty($reference)){ 
					$cadena = explode("-",$reference);

					$proyectoID = $cadena[0];
					$usuarioID = $cadena[1];
					$recompensaID = $cadena[2];
					$nombreAportador = $cadena[1];
				} 

				#Quitar comas a la cantidad reportada por BanWire
				$post_total = $_POST['total'];                              
				$total = str_replace(',','',$post_total);  

				$data = array("auth_code" => $_POST['auth_code'],
									"event" => $_POST['event'],
									"hash" => $_POST['hash'],
									"id" => $_POST['id'],
									"reference" => $_POST['reference'],
									"status" => $_POST['status'],
									"total" => $total, 
									"proyectoID" => $proyectoID,
									"usuarioID" => $usuarioID,
									"recompensaID" => $recompensaID,
									"nombreAportador" => $nombreAportador,
									"estatus" => 1
									);  

				if($_POST['status'] == 'paid'){
					$aportacionID = $this->modAportaciones->registrar_pago($data);
				} else {
					$aportacionID = $this->modAportaciones->registrar_pago_fallido($data);
				}  

					#Crear evidencia del resultado
					$output = print_r($_POST, true);  
					$dataTXT = print_r($data, true);   

					#Crear evidencia del resultado
					$ruta_servidor = "/home/scmx/public_html/merida/lgs/";
					$nombre_archivo_log = $ruta_servidor . time() . "_spei_" . ".txt";   
					$log_transaccion = fopen($nombre_archivo_log, "w") or die("Unable to open file!");
					$txt_info = $output; 
					fwrite($log_transaccion, $txt_info);
					$txt_info = $dataTXT;      
					fwrite($log_transaccion, $txt_info);
					fclose($log_transaccion);  
			}         
		}  
	}
}
