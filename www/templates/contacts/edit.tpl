<?php 
	//Функция с заменой имени поля в массиве. Параметры: название поля name
	function dataFromPost($fieldName) {
		//global - получаем внутри функции глобальные переменные (т.е. за пределами этой функции)
		global $contacts;
		echo @$_POST[$fieldName] != '' ? @$_POST[$fieldName] : $contacts[$fieldName];
	}
?>
<div class="sticky-footer-content">
	<div class="container user-content pt-70">
		<h1 class="title-1">Редактировать данные</h1>
		<?php require ROOT . 'templates/_parts/_errors.tpl';?>
		<form action="<?=HOST?>contacts-edit" method="POST" class="contacts-edit-form">
			<div class="row contacts-edit-form__row">
				<div class="col-md-3">
					<label class="label">Имя
						<input 
							class="input-text" 
							type="text" 
							placeholder="Введите имя" 
							name="name" 
							value="<? echo @$_POST['name'] != '' ? @$_POST['name'] : $contacts['name']; ?>" />
					</label>
				</div>
				<div class="col-md-3">
					<?php //Если в Post массиве пришло непустое поле surname ?>
					<label class="label">Фамилия<input 
						class="input-text" type="text" 
						placeholder="Введите фамилию" 
						name="surname"
						value="<? echo @$_POST['surname'] != '' ? @$_POST['surname'] : $contacts['surname']; ?>" />
					</label>
				</div>
			</div>
			<div class="row contacts-edit-form__row">
				<div class="col-md-3">
					<label class="label">Email
						<input 
							class="input-text" 
							type="text" 
							placeholder="Введите email" 
							name="email"
							value="<?php dataFromPost("email") ?>" />
					</label>
				</div>
				<div class="col-md-3">
					<label class="label">Skype
						<input 
							class="input-text" 
							type="text" 
							placeholder="Введите skype" 
							name="skype" 
							value="<?php dataFromPost("skype") ?>" />
					</label>
				</div>
			</div>
			<div class="row contacts-edit-form__row">
				<div class="col-md-3">
					<label class="label">Вконтакте
						<input 
							class="input-text" 
							type="text" 
							placeholder="Введите ссылку на профиль" 
							name="vk" 
							value="<?php dataFromPost("vk") ?>"/>
					</label>
				</div>
				<div class="col-md-3">
					<label class="label">Facebook
						<input 
							class="input-text" 
							type="text" 
							placeholder="Введите ссылку на профиль" 
							name="fb" 
							value="<?php dataFromPost("fb") ?>"/>
					</label>
				</div>
				<div class="col-md-3">
					<label class="label">Github
						<input 
							class="input-text" 
							type="text" 
							placeholder="Введите ссылку на профиль" 
							name="github" 
							value="<?php dataFromPost("github") ?>"/>
					</label>
				</div>
				<div class="col-md-3">
					<label class="label">Twitter
						<input 
							class="input-text" 
							type="text" 
							placeholder="Введите ссылку на профиль" 
							name="twitter" 
							value="<?php dataFromPost("twitter") ?>"/>
					</label>
				</div>
			</div>
			<div class="row contacts-edit-form__row">
				<div class="col-md-3">
					<label class="label">Телефон
						<input 
							class="input-text" 
							type="text" 
							placeholder="Введите телефон" 
							name="phone" 
							value="<?php dataFromPost("phone") ?>"/>
					</label>
				</div>
				<div class="col-md-3">
					<label class="label">Адрес
						<input 
							class="input-text" 
							type="text" 
							placeholder="Введите адрес" 
							name="address" 
							value="<?php dataFromPost("address") ?>"/>
					</label>
				</div>
			</div>

			
			<div class="row contacts-edit-form__row">
				<div class="form-button-save"><input class="button button-save" type="submit" value="Сохранить" name="contactsUpdate" /></div>
				<div class="form-button-cancel"><a class="button" href="<?=HOST?>contacts">Отмена</a></div>
			</div>
		</form>
	</div>
</div>