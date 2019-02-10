<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-1 post-add__title">Удалить категорию</div>
				<p>Вы действительно хотите удалить категорию <strong><?=$cat['cat_title']?></strong> с id = <?=$cat['id']?>?</p>
				<form class="post-add-form" action="<?=HOST?>about/category-delete?id=<?=$job['id']?>" method="POST">
					<div class="post-add-form-button"><input class="button button-delete" type="submit" value="Удалить" name="catDelete" />
						<div class="post-add-form-button__cancel"><a class="button" href="<?=HOST?>edit-jobs">Отмена</a></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>