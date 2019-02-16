<?php 

$title = "Заказ - Магазин";

// Зная id пользователя нахожим его заказы
if (!isAdmin()) {
	header('Location: ' . HOST);
	exit();
}

$orderId = intval($_GET['id']);
$order = R::findOne('orders', 'id = '.$orderId);

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/orders/order.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>