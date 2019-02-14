<div class="container mt-70 mb-120 justify-content-center">
	<div class="blog-full-post">
		<div class="blog__header mb-50">
			<?php if (isAdmin()) { ?> 
				<div class="blog__button--edit">
					<a class="button button-edit" href="<?=HOST?>shop/item-edit?id=<?=$item['id']?>">Редактировать</a>
					<a class="button button-delete" href="<?=HOST?>shop/item-delete?id=<?=$item['id']?>">Удалить</a>
				</div>
			<?php } ?>
		</div>
		<!-- row -->
		<div class="row">

			<?php if ( $item['img'] != "") { ?>
			<div class="col">
				<div class="blog__image">
					<img src="<?=HOST?>usercontent/shop/<?=$item['img']?>" alt="<?=$item['title']?>" />
				</div>
			</div>
			<?php } ?>
			
			<!-- Item desc  -->
			<div class="col pt-40">
				<h1 class="blog__heading"><?=$item['title']?></h1>
				<div class="price-holder">
					<?php if ( $item['price_old'] ): ?>
					<div class="price-old">
						<?=price_format($item['price_old'])?>
					</div>
					<?php endif ?>

					<div class="price">
						<?=price_format($item['price'])?> <span>рублей</span>
					</div>
				</div>
				
				<form id="addToCart" action="<?=HOST?>addtocart" method="POST">
					<input type="hidden" name="itemId" id="itemId" value="<?=$item['id']?>">
					<input class="button button-edit mb-15" type="submit" name="addToCart" value="В корзину">
				</form>

				<div class="user-content">
					<?=$item['desc']?>
				</div>
				<a class="to-shop" href="<?=HOST?>shop"><i class="fas fa-angle-left mr-10"></i>В магазин</a>
			</div>
			<!-- // Item desc  -->
		</div>
		<!-- // row -->
	</div>
</div>