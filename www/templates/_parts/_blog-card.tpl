<div class="col-4">
	<div class="section-ui">
		<div class="card-post">
			<div class="card-post__image mb-15">
				
				<?php if ($post->post_img_small != ""){ ?>
						<img src="<?=HOST?>usercontent/blog/<?=$post->post_img_small?>" alt="<?=$post->title?>"/>
				<?php } else { ?>
						<img src="<?=HOST?>usercontent/blog/no-image-blog.png" alt="<?=$post->title?>"/>
				<?php } ?>
								
			</div>
			<div class="card-post__title">
				<?php echo mbCutString($post->title, 44);?>		
			</div>
			<a class="button" href="<?=HOST?>blog/post?id=<?=$post->id?>">Читать</a>
		</div>
	</div>
</div>