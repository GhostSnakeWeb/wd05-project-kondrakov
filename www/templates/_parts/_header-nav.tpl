<div class="header__nav ml-55">
	<nav class="navigation">
	<?php #Проверяем на какой странице находимся и убираем подчеркивание, если на этой странице ?>
		<ul>
			<li class="navigation__item <?=($uri[0] == "") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>">Главная</a></li>
			<li class="navigation__item <?=($uri[0] == "about") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>about">Обо мне</a></li>
			<?php /*<li class="navigation__item <?=($uri[0] == "portfolio") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>portfolio">Работы</a></li>*/?>
			<li class="navigation__item <?=($uri[0] == "blog") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>blog">Блог</a></li>
			<li class="navigation__item <?=($uri[0] == "contacts") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>contacts">Контакты</a></li>
		</ul>
	</nav>
</div>