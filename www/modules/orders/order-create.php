<?php 

$title = "Создать заказ - Магазин";

/* • • • • • • • • • • • • • • • •  • • • • • • 
	ПОЛУЧАЕМ ДАННЫЕ ДЛЯ ВЫВОДА ТОВАРОВ ЗАКАЗА
 • • • • • • • • • • • • • • • •  • • • • • •  */

if (isset($_COOKIE['cart'])) {
	$cookieCartArray = json_decode($_COOKIE['cart'], true);

	// echo "<pre>";
	// print_r($cookieCartArray);
	// echo count( $cookieCartArray );
	// echo "</pre>";

	// Запрашиваем Cookie
	if ( count( $cookieCartArray ) > 0 ) {
		$cartItems = array();
		foreach ( $cookieCartArray as $key => $value) {
			$cartItems[] = $key; // [1, 5, 10]
		}

		// На основе Cookie отправляем запрос в БД на товрары в корзине
		$cartGoods = R::findLike('goods', [
		   // 'id' => ['10', '11']
		    'id' => $cartItems
		], ' ORDER BY id ASC ');

	} else {
		$cartGoods = array();
	}
}

$cartItemsArray = json_decode($_COOKIE['cart'], true);
$cartGoodsCount = 0;
$cartGoodsCount = array_sum($cartItemsArray);
$cartGoodsTotalPrice = 0;
foreach ($cartGoods as $item) {
	$cartGoodsTotalPrice += $cartItemsArray[$item->id ] * $item->price;
}

if ( $cartGoodsCount <= 0 ) {
	header("Location: " . HOST . 'cart');
	exit();
}

/* • • • • • • • • • • • • • • • • • • • • • • • • • • •
	МАССИВ ТОВАРОВ В ЗАКАЗЕ ПОЛЬЗОВАТЕЛЯ 
 • • • • • • • • • • • • • •  • • • • • • • • • • • • • */

$orderedGoodsSummary = array();

foreach ($cartGoods as $item) {
	$newItem = array();
	$newItem['id'] = $item->id;
	$newItem['price'] = $item->price;
	$newItem['count'] = $cartItemsArray[$item->id];
	$newItem['title'] = $item->title;
	$orderedGoodsSummary[] = $newItem;
}

/* • • • • • • • • • • • • • • • • • • • • • • • • • • •
	ОБРАБОТКА POST ЗАПРОСА, СОХРАНЯЕМ ЗАКАЗ В БД 
• • • • • • • • • • • • • • •  • • • • • • • • • • • • • */

if ( isset($_POST['createOrder'])) {

	if ( $cartGoodsCount <= 0) {
		$errors[] = [
			'title' => 'Заказ не может быть пустым.', 
			'desc' => 'Добавьте товары в корзину чтобы сделать заказ.' 
		];
	}

	if ( trim($_POST['name']) == '') {
		$errors[] = ['title' => 'Введите Имя' ];
	}

	if ( trim($_POST['surname']) == '') {
		$errors[] = ['title' => 'Введите Фамилию' ];
	}

	if ( trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email' ];
	}

	if ( trim($_POST['phone']) == '') {
		$errors[] = ['title' => 'Введите телефон' ];
	}

	if ( empty($errors)) {

		$order = R::dispense('orders');

		$order->name = htmlentities($_POST['name']);
		$order->surname = htmlentities($_POST['surname']);
		$order->email = htmlentities($_POST['email']);
		$order->phone = htmlentities($_POST['phone']);
		$order->address = htmlentities($_POST['address']);
		$order->items = json_encode($orderedGoodsSummary);

		if ( isLoggedIn() ) {
			$order->userId = $_SESSION['logged_user']['id'];
		}

		$order->itemsCount = $cartGoodsCount;
		$order->totalPrice = $cartGoodsTotalPrice;

		$order->status = 'new';
		$order->payment = 'no';
		$order->dateTime = R::isoDateTime();

		R::store($order);

		// Очистить   корзину в COOKIES
		SetCookie("cart", "");

		// Очистить   корзину в БД
		if ( isLoggedIn() ) {
			$currentUser = $_SESSION['logged_user'];
			$user = R::load('users', $currentUser->id);
			$user->cart = "";
			R::store($user);
		}

		// Сохраняем ID заказа в сессию чтобы  после идентифицировать   заказ при оплате
		$_SESSION['current_order'] = $order['id'];
		
		header('Location: ' . HOST . "order-created-success");
		exit();

	}
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