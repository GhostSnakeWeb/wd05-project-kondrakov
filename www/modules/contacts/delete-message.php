<?php 

//Закрываем доступ к странице для не админа
if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Удалить сообщение";

//Из таблицы messages загружаем сообщение по id
$message = R::load('messages', $_GET['id']);

if (isset($_POST['messageDelete'])) {

	$messageImgFolderLocation = ROOT . 'usercontent/upload_files/';

	$messageImg = $message->message_file;

	if ($messageImg != '') {
		//Записываем текущее нахождение картинки и её имя
		$picurl = $messageImgFolderLocation . $messageImg; 
		//Удаляем картинку, если существует такой файл
		if (file_exists($picurl)) {
			unlink($picurl);
		}
	}	
	
	R::trash($message);
	header('Location: ' . HOST . 'messages?result=messageDeleted');
	exit();

}

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/contacts/delete-message.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>