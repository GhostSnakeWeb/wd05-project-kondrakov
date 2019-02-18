<?php 

//Закрываем доступ к странице для не админа
if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Магазин - Создать новый товар";

if (isset($_POST['itemNew'])) {

	if (trim($_POST['title']) == '') {
		$errors[] = ['title' => 'Введите Название товара'];
	}

	if (trim($_POST['price']) == '') {
		$errors[] = ['title' => 'Введите Стоимость товара'];
	}

	//Проверяем имя файла и временное местонахождение файла
	if(isset($_FILES['itemImg']['name']) && $_FILES['itemImg']['tmp_name'] != "") {

		//Записываем параметры картинки в переменные
		$fileName = $_FILES['itemImg']['name'];
		$fileTempLoc = $_FILES['itemImg']['tmp_name'];
		$fileType = $_FILES['itemImg']['type'];
		$fileSize = $_FILES['itemImg']['size'];
		$fileErrorMsg = $_FILES['itemImg']['error'];
		$kaboom = explode(".", $fileName);
		$fileExt = end($kaboom);

		//Проверяем файл на разные свойства
		list($width, $height) = getimagesize($fileTempLoc);

		if ($width < 10 || $height < 10) {
			$errors[] = ['title' => 'Изображение не имеет размеров'];		
		}

		if ($fileSize > 2097152) {
			$errors[] = ['title' => 'Размер изображения не должен быть более 2 Мб'];
		}

		if (preg_match("/\.(gif|jpg|jpeg|png)$/i", $fileName) == 0) {
			$errors[] = ['title' => 'Неверный формат файла', 'desc' => '<p>Файл изображения должен быть в формате gif, jpg, jpeg или png.</p>'];
		}

		if ($fileErrorMsg == 1) {
			$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку'];
		}
	}

	if (empty($errors)) {
		$item = R::dispense('goods');

		$item->title = htmlentities($_POST['title']);
		$item->price = htmlentities($_POST['price']);
		$item->priceOld = htmlentities($_POST['priceOld']);
		$item->desc = $_POST['itemDesc'];

		//Проверяем имя файла и временное местонахождение файла
		if(isset($_FILES['itemImg']['name']) && $_FILES['itemImg']['tmp_name'] != "") {

			//Перемещаем загруженный файл в нужную дерикторию

			//Создаем индивидуальное имя для файла
			$db_file_name = rand(10000000000000, 99999999999999) . "." . $fileExt;
			//Где будем хранить картинки постов из блога
			$itemImgFolderLocation = ROOT . 'usercontent/shop/';
			//Переменная, содержащая индивидуальное имя файла и местонахождение файла для дальнейшей загрузки
			$uploadfile = $itemImgFolderLocation . $db_file_name;
			//Перемещаем файл
			$moveResult = move_uploaded_file($fileTempLoc, $uploadfile);

			if ($moveResult != true) {
				$errors[] = ['title' => 'Ошибка сохранения файла'];
			}

			//Подключаем библиотеку
			include_once ROOT . 'libs/image_resize_imagick.php';
			//Записываем путь к измененному файлу
			$target_file = $itemImgFolderLocation . $db_file_name;
			$wmax = 920;
			$hmax = 620;
			//Создаем миниатюру. Возвращается объект.
			$img = createThumbnailCropNew($target_file, $wmax, $hmax);
			//Записываем измененную картинку из буфера
			$img->writeImage($target_file);

			//Записываем в БД большую картинку поста
			$item->img = $db_file_name;

			//Миниатюры
			$target_file = $itemImgFolderLocation . $db_file_name;
			$resized_file = $itemImgFolderLocation . "320-" . $db_file_name;
			$wmax = 320;
			$hmax = 140;
			//Создаем миниатюру. Возвращается объект
			$img = createThumbnailCropNew($target_file, $wmax, $hmax);
			//Записываем измененную картинку из буфера
			$img->writeImage($resized_file);

			//Записываем в БД большую картинку поста
			$item->imgSmall = "320-" . $db_file_name;
		}

		R::store($item);
		header('Location: ' . HOST . 'shop?result=itemCreated');
		exit();
	}
}


//Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/shop/item-new.tpl";
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>