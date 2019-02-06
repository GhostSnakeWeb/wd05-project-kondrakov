<?php 

//Закрываем доступ к странице для не админа
if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Создать новую категорию";

if (isset($_POST['catNew'])) {

	if (trim($_POST['catTitle']) == '') {
		$errors[] = ['title' => 'Введите название категории'];
	}

	//Проверям, если есть такая категория в БД, то выводим ошибку
	if (R::findOne('categories', 'cat_title = ?', array($_POST['catTitle']))) {
		$errors[] = ['title' => "Данная категория уже существует"];
	}

	if (empty($errors)) {

		$cat = R::dispense('categories');
		$cat->cat_title = htmlentities($_POST['catTitle']);
		R::store($cat);
		header("Location: " . HOST . "blog/categories?result=catCreated");
		exit();

	}
}		

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/categories/new.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>