<?php 

//Закрываем доступ к странице для не админа
if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Удалить место работы";

//Из таблицы categories загружаем нужную запись по id
$job = R::load('jobs', $_GET['id']);

if (isset($_POST['jobDelete'])) {

	//Удаляем категорию. Можно использовать метод hunt, который найдет и сразу удалит бин (см. документацию)
	R::trash($job);
	header("Location: " . HOST . "edit-jobs?result=jobDeleted");
	exit();
}

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/about/delete-jobs.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>