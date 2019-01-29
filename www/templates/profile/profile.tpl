<div class="sticky-footer-content">
	<div class="container user-content pt-50 pb-120 relative">
		<div class="profile__button"><a class="button button-edit" href="<?=HOST?>profile-edit">Редактировать</a></div>
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<div class="profile">
					<div class="title-1 profile__title">Профиль</div>
				</div>
				<div class="profile-user">
					<div class="profile-user__avatar">
						<div class="avatar avatar--big">

							<?php #Проверяем есть аватарка ?>
							<?php if ($_SESSION['logged_user']['avatar'] != "") { ?>
								<img src="<?=HOST?>usercontent/avatar/<?=$currentUser->avatar?>" alt="<?=$currentUser->name?> <?=$currentUser->surname?>" />
							<?php } ?>
							
						</div>
					</div>
					<div class="profile-user-description">

						<?php #Проверяем указаны ли у пользователя параметры учетной записи ?>
						<?php if ($_SESSION['logged_user']['name'] != "" && $_SESSION['logged_user']['surname'] != "") { ?>
							<span>Имя и фамилия</span>
							<div class="profile-user-description__title"><?=$currentUser->name?> <?=$currentUser->surname?></div>
						<?php } ?>

						<span>Email</span>
						<div class="profile-user-description__email"><?=$currentUser->email?></div>

						<?php if ($_SESSION['logged_user']['city'] != "" && $_SESSION['logged_user']['country'] == "") { ?>
							<span>Город</span>
							<div class="profile-user-description__city"><?=$currentUser->city?></div>
						<?php } elseif ($_SESSION['logged_user']['city'] == "" && $_SESSION['logged_user']['country'] != "") { ?>
							<span>Страна</span>
							<div class="profile-user-description__city"><?=$currentUser->country?></div>
						<?php } elseif ($_SESSION['logged_user']['city'] != "" && $_SESSION['logged_user']['country'] != "") { ?>
							<span>Город, Страна</span>
							<div class="profile-user-description__city"><?=$currentUser->city?>, <?=$currentUser->country?></div>
						<?php } ?>

					</div>
				</div>
				<h2 class="title-2">Комментарии пользователя</h2>
				<div class="user-comment mb-10">
					<div class="user-comment-wrap">
						<div class="user-comment-wrap__title"> <a class="user-comment-wrap__link" href="#!" target="_blanck">Поездка в LA</a></div>
						<div class="user-comment-wrap__date"><i class="far fa-clock user-comment-wrap__icon"></i>05 Мая 2017 года в 15:45</div>
					</div>
					<div class="user-comment__content">Замечательный парк, обязательно отправлюсь туда этим летом.</div>
				</div>
				<div class="user-comment mb-10">
					<div class="user-comment-wrap">
						<div class="user-comment-wrap__title"> <a class="user-comment-wrap__link" href="#!" target="_blanck">Ноутбук для веб-разработчика</a></div>
						<div class="user-comment-wrap__date"><i class="far fa-clock user-comment-wrap__icon"></i>15 Мая 2017 года в 10:02</div>
					</div>
					<div class="user-comment__content">Замечательный парк, обязательно отправлюсь туда этим летом.</div>
				</div>
				<div class="user-comment">
					<div class="user-comment-wrap">
						<div class="user-comment-wrap__title"> <a class="user-comment-wrap__link" href="#!" target="_blanck">Настройка Sublime</a></div>
						<div class="user-comment-wrap__date"><i class="far fa-clock user-comment-wrap__icon"></i>12 Мая 2017 года в 20:39</div>
					</div>
					<div class="user-comment__content">Замечательный парк, обязательно отправлюсь туда этим летом.</div>
				</div>
			</div>
		</div>
	</div>
</div>