<div class="work-experience-post">
	<div class="work-experience-post-wrap">
		<div class="work-experience-post-wrap__date"><?=$job->period?></div>
		<div class="work-experience-post-button"><a class="button button-delete" href="<?=HOST?>delete-jobs?id=<?=$job['id']?>">Удалить</a></div>
	</div>
	<div class="work-experience-post__title"><?=$job->title?></div>
	<div class="work-experience-post__message"><?=$job->description?></div>
</div>