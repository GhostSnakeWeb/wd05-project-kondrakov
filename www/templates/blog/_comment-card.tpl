<div class="two-comments-container">
	<div class="two-comments-container__avatar">
		<?php if ($comment['avatar_small'] != "") { ?>
			<div class="avatar"><img src="<?=HOST?>usercontent/avatar/<?=$comment['avatar_small']?>" /></div>
		<?php } ?>
	</div>
	<div class="two-comments-container-block">
		<div class="two-comments-container-block-wrap">
			<div class="two-comments-container-block-wrap__name"><?=$comment['name']?> <?=$comment['surname']?></div>
			<div class="two-comments-container-block-wrap__date"><i class="far fa-clock two-comments-container-block-wrap-icon"></i><?=$comment['date_time']?></div>
		</div>
		<div class="two-comments-container-block__message"><?=$comment['text']?></div>
	</div>
</div>