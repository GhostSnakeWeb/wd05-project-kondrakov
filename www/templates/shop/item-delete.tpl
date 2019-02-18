<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-1 post-add__title">Удалить товар</div>
				<p>Вы действительно хотите удалить товар <strong><?=$item['title']?></strong> с id = <?=$item['id']?>?</p>
				<form class="post-add-form" action="<?=HOST?>shop/item-delete?id=<?=$item['id']?>" method="POST">
					<div class="post-add-form-button"><input class="button button-delete" type="submit" value="Удалить" name="itemDelete" />
						<div class="post-add-form-button__cancel"><a class="button" href="<?=HOST?>shop/item?id=<?=$item->id?>">Отмена</a></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>