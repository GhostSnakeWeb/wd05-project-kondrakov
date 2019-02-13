<?php 

$title = "Магазин - Все товары";

//Пагинация, т.е. разделение контента по страницам
$pagination = pagination(6, 'goods');

$goods = R::find('goods', 'ORDER BY id DESC ' . $pagination['sql_pages_limit']);

//Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/shop/all-items.tpl";
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>