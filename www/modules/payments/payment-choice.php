<?php 

$title = "Выбор типа оплаты - Магазин";

// Если есть id заказа (номер) и пользователь залогинен
if (isset($_GET['id']) && isLoggedIn()) {
	// Проверяем, что это заказ пользователя
	$orderId = intval($_GET['id']);
	$order = R::findOne('orders', 'id = ' . $orderId);

	// Проверяем, если у заказа id пользователя совпадает с id залогиненого пользователя
	if ($order->user_id != $_SESSION['logged_user']['id']) {
		header('Location: ' . HOST);
		die();
	}

	// Сохраняем заказ в сессию
	$_SESSION['order'] = $order;

} elseif (isset($_SESSION['current_order'])) {
	// Если в сессии есть текущий заказ, при условии, что пользователь не залогинен
	$orderId = $_SESSION['current_order'];
	$order = R::findOne('orders', 'id = ' . $orderId);
	// Сохраняем заказ в сессию
	$_SESSION['order'] = $order;
} else {
	header('Location: ' . HOST);
	die();
}

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/payments/payment-choice.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>