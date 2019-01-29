<div class="container">
	<div class="row justify-content-center">
		<div class="col-4">
			<form class="registration-form" method="POST" action="<?=HOST?>registration">
				<h1 class="title-1 registration-form__caption">Регистрация</h1>
				
				<?php require ROOT . 'templates/_parts/_errors.tpl';?>
				
				<div class="registration-form__email"><input id="email-input" class="input-text" type="text" name="email" placeholder="E-mail" /></div>
				<div id="email-error-block" class="notification__error empty-email-reg mb-20">Введите email</div>
				<div id="wrong-email-format-block" class="notification__error wrong-email-reg mb-20">Неверный формат email</div>
				<div class="registration-form__password"><input id="password-input" class="input-text" type="password" name="password" placeholder="Пароль" /></div>
				<div id="password-error-block" class="notification__error empty-password-reg mb-20">Введите пароль</div>
				<div class="registration-form__button"><input class="button button-enter" type="submit" value="Регистрация" name="register" /></div>
			</form>
		</div>
	</div>
</div>