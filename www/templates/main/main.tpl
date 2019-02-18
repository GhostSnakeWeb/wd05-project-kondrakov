<?php require_once ROOT . "templates/about/_about-text.tpl"; ?>
<div class="hr-line"></div>
<div class="sticky-footer-content pt-80 pb-55">
	<div class="container user-content mb-100">
		<div class="works__header mb-40 title-1"><span> <strong>Новые записи в <a href="<?=HOST?>blog" target="_blank">блоге</a></strong></span></div>
		<div class="row">
			<?php foreach ($posts as $post) { 
				include ROOT . 'templates/_parts/_blog-card.tpl';
			} ?>
		</div>
		<?php include ROOT . 'templates/_parts/_pagination.tpl'; ?>
	</div>
</div>