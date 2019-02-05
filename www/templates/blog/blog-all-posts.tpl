<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<?php 
			//Если пришел массив GET с result
			if (isset($_GET['result'])) {
				include ROOT . 'templates/blog/_results.tpl';
			}
		?>
		<div class="blog__header mb-50">
			<span>Блог веб-разработчика</span>
			<?php if (isAdmin()) { ?> 
				<a class="button button-edit" href="<?=HOST?>blog/post-new">Добавить пост</a>
			<?php } ?>
			
		</div>
		<div class="row mb-50">
			<?php foreach ($posts as $post) { 
				include ROOT . 'templates/_parts/_blog-card.tpl';
			} ?>
		</div>
	</div>
</div>