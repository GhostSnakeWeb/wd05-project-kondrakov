<div class="container">
	<div class="row justify-content-center">
		<div class="col-4">
			<form class="registration-form" method="POST" action="<?=HOST?>set-new-password">
				<?php if ($newPasswordReady == false) { ?>
					<h1 class="title-1 registration-form__caption">Введите новый пароль</h1>
				<?php } ?>
				<?php require ROOT . 'templates/_parts/_errors.tpl';?>
				<?php require ROOT . 'templates/_parts/_success.tpl';?>
				<?php if ($newPasswordReady == false) { ?>
					<div class="registration-form__email">
						<input class="input-text" type="password" name="resetpassword" placeholder="Новый пароль" />
					</div>
				<?php } ?>
				<div class="to-login-page mb-20">
					<a href="<?=HOST?>login">Перейти на страницу входа</a>
				</div>
				<div class="registration-form__button">
					<?php if ($newPasswordReady == false) { ?>
							<input type="hidden" name="resetemail" value="<?=$_GET['email']?>">
							<input type="hidden" name="onetimecode" value="<?=$_GET['code']?>">
							<input class="button button-enter" type="submit" value="Установить новый пароль" name="set-new-password" />
					<?php } ?>
				</div>
			</form>
		</div>
	</div>
</div>