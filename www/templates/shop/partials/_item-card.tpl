<div class="col-4">
	<div class="section-ui">
		<div class="card card-post-shop mb-50">
			<?php if ( $item->img_small != "") { ?>
			<img class="card-post__img" src="<?=HOST?>usercontent/shop/<?=$item->img_small?>" alt="<?=$item->title?>" />
			<?php } else { ?>
			<img class="card-post__img" src="<?=HOST?>usercontent/blog/320-no-image-blog.png" alt="<?=$item->title?>" />
			<?php } ?>

			<div class="title-shop mt-20 mb-25">
				<?=mbCutString($item->title, 42)?>
			</div>

			<div class="card-price-holder mb-shop-5">
				<div class="card__price">
					<?=price_format($item['price'])?> <span>рублей</span>
				</div>
				<a class="button-shop" href="<?=HOST?>shop/item?id=<?=$item->id?>">Смотреть</a>
			</div>
		</div>
	</div>
</div>