<?php if ($_GET['result'] == 'itemDeleted') { ?>
	<div class="notification__error mb-20 mt-20" data-notify-hide>Товар был удален</div> 
<?php } ?>

<?php if ($_GET['result'] == 'itemCreated') { ?>
	<div class="notification__success mb-20 mt-20" data-notify-hide>Новый товар добавлен</div> 
<?php } ?>

<?php if ($_GET['result'] == 'itemUpdated') { ?>
	<div class="notification__success mb-20 mt-20" data-notify-hide>Товар успешно отредактирован</div>
<?php } ?>

<?php if ($_GET['result'] == 'shopPicDeleted') { ?>
	<div class="notification__error mb-20 mt-20" data-notify-hide>Миниатюра к товару была удалена</div>
<?php } ?>