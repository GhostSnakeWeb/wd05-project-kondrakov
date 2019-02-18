<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-1 post-add__title">Удалить сообщение</div>
				<p>Вы действительно хотите удалить сообщение ?</p>
				<?php include ROOT . "templates/contacts/_message-card-delete.tpl"; ?>
				<form class="post-add-form" action="<?=HOST?>delete-message?id=<?=$message['id']?>" method="POST">
					<div class="post-add-form-button"><input class="button button-delete" type="submit" value="Удалить" name="messageDelete" />
						<div class="post-add-form-button__cancel"><a class="button" href="<?=HOST?>messages">Отмена</a></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>