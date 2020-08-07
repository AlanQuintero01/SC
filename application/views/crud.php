<style>
.flexigrid div.form-div input[type=text], .flexigrid div.form-div input[type=password] {
    height: initial;
}
#etapaID_field_box, #slug_field_box, #filtering_form {display: none}
</style>

<h1><?php echo $page_title; ?></h1>

<div>
	<a href="<?php echo base_url('registro/proyecto');?>" class="btn btn-primary">Mi proyecto</a>
</div>

<?php if ( !empty($crud_note) ) echo "<p>$crud_note</p>"; ?>

<?php if ( !empty($crud_output) ) echo $crud_output; ?>


