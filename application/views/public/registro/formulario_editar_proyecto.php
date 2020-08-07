<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<h1>Editar proyecto (<?php echo $data['nombre_proyecto']; ?>)</h1>
<?php echo validation_errors(); ?>
 
<?php echo form_open('registro/editarproyecto/'.$data['proyectoID'], "class='form-horizontal'"); ?>
	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Nombre del proyecto </label>

		<div class="col-sm-9">
			<input type="text" id="nombre_proyecto" placeholder="Nombre del proyecto" name="nombre_proyecto" class="col-xs-10 col-sm-5 col-md-10" value="<?php echo $data['nombre_proyecto']; ?>">
		</div>
	</div>

	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Descripción corta</label>

		<div class="col-sm-9">
			<input type="text" id="descripcion_corta" placeholder="Descripción corta" class="col-xs-10 col-sm-5 col-md-10" name="descripcion_corta" value="<?php echo $data['descripcion_corta']; ?>">
		</div>
	</div>		

	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Descripción del proyecto</label>
		<div class="col-sm-9">
			<textarea cols="2" rows="5"  id="descripcion_proyecto" placeholder="Descripción del proyecto" class="col-xs-10 col-sm-5 col-md-10 form-control" name="descripcion_proyecto">
				<?php echo $data['descripcion_proyecto']; ?>
			</textarea>
		</div>
	</div>		

	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Problema que resuelve</label>
		<div class="col-sm-9">
			<textarea cols="2" rows="5"  id="problema_que_resuelve" placeholder="Descripción del proyecto" class="col-xs-10 col-sm-5 col-md-10 form-control" name="problema_que_resuelve">
				<?php echo $data['problema_que_resuelve']; ?>
			</textarea>
		</div>
	</div>	
	
	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Producto o servicio</label>
		<div class="col-sm-9">
			<textarea cols="2" rows="5"  id="producto_o_servicio" placeholder="Descripción del proyecto" class="col-xs-10 col-sm-5 col-md-10 form-control" name="producto_o_servicio">
				<?php echo $data['producto_o_servicio']; ?>
			</textarea>
		</div>
	</div>	

	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Monto requerido</label>

		<div class="col-sm-9">
			<input type="text" id="monto_requerido" placeholder="Descripción corta" class="col-xs-10 col-sm-5" name="monto_requerido" value="<?php echo $data['monto_requerido']; ?>">
		</div>
	</div>	

	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Video Youtu</label>

		<div class="col-sm-9">
			<input type="text" id="video_youtube" placeholder="Video Youtube" class="col-xs-10 col-sm-5 col-md-10" name="video_youtube" value="<?php echo $data['video_youtube']; ?>">
		</div>
	</div>		


	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Industria</label>

		<div class="col-sm-9">
	         <select name="industria" class="form-control">
	            <?php foreach($array_industrias As $industria) : ?>
	            	<?php if($industria->industriaID == $data['industriaID'] ):?>
	            		<option value="<?php echo $industria->industriaID;?>" selected><?php echo $industria->industria;?></option>
	            	<?php else:?>
	            		<option value="<?php echo $industria->industriaID;?>"><?php echo $industria->industria;?></option>
	            	<?php endif;?>
	            <?php endforeach;?>
            </select>
		</div>
	</div>	

	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Industria</label>

		<div class="col-sm-9">
	         <select name="estado_republica" class="form-control">
	            <?php foreach($array_estados_republica As $estado) : ?>
	            	<?php if($estado->estadoID == $data['estado_republica_id'] ):?>
	            		<option value="<?php echo $estado->estadoID;?>" selected><?php echo $estado->nombre;?></option>
	            	<?php else:?>
	            		<option value="<?php echo $estado->estadoID;?>"><?php echo $estado->nombre;?></option>
	            	<?php endif;?>
	            <?php endforeach;?>
            </select>
		</div>
	</div>

	<div class="space-4"></div>
	<div class="clearfix form-actions">
		<div class="col-md-offset-3 col-md-9">
			<button class="btn btn-info" type="submit">
				<i class="ace-icon fa fa-check bigger-110"></i>
				Guardar
			</button>

			&nbsp; &nbsp; &nbsp;
			<button class="btn" type="reset">
				<i class="ace-icon fa fa-undo bigger-110"></i>
				Reiniciar
			</button>
		</div>
	</div>
</form>