<?php 

//Закрываем доступ к странице для не админа
if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Редактировать контакты";

//Загружаем запись с id = 1 из таблицы contacts
$contacts = R::load('contacts', 1);

//Проверяем отправлена ли форма
if (isset($_POST['contactsUpdate'])) {

	if (trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email'];
	}

	if (trim($_POST['phone']) == '') {
		$errors[] = ['title' => 'Введите телефон'];
	}

	if (trim($_POST['address']) == '') {
		$errors[] = ['title' => 'Введите адрес'];
	}

	if (empty($errors)) {
		//Основные поля
		$contacts->email = htmlentities($_POST['email']);
		$contacts->phone = htmlentities($_POST['phone']);
		$contacts->address = htmlentities($_POST['address']);

		//Дополнительные поля
		$contacts->name = htmlentities($_POST['name']);
		$contacts->surname = htmlentities($_POST['surname']);
		$contacts->skype = htmlentities($_POST['skype']);
		$contacts->vk = htmlentities($_POST['vk']);
		$contacts->fb = htmlentities($_POST['fb']);
		$contacts->github = htmlentities($_POST['github']);
		$contacts->twitter = htmlentities($_POST['twitter']);

		R::store($contacts);
		header('Location: ' . HOST . 'contacts?result=contactsEdit');
		exit();
	}
}

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/contacts/edit.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>