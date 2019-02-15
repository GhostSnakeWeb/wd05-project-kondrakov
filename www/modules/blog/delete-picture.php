<?php 

// Записываем ID поста полученные из ajax
$currentPostId = intval($_POST['id']);

// Находим пост по ID
$post = R::load('posts', $_POST['id']);

//Удаление картинки в Редактировании поста

$postImgFolderLocation = ROOT . 'usercontent/blog/';

$postImgBig = $post->post_img;

if ($postImgBig != '') {
	//Записываем текущее нахождение картинки и её имя
	$picurl = $postImgFolderLocation . $postImgBig; 
	//Удаляем картинку, если существует такой файл
	if (file_exists($picurl)) {
		unlink($picurl);
	}
	$picurl320 = $postImgFolderLocation . "320-" . $postImgBig;
	//Удаляем маленькую картинку, если существует такой файл
	if (file_exists($picurl320)) {
		unlink($picurl320);
	}

	$post->post_img = null;
	$post->post_img_small = null;

	R::store($post);
	echo "true";
} else {
	echo "false";
}



?>