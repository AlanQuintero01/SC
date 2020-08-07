  <nav class="navbar-shrink navbar navbar-expand-lg navbar-light fixed-top py-3 bg-white" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="<?php echo base_url();?>">Social Crowd MX</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto my-2 my-lg-0">
          <li class="nav-item dropdown">
            <a class="dropdown-toggle nav-link text-dark" aria-expanded="false" data-toggle="dropdown" href="#">ANGEL APORTADOR</a>
            <div class="dropdown-menu" role="menu">
            
            <?php /*<a class="js-scroll-trigger dropdown-item text-left" href="<?php echo base_url();?>#proyectos_activos">Proyectos</a> */?>
          
            <a class="js-scroll-trigger dropdown-item text-left text-dark" role="presentation" href="#angel_aportador">¿Qué es un Ángel aportador?</a>
            <a class="js-scroll-trigger dropdown-item text-left text-dark" role="presentation" href="#apreguntasfrecuentes_aportador">Preguntas Frecuentes</a>
            <a class="text-left dropdown-item text-dark" role="presentation" href="<?php echo base_url('registro');?>">Registro</a>
            </div>
          </li>
          <?php /*<li class="nav-item dropdown">
            <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#">EMPRENDEDOR</a>
            <div class="dropdown-menu" role="menu">
              <a class="js-scroll-trigger dropdown-item text-left" role="presentation" href="#lineamientos">Terminos y Condiciones</a>
              <a class="js-scroll-trigger dropdown-item text-lef" role="presentation" href="#preguntasfrecuentes_emprendedor">Preguntas Frecuentes</a>
              <a class="text-left dropdown-item" role="presentation" href="<?php echo base_url('registro');?>">Registro</a>
            </div>
          </li> */?>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger text-dark" href="#hacemos">¿QUÉ HACEMOS?</a>
            </li>
            <li class="nav-item">
            <a class="nav-link js-scroll-trigger text-dark" href="<?php echo base_url();?>#proyectos_activos">CAMPAÑA</a>
            </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger text-dark" href="#exito">CASOS DE ÉXITO</a>
            </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger text-dark" href="#contacto">CONTACTO</a>
            </li> 

            <?php if($this->ion_auth->logged_in()) :?>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle text-dark" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><?php echo $this->session->userdata()['usuario'];?></a>
                <div class="dropdown-menu">
                  <a class="dropdown-item text-dark" href="<?php echo base_url('perfil');?>">Perfil</a>
                  <a class="dropdown-item text-dark" href="<?php echo base_url();?>#proyectos_activos">Proyectos</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item text-dark" href="<?php echo base_url('logout');?>">Cerrar sesión</a>
                </div>
              </li>
          <?php else:?>
            <li class="nav-item">
              <a class="nav-link text-dark" href="<?php echo base_url('login');?>">LOGIN</a>
            </li>
          <?php endif;?> 
        </ul>
      </div>
    </div>
  </nav>