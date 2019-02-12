<div id="about-jobs" class="container user-content">
	<div class="col-md-9 offset-md-3">
		<div class="work-experience">
			<div class="work-experience-block">
				<div class="work-experience-block__title">Опыт работы</div>
				<?php if (isAdmin()) { ?> 
					<div class="work-experience-block__button"><a class="button button-edit" href="<?=HOST?>edit-jobs">Редактировать</a></div>
				<?php } ?>
			</div>
			<?php foreach ($jobs as $job) { ?>
				<?php include ROOT . 'templates/about/_card-job.tpl'; ?>
			<?php } ?>
		</div>
	</div>
</div>