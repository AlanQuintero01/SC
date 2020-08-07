<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<h1>Registro de proyecto</h1>
<?php echo validation_errors(); ?>
 
<?php echo form_open('registro/proyecto/', "class='form-horizontal'"); ?>
	<div class="form-group">
		<label class="col-md-3 control-label no-padding-right" for="form-field-1"> Nombre del proyecto</label>

		<div class="col-md-9">
			<input type="text" id="nombre_proyecto" placeholder="Nombre del proyecto" name="nombre_proyecto" class="col-xs-10 col-sm-5 col-md-10" value="<?php echo set_value('nombre_proyecto'); ?>">
		</div>
	</div>

	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Descripción corta (280 caracteres) </label>

		<div class="col-sm-9">
			<input type="text" id="descripcion_corta" placeholder="Descripción corta" class="col-xs-10 col-sm-5 col-md-10" name="descripcion_corta" value="<?php echo set_value('descripcion_corta'); ?>">
		</div>
	</div>		

	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Descripción del proyecto </label>
		<div class="col-sm-9">
			<textarea id="descripcion_proyecto" placeholder="Descripción corta" class="col-xs-10 col-sm-5 col-md-10" name="descripcion_proyecto" value="<?php echo set_value('descripcion_proyecto'); ?>">
				<?php echo set_value('descripcion_proyecto'); ?>
			</textarea>
		</div>
	</div>	

	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Problema que resuelve </label>
		<div class="col-sm-9">
			<textarea id="problema_que_resuelve" placeholder="Problema que resuelve" class="col-xs-10 col-sm-5 col-md-10" name="problema_que_resuelve" value="<?php echo set_value('problema_que_resuelve'); ?>">
				<?php echo set_value('problema_que_resuelve'); ?>
			</textarea>
		</div>
	</div>	

	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Producto o servicio </label>
		<div class="col-sm-9">
			<textarea id="producto_o_servicio" placeholder="Problema que resuelve" class="col-xs-10 col-sm-5 col-md-10" name="producto_o_servicio">
				<?php echo set_value('producto_o_servicio'); ?>
			</textarea>
		</div>
	</div>	

	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Monto requerido </label>

		<div class="col-sm-9">
			<input type="number" id="monto_requerido" placeholder="Monto requerido sin puntos ni comas, ejemplo: 50000" class="col-xs-10 col-sm-5 col-md-10" name="monto_requerido" value="<?php echo set_value('monto_requerido'); ?>">
		</div>
	</div>	

	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Video en youtube </label>

		<div class="col-sm-9">
			<input type="text" id="video_youtube" placeholder="Video en youtube" class="col-xs-10 col-sm-5 col-md-10" name="video_youtube" value="<?php echo set_value('video_youtube'); ?>">
		</div>
	</div>		

	<div class="form-group">
		

		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Industria </label>
		<div class="col-sm-9">
            <select name="industria" id="industria" class="form-control" required>
	            <option>-- Seleccionar industria --</option>
	            <?php foreach($array_industrias As $industria) : ?>
	            	<option value="<?php echo $industria->industriaID;?>"><?php echo $industria->industria;?></option>
	            <?php endforeach;?>
            </select> 
		</div>
	</div>	


	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Estado de la republica </label>
		<div class="col-sm-9">
            <select name="estado_republica" class="form-control" required>
	            <option>-- Seleccionar estado --</option>
	            <?php foreach($array_estados_republica As $estado) : ?>
	            	<option value="<?php echo $estado->estadoID;?>"><?php echo $estado->nombre;?></option>
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
