<section id="proyectos_activos">
  <div class="article-list">
    <div class="container">
      <div class="row d-flex justify-content-center">
        <div class="col-lg-8 text-center">
          <h2 class="text-center mt-0">Campaña</h2>
          <hr class="divider black my-4">
        </div>
      </div>
        <div class="row articles">
        <?php foreach ($array_proyectos_activos as $activo ):?> 
              <div class="col-sm-6 col-md-4 item mb-4">
                      <img class="logo-prin img-fluid rounded mx-auto d-block w-75" src="<?php echo base_url('');?>assets/uploads/proyectos/2019/<?php echo $activo['rutaImagen']?>">
                  <p></p>  
                  <h3 class="name text-uppercase text-center"><?php echo $activo['nombreProyecto']?></h3>
                  <p class="description text-justify" ><?php echo strip_tags($activo['descripcionCorta'])?></p>
                  <a  href="<?php echo base_url('Proyecto');?>/<?php echo $activo['proyectoID']?>" class="btn btn-primary ml-5">
                    VER MÁS
                  </a>
                  <!-- <a  href="<?php //echo base_url('proyecto/social-crowd');?>" class="btn btn-primary">VER MÁS</a> -->
              </div>
          <?php endforeach?>
        </div>
    </div>
  </div>
</section><br><br><br>