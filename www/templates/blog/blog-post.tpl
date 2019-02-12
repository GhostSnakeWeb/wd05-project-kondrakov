<div class="sticky-footer-content">
	<div class="container user-content pt-70 make-relative">
		<div class="row">
			<div class="col-10 offset-1">
				<?php if (isAdmin()) { ?> 
					<div class="blog__button--edit">
						<a class="button button-edit" href="<?=HOST?>blog/post-edit?id=<?=$post['id']?>">Редактировать</a>
						<a class="button button-delete" href="<?=HOST?>blog/post-delete?id=<?=$post['id']?>">Удалить</a>
					</div>
				<?php } ?>
				<div class="blog-post">
					<div class="blog-post-heading-wrapper">
						<h1 class="blog-post__title title-1"><?=$post['title']?></h1>
						<div class="blog-post__info">
							<div class="blog-post__info-name"><?=$post['name']?> <?=$post['surname']?></div>
							<div class="blog-post__info-category"><a href="#!"><?=$post['cat_title']?></a></div>

							<?php if ($post['update_time'] != '') { ?>
								<div class="blog-post__info-date"><? echo 'Обновлен: ' . rus_date("j F Y H:i", strtotime($post['update_time']));?></div>
							<?php } else { ?>
								<div class="blog-post__info-date"><? echo rus_date("j F Y H:i", strtotime($post['date_time']));?></div>
							<?php } ?>
							
							<?php if (count($comments) > 0) { ?>
							<div class="blog-post__info-comment-count"><a href="#comments"><?php commentNumber(count($comments));?></a></div>
							<?php } ?>
						</div>
					</div>	

					<?php if ($post['post_img'] != ""){ ?>
							<img class="blog-post__image" alt="<?=$post['title']?>" src="<?=HOST?>usercontent/blog/<?=$post['post_img']?>" />
					<?php } else { ?>
							
					<?php } ?>
					<div class="blog-post__content"><?=$post['text']?></div>
				</div>
				<div class="blog__buttons mt-30 mb-35">
					<div class="button__arrow-wrap"><a class="button button-backward" href="#!">Назад</a><i class="fas fa-arrow-left"></i></div>
					<div class="button__arrow-wrap"><a class="button button-forward" href="#!">Вперед</a><i class="fas fa-arrow-right"></i></div>
				</div>
				
				<?php 

					//Если количество элементов больше 0
					if (count($comments) > 0) { ?>
					<div id="comments" class="two-comments__title"><?php commentNumber(count($comments)); ?></div>
					<?php foreach ($comments as $comment){ 
						include ROOT . 'templates/blog/_comment-card.tpl';						
					} ?>
				<?php } ?>

				<!-- Добавление комментария -->

				<?php include ROOT . 'templates/blog/_add-comment-form.tpl'; ?>

			</div>
		</div>
	</div>
</div>