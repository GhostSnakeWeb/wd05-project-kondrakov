<div class="container">
	<div class="row justify-content-center">
		<div class="col-4">
			<form id="login-form" class="registration-form" method="POST" action="<?=HOST?>login">
				<h1 class="title-1 registration-form__caption">Вход на сайт</h1>
				<?php require ROOT . 'templates/_parts/_errors.tpl';?>
				<div class="registration-form__email">
					<input id="email-input" class="input-text" type="text" name="email" placeholder="E-mail" />
				</div>
				<div id="email-error-block" class="empty-email notification__error mb-20">Введите email</div>
				<div id="wrong-email-format-block" class="wrong-email notification__error mb-20">Неверный формат email</div>
				<div class="registration-form__password">
					<input id="password-input" class="input-text" type="password" name="password" placeholder="Пароль" />
				</div>
				<div id="password-error-block" class="empty-password notification__error mb-20">Введите пароль</div>
				<div class="password-remember-wrapper">
					<div class="registration-form__remember">
						<label class="form-label">
							<input class="form-input-checkbox" type="checkbox" name="checkbox" checked="checked" />
							<span class="form__checkbox"></span>Запомнить меня
						</label>
					</div><span><a class="registration-form__password-recovery" href="<?HOST?>lost-password">Забыл пароль</a></span>
				</div>
				<div class="registration-form__button"><input class="button button-enter" type="submit" value="Войти" name="login" /></div>
			</form>
		</div>
	</div>
</div>