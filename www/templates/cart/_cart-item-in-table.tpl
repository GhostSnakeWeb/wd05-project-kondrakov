<tr>
	<td>
		<?php if ( $item->img_small != "") { ?>
		<img class="cart-img-preview" src="<?=HOST?>usercontent/shop/<?=$item->img_small?>" alt="<?=$item->title?>" />
		<?php } else { ?>
		<img class="cart-img-preview" src="<?=HOST?>usercontent/no-photo.jpg" alt="<?=$post->title?>" />
		<?php } ?>
	</td>
	<td>
		<a target="_blank" href="<?=HOST . 'shop/item?id=' . $item->id?>">
			<?=$item->title?>
		</a>
	</td>
	<td>
		<?php echo $cookieCartArray[$item->id ]; ?>
	</td>
	<td>
		<?=$item->price?> рублей
	</td>
	<td width="200">
		<?php echo price_format($cookieCartArray[$item->id ] * $item->price); ?> рублей
	</td>
	<td>
		<form method="POST" action="<?=HOST?>removefromcart">
			<input type="hidden" name="itemId" id="itemId" value="<?=$item['id']?>">
			<button class="delete-from-cart" type="submit" name="removeFromCart">
				<i class="fas fa-times"></i>
			</button>
		</form>
	</td>


</tr>
