<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
	<section class="page-section bg-login" id="registroinversionista">

	<div class="container">
	    <div class="content-wrapper">
	              <section class="content">
	                  <div class="row">
	                      <div class="col-md-12">
	                           <div class="box">
	                              <div class="box-header with-border">
	                                  <h3 class="box-title"><?php echo $tituloRegistro;?></h3>
	                              </div>
	                              <div class="box-body">
	                                  <?php echo $message;?>

	                                  <?php echo form_open(current_url(), array('class' => 'form-horizontal', 'id' => 'form-create_user')); ?>

						<div class="row mx-auto">
		    				<div class="col-xs-4 col-sm-4 col-md-4">
		    					<div class="form-group">
		                	<?php echo form_input($first_name);?>
		    					</div>
		    				</div>
		    				<div class="col-xs-4 col-sm-4 col-md-4">
		    					<div class="form-group">
		    						<?php echo form_input($paterno);?>
		    					</div> 
		    				</div> 															    				

		    				<div class="col-xs-4 col-sm-4 col-md-4">
		    					<div class="form-group">
		    						<?php echo form_input($materno);?>
		    					</div>
		    				</div> 
	    				</div>



							<div class="row mx-auto">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
											<?php echo form_input($email);?>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<?php echo form_input($confirmar_email);?>
									</div>
								</div>
							</div>

							<div class="row mx-auto">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
											<?php echo form_input($phone);?>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<?php echo form_input($telefono2);?>
									</div>
								</div>
							</div>

							<div class="row mx-auto">

								<div class="col-xs-6 col-sm-6 col-md-6">Seleccionar perfil
									<div class="form-group">
										<?php

											$opt_perfil = array('' => '',
												'angel_aportador'    =>  'Ángel aportador',
												'emprendedor' =>  'Emprendedor'
											);

											$extras = array("class" => "form-control");
											echo form_dropdown('perfil', $opt_perfil,null, $extras);
										?>

								</div>

							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								Ciudad
								<div class="form-group">
								<?php echo form_input($ciudad);?>
							</div>
									</div>
										</div>




							<div class="row mx-auto">																				

								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
											  <?php echo form_input($password);?>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<?php echo form_input($password_confirm);?>
									</div>
								</div>
							</div>





	                                      <div class="form-group">
	                                          <div class="col-sm-offset-2 col-sm-10 text-center">
	                                              <div class="btn-group">
	                                                  <?php echo form_button(array('type' => 'submit', 'class' => 'btn btn-primary btn-flat', 'content' => 'Click para guardar registro')); ?>                                            </div>
	                                          </div>
	                                      </div>
	                                  <?php echo form_close();?>
	                              </div>
	                          </div>
	                       </div>
	                  </div>
	              </section>
	          </div>
	  </div>
	</section>

