<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>


<section id="login" class="page-section bg-login">
  <div class="container">
		<div class="container col-xs-12 col-sm-offset-2 col-sm-8 col-md-offset-3 col-md-6 col-lg-offset-4 col-lg-5">
			<div class="panel panel-default">
				<div class="panel-heading">
						<h1 class="text-white">Formulario de acceso</h1>
				</div>
				<div class="panel-body">

						<div class="container-mensajes">
							<?php echo $message;?>
						</div>

						<?php echo form_open('login');?>
						<div class="form-group">
								<div class="input-group">
										  <?php echo form_input($identity);?>
								</div>
						</div>
						<div class="form-group">
								<div class="input-group">
										<?php echo form_input($password);?>
								</div>
						</div>
					<?php echo form_submit('submit', 'Entrar', array('class' => 'btn btn-primary btn-block btn-flat'));?>
					<a href="<?php echo base_url('registro')?>" class="btn btn-primary btn-block btn-flat">¿No tienes cuenta? Registrate aqui</a> 

				</div>


				<hr>


			</div>
		</div>
	</div>
</section>

