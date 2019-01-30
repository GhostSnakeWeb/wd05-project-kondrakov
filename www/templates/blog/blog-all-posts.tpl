<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="blog__header mb-50">
			<span>Блог веб-разработчика</span>
			<a class="button button-edit" href="<?=HOST?>blog/post-new">Добавить пост</a>
		</div>
		<div class="row mb-50">
			<?php foreach ($posts as $post) { 
				include ROOT . 'templates/_parts/_blog-card.tpl';
			} ?>
		</div>
	</div>
</div>