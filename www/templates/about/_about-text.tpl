<div class="container user-content pt-80 pb-55">
	<div class="row">
		<div class="col-md-3">
			<div class="about-me__avatar">
				<div class="avatar avatar--big">
					<?php if ($about->photo != '') { ?>
						<img src="<?=HOST?>usercontent/about/<?=$about->photo?>" />
					<?php } ?>
				</div>
			</div>
		</div>
		<div class="col-md-9">
			<div class="about-me-description">
				<div class="about-me-description-wrap">
					<div class="about-me-description-wrap__name mb-15"><?=$about->name?></div>
					<?php if (isAdmin()) { ?> 
						<div class="about-me-description-wrap__button"><a class="button button-edit" href="<?=HOST?>edit-text">Редактировать</a></div>
					<?php } ?>
				</div>
				<div class="about-me-description__content"><?=$about->description?></div>
			</div>
		</div>
	</div>
</div>