<?php 

echo "Hello";

$post = R::load('posts', $_POST['id']);

echo "<pre>";
print_r($post);
echo "</pre>";

die();

//Удаление картинки в Редактировании поста

/*$postImgFolderLocation = ROOT . 'usercontent/blog/';

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
}*/

/*$post->post_img = null;
$post->post_img_small = null;

R::store($post);*/

/*header("Location: " . HOST . "blog/post-edit?id=" . $_GET['id'] . "&result=picDeleted");
exit();*/

?>