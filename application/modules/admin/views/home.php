<div class="row">

	<div class="col-md-4">
		<?php echo modules::run('adminlte/widget/box_open', 'Atajos'); ?>
			<?php echo modules::run('adminlte/widget/app_btn', 'fa fa-user', 'Account', 'panel/account'); ?>
			<?php echo modules::run('adminlte/widget/app_btn', 'fa fa-sign-out', 'Logout', 'panel/logout'); ?>
		<?php echo modules::run('adminlte/widget/box_close'); ?>
	</div>

	<div class="col-md-4">
		<?php echo modules::run('adminlte/widget/info_box', 'yellow', $count['users'], 'Usuarios', 'fa fa-users', 'user'); ?>
	</div>
	
</div>
<div class="row"><br>

	<div class="col-md-4">
		<?php echo modules::run('adminlte/widget/info_box', 'purple', $count['proyectos'], 'Proyectos', 'fa fa-th-list', 'proyectos'); ?>
	</div>
	
</div>
