<?php 

//Сохраняем id товара, который добавили в корзину
$currentItemId = intval($_POST['itemId']);

//Определяем локальную корзину
if (isset($_COOKIE['cart'])) {
	//json_decode - функция преобразует json формат в объект, true - переводит в ассоциативный массив
	$cartLocal = json_decode($_COOKIE['cart'], true);
} else {
	//Если не было до этого локальной корзины (массив), то создаем ее
	$cartLocal = array();
}

//Если такой товар уже есть в корзине, то увеличиваем его количество на 1, если нет такого товара, то его количество = 1
if (isset($cartLocal[$currentItemId])) {
	$items = $cartLocal[$currentItemId]; //например, 2 товара было
	$items++; //стало 3
	$cartLocal[$currentItemId] = $items; //3
} else {
	// Нет такого товара, то его количество = 1
	$cartLocal[$currentItemId] = 1;
}

//Сохраняем cookie
//json_encode - кодирует ассоциативный массив в json строку
setcookie('cart', json_encode($cartLocal));

//Если пользователь залогинен, то сохраняем в БД
if (isLoggedIn()) {
	$currentUser = $_SESSION['logged_user'];
	// Загружаем пользователя из БД
	$user = R::load('users', $currentUser->id);
	// Записываем данному пользователю в поле cart локальную корзину
	$user->cart = json_encode($cartLocal);
	// Сохраняем пользователя
	R::store($user);
}

//Возвращаем на страницу товара
header('Location: ' . HOST . 'shop/item?id=' . $currentItemId);


?>