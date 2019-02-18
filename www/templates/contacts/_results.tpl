<?php if (@$_GET['result'] == 'contactsEdit') { ?>
	<div class="notification__success mb-20 mt-20" data-notify-hide>Данные контактов сохранены</div>
<?php } ?>

<?php if (@$_GET['result'] == 'messageDeleted') { ?>
	<div class="notification__error mb-20 mt-20" data-notify-hide>Сообщение успешно удалено</div>
<?php } ?>