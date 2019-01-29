<div class="sticky-footer-content">
	<div class="container user-content pt-45 pl-20">
		<div class="row">
			<div class="offset-md-1 col-md-10">
				<h1 class="title-1">Редактировать профиль</h1>
				<?php require ROOT . 'templates/_parts/_errors.tpl';?>
				<form enctype="multipart/form-data" action="<?=HOST?>profile-edit" method="POST" class="edit-user-profile-form">
					<div class="row edit-user-profile-form__row">
						<div class="col-md-4"><label class="label">Имя<input class="input-text" type="text" placeholder="Введите имя" name="name" value="<?=$currentUser->name?>" /></label></div>
					</div>
					<div class="row edit-user-profile-form__row">
						<div class="col-md-4"><label class="label">Фамилия<input class="input-text" type="text" placeholder="Введите фамилию" value="<?=$currentUser->surname?>" name="surname" /></label></div>
					</div>
					<div class="row edit-user-profile-form__row">
						<div class="col-md-4"><label class="label">Email<input class="input-text" type="text" placeholder="Введите email" value="<?=$currentUser->email?>" name="email" /></label></div>
					</div>
					<div class="row edit-user-profile-form__row">
						<div class="col-md-9">
							<div class="load-file-title">Фотография </div>
							<div class="load-file-opis">Изображение jpg или png, размером больше чем 100х100 пикселей и весом до 2Мб.</div>
							<div class="load-file-fieldset">
								<input class="inputfile" id="file-2" type="file" name="avatar" data-multiple-caption="{count} файлов выбрано" multiple="" />
								<label for="file-2">Выбрать файл</label>
								<span class="file__inner-caption">Файл не выбран</span>
							</div>
						</div>
					</div>
					<div class="row edit-user-profile-form__row">
						<div class="col-md-4"><label class="label">Страна<input class="input-text" type="text" placeholder="Введите страну" value="<?=$currentUser->country?>" name="country" /></label></div>
					</div>
					<div class="row edit-user-profile-form__row">
						<div class="col-md-4"><label class="label">Город<input class="input-text" type="text" placeholder="Введите город" value="<?=$currentUser->city?>" name="city" /></label></div>
					</div>
					<div class="row edit-user-profile-form__row">
						<div class="form-button-save"><input class="button button-save" type="submit" value="Сохранить" name="profile-update" /></div>
						<div class="form-button-cancel"><a class="button" href="<?=HOST?>profile">Отмена</a></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>