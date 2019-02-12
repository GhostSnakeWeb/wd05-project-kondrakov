<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-1 post-add__title">Удалить место работы</div>
				<p>Вы действительно хотите удалить место работы ? 
				<?php include ROOT . 'templates/about/_card-job-delete.tpl'; ?></p>
				<form class="post-add-form" action="<?=HOST?>delete-jobs?id=<?=$job['id']?>" method="POST">
					<div class="post-add-form-button"><input class="button button-delete" type="submit" value="Удалить" name="jobDelete" />
					<div class="post-add-form-button__cancel"><a class="button" href="<?=HOST?>edit-jobs">Отмена</a></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>