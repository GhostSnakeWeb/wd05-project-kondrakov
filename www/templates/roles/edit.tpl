<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-1 post-add__title">Изменить роль пользователя</div>
				<p>Вы действительно хотите изменить роль <strong><?=$user['role']?></strong> пользователя <strong><?=$user['name']?> <?=$user['surname']?></strong> с email <?=$user['email']?> на
					<form action="<?=HOST?>roles/edit-role?id=<?=$user['id']?>" method="POST">
						<select name="selectedRole">
							<?php foreach ($allRoles as $role): ?>
							<option><?=$role['role_name']?></option>
							<?php endforeach ?>
						</select> ?
						<div class="post-add-form-button"><input class="button button-save" type="submit" value="Сохранить" name="roleEdit" />
							<div class="post-add-form-button__cancel"><a class="button" href="<?=HOST?>roles">Отмена</a></div>
						</div>
					</form>
				</p>				
			</div>
		</div>
	</div>
</div>