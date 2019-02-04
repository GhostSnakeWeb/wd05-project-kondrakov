<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-1 post-add__title">Создать новую роль</div>
				<?php require ROOT . 'templates/_parts/_errors.tpl';?>
				<form class="post-add-form" action="<?=HOST?>roles/new-role" method="POST">
					<div class="post-add-form__name"><label class="label">Название роли<input class="input-text" type="text" placeholder="Введите название роли" name="roleName" /></label></div>
					<div class="post-add-form-button"><input class="button button-save" type="submit" value="Сохранить" name="roleNew" />
						<div class="post-add-form-button__cancel"><a class="button" href="<?=HOST?>roles">Отмена</a></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>