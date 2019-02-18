<?php 

$title = 'Главная';

$pagination = pagination(3, 'posts');

$about = R::findOne('about', 1);

//Делаем сортировку постов по id по убыванию. Т.е. последние посты будут первые. Ограничиваемся 3 постами
$posts = R::find('posts', 'ORDER BY id DESC ' . $pagination['sql_pages_limit']);

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/main/main.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>