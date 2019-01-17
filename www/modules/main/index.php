<?php 

$details = R::find('about');
//print_r($details);

$aboutName = $details[1]['name'];
$aboutDescription = $details[1]['description'];

$title = "Главная";
$content = "Содержимое главной страницы";

//Готовим контент для цетральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/main/main.tpl.php";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_header.tpl.php";
include ROOT . "templates/template.tpl.php";
include ROOT . "templates/_parts/_footer.tpl.php";

?>