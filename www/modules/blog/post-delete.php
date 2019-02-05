<?php 

//Закрываем доступ к странице для не админа
if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Удалить пост";

$post = R::load('posts', $_GET['id']);

if (isset($_POST['postDelete'])) {

	$postImgFolderLocation = ROOT . 'usercontent/blog/';

	$postImg = $post->post_img;

	if ($postImg != '') {
		//Записываем текущее нахождение картинки и её имя
		$picurl = $postImgFolderLocation . $postImg; 
		//Удаляем картинку, если существует такой файл
		if (file_exists($picurl)) {
			unlink($picurl);
		}
		$picurl320 = $postImgFolderLocation . "320-" . $postImg;
		//Удаляем маленькую картинку, если существует такой файл
		if (file_exists($picurl320)) {
			unlink($picurl320);
		}
	}

	R::trash($post);
	header("Location: " . HOST . "blog?result=postDeleted");
	exit();

}

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/blog/post-delete.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>