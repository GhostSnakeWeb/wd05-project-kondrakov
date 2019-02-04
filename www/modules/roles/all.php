<?php 

$title = "Роли пользователей";

//Находим роли пользователей и сортируем по id по возрастанию
$roles = R::find('users', 'ORDER BY id ASC');

//Находим доступные роли и сортируем по id по возрастанию
$allRoles = R::find('roles', 'ORDER BY id ASC');

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/roles/all.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>