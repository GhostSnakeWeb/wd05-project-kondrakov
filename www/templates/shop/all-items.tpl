<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<?php 
			//Если пришел массив GET с result
			if (isset($_GET['result'])) {
				include ROOT . 'templates/shop/partials/_results.tpl';
			}
		?>
		<div class="blog__header mb-50">
			<span>Магазин</span>
			<?php if (isAdmin()) { ?> 
				<a class="button button-edit" href="<?=HOST?>shop/new">Добавить товар</a>
			<?php } ?>
		</div>
		<div class="row mb-50">
			<?php foreach ($goods as $item) { 
				include ROOT . 'templates/shop/partials/_item-card.tpl';
			} ?>
		</div>
	</div>
</div>