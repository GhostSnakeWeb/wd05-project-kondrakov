<?php

//Закрываем доступ к странице для не админа
if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$skills = R::load('skills', 1);

$title = "Редактировать - Технологии";

if (isset($_POST['skillsUpdate'])) {


	//Из POST массива ВСЕГДА! приходит строка

	//intval — Возвращает целое значение переменной
	//strtoupper - Преобразует строку в верхний регистр
	foreach ($_POST as $index => $value) {

		if ($value == '') {
			$errors[] = ['title' => 'Поле ' . strtoupper($index) . ' не должно быть пустым'];
		}

		if (intval($value) > 100 || intval($value) < 0) {
			$errors[] = ['title' => 'Введите число от 0 до 100 в поле ' . strtoupper($index)];
		}
	}

	if (empty($errors)) {

		//При сохранении слова преобразуем текст в 0
		//Как вариант проверять через регулярку, чтобы приходило только число
		$skills->html = htmlentities(intval($_POST['html']));
		$skills->css = htmlentities(intval($_POST['css']));
		$skills->js = htmlentities(intval($_POST['js']));
		$skills->jquery = htmlentities(intval($_POST['jquery']));
		$skills->php = htmlentities(intval($_POST['php']));
		$skills->mysql = htmlentities(intval($_POST['mysql']));
		$skills->git = htmlentities(intval($_POST['git']));
		$skills->gulp = htmlentities(intval($_POST['gulp']));
		$skills->yarn = htmlentities(intval($_POST['yarn']));
		$skills->npm = htmlentities(intval($_POST['npm']));

		R::store($skills);
		header('Location: ' . HOST . 'about#about-technology');
		exit();
	}

}

//Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/about/edit-skills.tpl";
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>