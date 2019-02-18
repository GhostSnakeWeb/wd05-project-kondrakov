<div class="sign-in-user">
	<div class="user__avatar">
		<div class="avatar-small">

			<?php #Проверяем есть аватарка ?>
			<?php if ($_SESSION['logged_user']['avatar_small'] != "") { ?>
				<img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logged_user']['avatar_small']?>">
			<?php } ?>

		</div>
	</div>
	<div class="user__desc">
		<div class="user__text">
			<span class="name"><?=$_SESSION['logged_user']['name'] ?> <?=$_SESSION['logged_user']['surname'] ?>
			</span>
			<span class="desc">Пользователь</span></div>
		<div class="user__buttons">
			<a class="button button-profile" href="<?=HOST?>profile">Профиль</a>
			<a class="button button-profile" href="<?=HOST?>myorders">Заказы</a>
			<a class="button button-profile" href="<?=HOST?>logout">Выход</a>
		</div>
	</div>
</div>
