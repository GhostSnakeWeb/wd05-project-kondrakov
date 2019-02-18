<?php 

//ID товара который удаляем из корзины
$currentItemId = intval($_POST['itemId']);

// Определяем локальную корзину
if (isset($_COOKIE['cart'])) {
	$cartLocal = json_decode($_COOKIE['cart'], true);
} else {
	$cartLocal = array();
}

// Если такой товар уже есть в Корзине, тогда уменьшаем его кол-во на 1, если нет, то убираем его из массива корзины
if (isset($cartLocal[$currentItemId])) {
	if ($cartLocal[$currentItemId] > 1) {
		$items = $cartLocal[$currentItemId]; //например, 3 товара было
		$items--; //стало 2
		$cartLocal[$currentItemId] = $items; //2
	} else {
		unset($cartLocal[$currentItemId]);
	}
}

// Сохраняем корзину в Cookies
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

header('Location: ' . HOST . 'cart');
exit();


?>