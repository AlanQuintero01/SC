<body id="page-top">

  <!-- Masthead -->
  <?php /*<header class="masthead">
    <div class="container h-100">
      <div class="row h-100 align-items-center justify-content-center text-center">
        <div class="col-lg-10 align-self-end">
          <h1 class="text-white font-weight-bold crowd-principal animated rotateInDownLeft">Crowdfunding para proyectos de impacto social.</h1>
          <hr class="divider my-4">
        </div>
        <div class="col-lg-8 align-self-baseline">
          <p class="text-white-75 font-weight-light mb-5 crowd-principal animated rotateInUpRight">Franquicias sociales, Inclusión laboral, Impacto social, Escalabilidad, Innovación</p>
          <a class="btn btn-secondary btn-xl js-scroll-trigger btn-activos animated bounceInUp" href="#proyectos_activos">Ver proyectos</a>
        </div>
      </div>
    </div>
  </header> */?>
  <div id="carouselExampleControls" class="carousel slide mt-5 pt-3" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<?php echo base_url('img/SCMxPlataforma_Header_v1.0.png') ?>" class="w-100 h-50" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<?php echo base_url('img/SCMxPlataforma_Header_v2.0.png') ?>" class="w-100 h-50" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon color" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon color" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


  
  <?php /*$this->load->view('public/home/alto_impacto');*/?>
  <?php /*$this->load->view('public/home/aportaciones');*/?>
  <?php $this->load->view('public/home/hacemos');?>
  <?php $this->load->view('public/proyecto/activos');?>
  <?php $this->load->view('public/home/angel_aportador');?>
  <?php $this->load->view('public/home/lineamientos');?>
  <?php $this->load->view('public/home/exito');?>
  <?php /*$this->load->view('public/home/pregunta_emprendedor');*/?>
  <?php $this->load->view('public/home/pregunta_aportador');?>
  <?php $this->load->view('public/home/contacto');?>
  <?php $this->load->view('public/home/alert');?>