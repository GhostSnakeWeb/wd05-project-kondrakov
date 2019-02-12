<?php if ($_GET['result'] == 'catDeleted') { ?>
	<div class="notification__error mb-20 mt-20" data-notify-hide>Категория успешно удалена</div>
<?php } ?>

<?php if ($_GET['result'] == 'catUpdated') { ?>
	<div class="notification__success mb-20 mt-20" data-notify-hide>Категория успешно отредактирована</div>
<?php } ?>

<?php if ($_GET['result'] == 'catCreated') { ?>
	<div class="notification__success mb-20 mt-20" data-notify-hide>Категория успешно добавлена</div>
<?php } ?>