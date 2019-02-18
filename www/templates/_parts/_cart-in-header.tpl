<?php
#Проверяем есть ли корзина
if (isset($_COOKIE['cart'])) { 
	#Подсчитываем количество товаров в корзине. Из JSON в ассоциативный массив
	#array_sum — Вычисляет сумму значений массива
	$itemsInCart = array_sum(json_decode($_COOKIE['cart'], true));

	#Если товаров в корзине больше 0, то выводим разметку корзины
	if ($itemsInCart > 0) { ?>
		<div class="cart">
			<a href="<?=HOST?>cart"><i class="fas fa-shopping-cart"></i> <?=$itemsInCart?> товаров</a>
		</div>
	<?php }
} ?>