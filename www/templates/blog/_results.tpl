<?php if ($_GET['result'] == 'postDeleted') { ?>
	<div class="notification__error mb-20 mt-20" data-notify-hide>Пост успешно удален</div> 
<?php } ?>

<?php if ($_GET['result'] == 'postCreated') { ?>
	<div class="notification__success mb-20 mt-20" data-notify-hide>Пост успешно создан</div> 
<?php } ?>

<?php if ($_GET['result'] == 'postUpdated') { ?>
	<div class="notification__success mb-20 mt-20" data-notify-hide>Пост успешно отредактирован</div>
<?php } ?>

<?php if ($_GET['result'] == 'picDeleted') { ?>
	<div class="notification__error mb-20 mt-20" data-notify-hide>Картинка успешно удалена</div> 
<?php } ?>