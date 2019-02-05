<?php 

//Закрываем доступ к странице для не админа
if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Редактировать категорию";

//Из таблицы categories загружаем нужную запись по id
$cat = R::load('categories', $_GET['id']);

if (isset($_POST['catEdit'])) {

	if (trim($_POST['catTitle']) == '') {
		$errors[] = ['title' => 'Введите название категории'];
	}

	if (empty($errors)) {

		//Меняем название категории
		$cat->cat_title = htmlentities($_POST['catTitle']);
		R::store($cat);
		header("Location: " . HOST . "blog/categories?result=catUpdated");
		exit();
	}

}

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/categories/edit.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>