<?php 

$title = "Информация о заказе - Магазин";

// Зная id пользователя нахожим его заказы
if (!isLoggedIn()) {
	header('Location: ' . HOST . 'login');
	exit();
}

// Получаем id заказа
$orderId = intval($_GET['id']);
// findOne - возвращает одну запись
$order = R::findOne('orders', 'id = '.$orderId);

// Проверяем, если у заказа id пользователя совпадает с id залогиненого пользователя
if ($order->user_id != $_SESSION['logged_user']['id']) {
	header('Location: ' . HOST);
	die();
}

// Декодируем JSON строку из БД в массив
$orderItems = json_decode($order['items']);

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/orders/myorder.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>