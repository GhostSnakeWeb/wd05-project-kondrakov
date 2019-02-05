<div class="sticky-footer-content">
	<div class="container user-content pt-70 make-relative">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="blog__button--edit">
					<a class="button button-edit" href="<?=HOST?>blog/post-edit?id=<?=$post['id']?>">Редактировать</a>
				</div>
				<div class="blog-post">
					<div class="blog-post-heading-wrapper">
						<h1 class="blog-post__title title-1"><?=$post['title']?></h1>
						<div class="blog-post__info">
							<div class="blog-post__info-name"><?=$post['name']?> <?=$post['surname']?></div>
							<div class="blog-post__info-category"><a href="#!"><?=$post['cat_title']?></a></div>
							<div class="blog-post__info-date"><? echo rus_date("j F Y H:i", strtotime($post['date_time']));?></div>
							<div class="blog-post__info-comment-count"><a href="#!">2 комментария</a></div>
						</div>
					</div><img class="blog-post__image" alt="<?=$post['title']?>" src="<?=HOST?>usercontent/blog/<?=$post['post_img']?>" />
					<div class="blog-post__content"><?=$post['text']?></div>
				</div>
				<div class="blog__buttons mt-30 mb-35">
					<div class="button__arrow-wrap"><a class="button button-backward" href="#!">Назад</a><i class="fas fa-arrow-left"></i></div>
					<div class="button__arrow-wrap"><a class="button button-forward" href="#!">Вперед</a><i class="fas fa-arrow-right"></i></div>
				</div>
				<div class="two-comments__title">2 комментария</div>
				<div class="two-comments-container">
					<div class="two-comments-container__avatar">
						<div class="avatar"><img src="../img/avatars/avatar-2.png" /></div>
					</div>
					<div class="two-comments-container-block">
						<div class="two-comments-container-block-wrap">
							<div class="two-comments-container-block-wrap__name">Джон До</div>
							<div class="two-comments-container-block-wrap__date"><i class="far fa-clock two-comments-container-block-wrap-icon"></i>05 Мая 2017 года в 15:45</div>
						</div>
						<div class="two-comments-container-block__message">Замечательный парк, обязательно отправлюсь туда этим летом.</div>
					</div>
				</div>
				<div class="two-comments-container">
					<div class="two-comments-container__avatar">
						<div class="avatar"><img src="../img/avatars/avatar-3.png" /></div>
					</div>
					<div class="two-comments-container-block">
						<div class="two-comments-container-block-wrap">
							<div class="two-comments-container-block-wrap__name">Джон До</div>
							<div class="two-comments-container-block-wrap__date"><i class="far fa-clock two-comments-container-block-wrap-icon"></i>05 Мая 2017 года в 15:45</div>
						</div>
						<div class="two-comments-container-block__message">Замечательный парк, обязательно отправлюсь туда этим летом.</div>
					</div>
				</div>
				<div class="comment mt-35 mb-120">
					<div class="leave-comment-title">Оставить комментарий</div>
					<div class="leave-comment">
						<div class="leave-comment-avatar">
							<div class="avatar"><img src="../img/avatars/avatar-1.jpg" /></div>
						</div>
						<form class="leave-comment-form">
							<div class="leave-comment-form__name">Юрий Ключевский</div>
							<div class="notification__error">Комментарий не может быть пустым.</div>
							<div class="mb-10"></div><textarea class="textarea" type="text" placeholder="Присоединиться к обсуждению..."></textarea>
							<div class="mb-10"></div><input class="button" type="submit" value="Опубликовать" name="button" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>