<div class="container">
	<div class="row justify-content-center">
		<div class="col-4">
			<form class="registration-form" method="POST" action="<?=HOST?>lost-password">
				<h1 class="title-1 registration-form__caption">Забыл пароль</h1>
				<?php require ROOT . 'templates/_parts/_errors.tpl';?>
				<?php require ROOT . 'templates/_parts/_success.tpl';?>
				<div class="registration-form__email"><input class="input-text" type="text" name="email" placeholder="E-mail" /></div>
				<div class="to-login-page mb-20">
					<a href="<?=HOST?>login">Перейти на страницу входа</a>
				</div>
				<div class="registration-form__button"><input class="button button-enter" type="submit" value="Восстановить пароль" name="lost-password" /></div>
			</form>
		</div>
	</div>
</div>