<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>


<section id="login" class="page-section bg-section"> 
  <div class="container">
		<div class="container col-xs-12 col-sm-offset-2 col-sm-8 col-md-offset-3 col-md-6 col-lg-offset-4 col-lg-5">
			<div class="panel panel-default">
				<div class="panel-heading">
						<h1 class="text-white">Mi perfil</h1>
				</div>

				<div class="panel-body">

					<div class="row">
						<div class="container-mensajes">
							Hola, <?php echo $nombre_completo;?>. En esta sección podrás crear/editar tu proyecto.
							<hr>
						</div>  

						<table class="table table-striped">
							<tr><th>NOMBRE</th><th>CORREO</th></tr>
							<tr>
								<td><?php echo $nombre_completo;?></td>
								<td><?php echo $correo;?></td>
							</tr>
						</table>
					</div>
					<li class="list-unstyled">
						<a class="js-scroll-trigger btn btn-outline-light" href="<?php echo base_url();?>#proyectos_activos">
						<i class="fa fa-list" aria-hidden="true"></i>Aportar desde $100</a>
					</li>
				</div> 
			</div>


		</div>
			

		
	</div> 
</section>

 