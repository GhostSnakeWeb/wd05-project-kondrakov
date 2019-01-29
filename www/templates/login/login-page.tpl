<body class="content-page">
	<div class="registration-wrapper">
		<div class="registration-header-wrapper">
			<div class="logo">
				<div class="logo__icon"><span class="ml-0"><i class="far fa-paper-plane"></i></span><span>Супер Сайт</span></div>
				<div class="logo__text"><span></span></div>
			</div>
			<div class="login">
			<?php if ($uri[0] == 'registration') { ?>
					<a href="<?=HOST?>login">Вход</a>
			<?php } else { ?>
					<a href="<?=HOST?>registration">Регистрация</a>
			<?php }	?>
			</div>
		</div>
		<?=$content?>
	</div><!-- build:jsLibs js/libs.js -->