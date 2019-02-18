<?php 

$title = "Контакты";

$contacts = R::load('contacts', 1);

if (isset($_POST['newMessage'])) {

	if (trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email'];
	}

	if (trim($_POST['message']) == '') {
		$errors[] = ['title' => 'Введите сообщение'];
	}

	if(isset($_FILES['file']['name']) && $_FILES['file']['tmp_name'] != "") {

		//Записываем параметры картинки в переменные
		$fileName = $_FILES['file']['name'];
		$fileTempLoc = $_FILES['file']['tmp_name'];
		$fileType = $_FILES['file']['type'];
		$fileSize = $_FILES['file']['size'];
		$fileErrorMsg = $_FILES['file']['error'];
		$kaboom = explode(".", $fileName);
		$fileExt = end($kaboom);

		if ($fileSize > 2097152) {
			$errors[] = ['title' => 'Размер изображения не должен быть более 2 Мб'];
		}

		if (preg_match("/\.(pdf|jpg|jpeg|png|doc)$/i", $fileName) == 0) {
			$errors[] = [
				'title' => "Неверный формат файла",
				'desc' => "<p>Файл должен быть в формате pdf, jpg, jpeg, doc или png.</p>"
			];
		}

		if ($fileErrorMsg == 1) {
			$errors[] = ['title' => 'При загрузке файла произошла ошибка. Повторите попытку!'];
		}

	}

	if (empty($errors)) {
		$message = R::dispense('messages');
		$message->email = htmlentities($_POST['email']);
		$message->name = htmlentities($_POST['name']);
		$message->message = htmlentities($_POST['message']);
		$message->dateTime = R::isoDateTime();

		if(isset($_FILES['file']['name']) && $_FILES['file']['tmp_name'] != "") {

			//Создаем индивидуальное имя для файла
			$db_file_name = rand(10000000000000, 99999999999999) . "." . $fileExt;
			//Где будем хранить файлы
			$fileFolderLocation = ROOT . 'usercontent/upload_files/';
			//Переменная, содержащая индивидуальное имя файла и местонахождение файла для дальнейшей загрузки
			$uploadfile = $fileFolderLocation . $db_file_name;
			//Перемещаем файл
			$moveResult = move_uploaded_file($fileTempLoc, $uploadfile);

			if ($moveResult != true) {
				$errors[] = ['title' => 'Ошибка сохранения файла'];
			}
			//Записываем оригинальное имя файла, которое загрузил пользователь
			$message->message_file_name_original = $fileName;
			//Записываем сгенерированное имя файла
			$message->message_file = $db_file_name;
		}

		R::store($message);
		//Уведомляем об успешной отправке сообщения
		$success[] = ['title' => 'Сообщение было успешно отправлено!'];
	}

}

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/contacts/contacts.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>