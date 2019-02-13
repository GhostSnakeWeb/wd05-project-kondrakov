<?php 

//Закрываем доступ к странице для не админа
if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Удалить товар";

//Загружаем товар по id
$item = R::load('goods', $_GET['id']);

if (isset($_POST['itemDelete'])) {

	$itemImgFolderLocation = ROOT . 'usercontent/shop/';

	$itemImg = $item->img;

	if ($itemImg != '') {
		//Записываем текущее нахождение картинки и её имя
		$picurl = $itemImgFolderLocation . $itemImg; 
		//Удаляем картинку, если существует такой файл
		if (file_exists($picurl)) {
			unlink($picurl);
		}
		$picurl320 = $itemImgFolderLocation . "320-" . $itemImg;
		//Удаляем маленькую картинку, если существует такой файл
		if (file_exists($picurl320)) {
			unlink($picurl320);
		}
	}

	R::trash($item);
	header("Location: " . HOST . "shop?result=itemDeleted");
	exit();

}

//Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/shop/item-delete.tpl";
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>