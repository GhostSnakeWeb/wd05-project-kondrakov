<?php 
//Проверяем залогинен ли пользователь
if (isLoggedIn()) { ?>
	<div class="comment mt-35">
		<div class="leave-comment-title">Оставить комментарий</div>
		<div class="leave-comment">
			<div class="leave-comment-avatar">
				<div class="avatar-small">
				<?php if ($_SESSION['logged_user']['avatar_small'] != "") { ?>
					<img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logged_user']['avatar_small']?>" />
				<?php } ?>
				</div>
			</div>
			<form action="<?=HOST?>blog/post?id=<?=$post['id']?>" id="comment-form" class="leave-comment-form mb-10" method="POST">
				<div class="leave-comment-form__name">
					<?=$_SESSION['logged_user']['name']?>
					<?=$_SESSION['logged_user']['surname']?>
				</div>
				<div id="error-block" class="notification__error mt-10 notify-hide">Комментарий не может быть пустым.</div>
				<div class="mb-10"></div><textarea name="commentText" class="textarea" type="text" placeholder="Присоединиться к обсуждению..."></textarea>
				<div class="mb-10"></div><input class="button" type="submit" value="Опубликовать" name="addComment" />
			</form>
		</div>
	</div>
<?php } else { ?>
	<div class="comment__register text-center"><a href="<?=HOST?>login">Войдите</a> или <a href="<?=HOST?>registration">зарегистрируйтесь</a><br />чтобы оставить комментарий</div>
<?php } ?>