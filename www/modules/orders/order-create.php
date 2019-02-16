<?php 

$title = "Создать заказ - Магазин";

/*

Формируем корзину на основе COOKIES
Но, в COOKIES лежат только ID и Количество товаров, 
поэтому делаем запрос в БД, чтобы получить картинки и названия товаров

*/

if (isset($_COOKIE['cart'])) {

	$cookieCartArray = json_decode($_COOKIE['cart'], true);

	// Запрашиваем куки. Проверяем лежит ли там что-то (необходимо будет для удаления товаров из корзины)
	if (count($cookieCartArray) > 0) {

		// Формируем массив, который содержит в себе только ключи (id товаров)
		$cartItems = array();
		foreach ($cookieCartArray as $key => $value) {
			$cartItems[] = $key;
		}

		// На основе Cookie отправляем запрос в БД на товары в корзине. Т.е. получаем из БД массив с информацией только о тех товарах, которые есть в Cookie
		$cartGoods = R::findLike('goods', [
			// 'id' => ['10', '11'] - найдутся товары с id в ассоциативном массиве
			'id' => $cartItems
		], 'ORDER BY id ASC');
	} else {
		$cartGoods = array();
	}
}

$cartGoodsCount = 0;

// Считаем сколько элементов в корзине
$cartGoodsCount = array_sum($cookieCartArray);

// Считаем общую цену элементов в корзине
$cartGoodsTotalPrice = 0;
foreach ($cartGoods as $item) {
	$cartGoodsTotalPrice += $cookieCartArray[$item->id] * $item->price;
}

// Если в корзине нет товаров и пытаемся создать заказ
if ($cartGoodsTotalPrice <= 0) {
	header('Location: ' . HOST . 'cart');
	exit();
}

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/orders/order-create.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>