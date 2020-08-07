<section class="page-section" id="about">
<?php foreach($array_elementos As $elemento):?>     
    <div class="container">         
    <h1 class="text-center"><?php echo $elemento->nombreProyecto?></h1><br>         
        <div class="row">            
            <?php foreach($array_videos_principal As $v_prin):?>                 
            <div class="col-lg-7 col-sm-1 d-flex justify-content-center align-self-center mt-0 ml-0">                                
            <iframe class=" vid-proyecto" src="https://www.youtube.com/embed/<?php echo $youtube_id_prin?>?enablejsapi=1&version=3&playerapiid=ytplayer" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                 
            </div>
            
             <?php endforeach;?>
 
             <div class="col-lg-4 col-sm-1"><br>
                 <?php foreach ($array_fotos_logo as $logo):?>
                 <div class="logo-proyecto d-flex justify-content-center">
                     <img class="img-fluid img-thumbnail img-responsive w-50" src="<?php echo base_url('');?>assets/uploads/proyectos/2019/<?php echo $logo->rutaImagen?>" >
                 </div><br>
                 <?php endforeach?>
                 <div class="row text-center">
                 </div><br>
                 
                 <div class="progress ml-2 mr-2">
                     <div class="progress-bar progress-bar-striped progress-bar-animated " role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 6.5%; "></div>
                 </div><br>
             
                 <div class="row d-flex">
 
                     <div class="mr-auto p-2">
                         <b>$900.00</b>
                         <br>monto recaudado
                     </div>
 
                     
                 </div>
             </div>
         </div>
         <div class="row">
             <div class="col-sm-12 col-xs-12 short-desc text-justify ml-1 mr-1"><br>
                 <?php echo $elemento->descripcionCorta?>
                 <hr>
            </div>
         </div>
         <div class="row menu">
             <div class="col-sm-4 tab_recom">
                 <center><h2>Decide cuanto vas apoyar</h2></center>

                 <?php if (empty($array_recompensas)):?>

                <br><b><h5 class="text-center"> No hay recompensas disponibles </h5></b>
                </div>
                <?php else:?>
                        <div class="card recompensas ml-1 d-flex justify-content-center align-content-center">
                            <div class="card-body"> 
                            <?php foreach ($array_recompensas as $recompensa ):?>

                                <div class="row">
                                    <div class="col-sm-9">
                                        <p class="card-text">Quiero aportar $<?php echo $recompensa->monto?> </p>
                                    </div>
                                    <div class="col-sm-3">
                                        <span class="badge">
                                            <?php echo $recompensa->numAport?>/<?php echo $recompensa->cantidad?>
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <small><?php echo $recompensa->descripcion?></small>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="">
                                        <?php if($estatuslogin == 1) :?>    
                                            <button class="btn btn-outline-dark btn-block realizarpago" type="button" onclick="pay();"  id="<?php echo $recompensa->recompensaID;?>" title="<?php echo $recompensa->monto;?>" alt="<?php echo strip_tags($recompensa->descripcion)?>">Quiero aportar $<?php echo $recompensa->monto?> </button>
                                        <?php else:?>
                                            <a href="<?php echo base_url('login')?>" class="btn btn-outline-dark btn-block">Quiero aportar $<?php echo $recompensa->monto?></a> 
                                        <?php endif?>
                                    </div>
                                </div><p>
                                <?php endforeach?>

                            </div>
                        </div>
             </div>
             <?php endif?>
 
             <div class="col-lg-8"><br>
                 <ul class="nav nav-tabs nav-fill d-flex justify-content-center" role="tablist">
                     <li class="nav-item">
                         <a class="nav-link active info" data-toggle="tab" href="#idea" role="tab">La idea</a>
                     </li>
                     <li class="nav-item">
                         <a class="nav-link info" data-toggle="tab" href="#problema" role="tab">El problema que resuelve</a>
                     </li>  
                     <li class="nav-item">
                         <a class="nav-link info" data-toggle="tab" href="#detalle" role="tab">Detalle de fondeo</a>
                     </li>
                 </ul><!-- Tab panes -->
 
                 <div class="tab-content container text-justify">
                     <div class="tab-pane active ml-1 mr-3" id="idea" role="tabpanel">
                        <p><?php echo $elemento->idea?></p>
                                    <br>
                        
                        <?php foreach($array_videos_idea As $v_idea):?>                 
                            <div class="col-lg-12 d-flex justify-content-center">                                
                            <iframe class=" vid-proyecto" src="https://www.youtube.com/embed/<?php echo $youtube_id_idea?>?enablejsapi=1&version=3&playerapiid=ytplayer" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                 
                            </div><br>
                        <?php endforeach;?>

                        <?php foreach ($array_fotos_idea as $f_idea):?>
                            <img src="<?php echo base_url('');?>assets/uploads/proyectos/2019/<?php echo $f_idea->rutaImagen?>" class="img-fluid img-responsive"><br><br>
                        <?php endforeach;?>
                        <div class="row p-1 mb-5">
                          <div class="col-md-6">
                            <img class="w-100 img-fluid rounded" src="<?php echo base_url('img/SCMx_Plataforma_v2.0.png') ?> ">
                          </div>
                          <div class="col-md-6">
                            <img class="w-100 img-fluid rounded" src="<?php echo base_url('img/SCMx_Plataforma_v4.0.png') ?>">
                          </div>
                        </div>
                          <h6>Impacto positivo</h6>
                          <p><?php echo $elemento->impacto?></p>
                              <?php foreach ($array_fotos_impacto as $impacto):?>
                                  <img src="<?php echo base_url('');?>assets/uploads/proyectos/2019/<?php echo $impacto->rutaImagen?>" class="img-fluid img-responsive "><br><br>
                              <?php endforeach?>
                      </div>
        
                      <div class="tab-pane ml-1 mr-3" id="problema" role="tabpanel">
                          <p><?php echo $elemento->problema?>.</p>
                          <?php foreach ($array_fotos_solucion as $solucion):?>
                                  <img src="<?php echo base_url('');?>assets/uploads/proyectos/2019/<?php echo $solucion->rutaImagen?>" class="img-fluid img-responsive "><br><br>
                          <?php endforeach?>
                          <h3 class="text-center">¿Sabías que...?</h3>
                          <div class="row p-3">
                              <div class="col-md-6">
                              <img class="w-100 img-fluid rounded" src="<?php echo base_url('img/SCMx_Plataforma_v1.0.png') ?>">
                              </div>
                              <div class="col-md-6 d-flex align-items-center">
                                  <p>Una enfermera necesita más de un cubrebocas de especificaciones técnicas y medidas de seguridad certificadas para poder atender a los afectados por Covid-19, y estos deben ser desechados de manera correcta.</p>
                              </div>
                          </div>
                          <div class="row p-3">
                              <div class="col-md-6 d-flex align-items-center">
                                <p>El personal médico requiere equipo especializado para realizar las maniobras de atención a enfermos, ya sea, exploración, diagnóstico, intubación entre otras...</p>
                              </div>
                              <div class="col-md-6">
                                  <img class="w-100 img-fluid rounded" src="<?php echo base_url('img/SCMx_Plataforma_v3.0.png') ?>">
                              </div>
                          </div>
                      </div>
  
                      <div class="tab-pane ml-1 mr-3" id="detalle" role="tabpanel"><br>
                          <h2 class="text-center">Ángeles aportadores</h2><br>
                          <table class="table table-striped w-100">
                          <?php if (empty($array_aportaciones)):?>
                                <h3 class="text-center">Aun no hay aportaciones</h3>

                          <?php else :?>
                            <thead class="thead-dark">
                                    <tr>
                                    <th scope="col">Nombre del aportador</th>
                                    <th scope="col">Monto</th>
                                    <th scope="col">Fecha de aportacion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($array_aportaciones as $aportacion ):?>
                                    <tr>
                                        <td><?php echo $aportacion->first_name?></td>
                                        <td><?php echo $aportacion->total?></td>
                                        <td><?php echo $aportacion->fechaRegistro?></td>
                                    </tr>
                                    <?php endforeach?>

                                    <?php endif?>
                                </tbody>

                          </table>
                      </div>
                  </div>
              </div>
          </div>
          </div>

      </div>
    <?php endforeach;?>  
    <?php foreach($array_elementos As $elemento):?>     
  </section>
             
    <script type="text/javascript" src="https://sw.banwire.com/checkout.js"></script>



    <script type="text/javascript">

        function pay() {
        $(".realizarpago").click(function (event) {
            event.preventDefault();
            var identificador_radio = $(this).find("input").attr('id');
            var recompensaID = $(this).attr('id');
            var valorRecompensa = $(this).attr('title');
            var textoRecompensa = $(this).attr('alt');
            var texto_corto = textoRecompensa.slice(0,75); 

                SW.pay({
                    // Total de la compra
                    total: valorRecompensa,
                    concept: texto_corto,
                    reference: "6" + "-" + "<?php echo $usuarioID;?>" + "-" +  recompensaID,
                    items: [
                        {
                            name: texto_corto,
                            qty: 0,
                            desc: textoRecompensa,
                            unitPrice: valorRecompensa
                        } 
                    ]
                });
            });
        }
            </script>
  <script type="text/javascript"> 
        var SW = new BwGateway({
        user: 'angelsden',
        title: "Social Crowd MX",
        reference: '6-<?php echo $usuarioID?>-<?php echo $array_recompensas[0]->monto?>',

        // Concepto
        concept: 'Aportacion',
        infoMsg: 'Proyecto: <?php echo $elemento->nombreProyecto;?>',

        // Moneda
        currency: 'MXN', 

        cust: {
            fname: "<?php echo $nombreUsuario;?>", 
            mname: "<?php echo $usuario_paterno;?>",
            lname: "<?php echo $usuario_materno;?>",
            email: "<?php echo $correo;?>",
            phone: "<?php echo $usuario_telefono;?>",
            addr: "",
            city: "",
            state: "",
            country: "",
            zip: ""
        },
        ship: {
            addr: "Direccion de envio",
            city: "Mexico",
            state: "DF",
            country: "MX",
            zip: "14140"
        },
        notifyUrl: '<?php echo base_url('notificaciones');?>',
        paymentOptions: 'all',
        reviewOrder: true,

        showShipping: false,

        successPage: '<?php // echo base_url('notificaciones/respuesta');?>',
        onSuccess: function(data){
            alert("El pago fue realizado de forma correcta!.")
        },
        pendingPage: '',
        onPending: function(data){
            console.log(data);
            alert("El pago esta pendiente por ser efectuado");
            window.location = '<?php echo site_url('proyecto/index')?>6';
        },
        // Pago challenge
        challengePage: '',
        onChallenge: function(){
            alert("Pago enviado a validaciones de seguridad");
        },
        // Handler en caso de error en el pago
        errorPage: '',
        onError: function(error){
            console.log(error);
        },
        // Cuando cierra el popup sin completar el proceso
        onCancel: function(){
            console.log("Se cancelo el proceso");
            //window.location = '<?php echo site_url('proyecto/')?>';
        }
    });
    </script>
    <?php endforeach?>