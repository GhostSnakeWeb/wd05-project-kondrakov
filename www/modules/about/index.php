<?php

$title = "Об авторе";

//Делаем запрос на инфу из таблицы about
$about = R::load('about', 1);

//Получаем записи из БД
$jobs = R::find('jobs', 'ORDER BY id DESC');

//Делаем запрос на инфу из таблицы skills
$skills = R::load('skills', 1);

//Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/about/about.tpl";
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>