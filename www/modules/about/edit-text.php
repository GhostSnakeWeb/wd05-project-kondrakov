<?php

//Закрываем доступ к странице для не админа
if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Редактировать - Об авторе";

$about = R::load('about', 1);

if (isset($_POST['textUpdate'])) {
	
	if (trim($_POST['name']) == '') {
		$errors[] = ['title' => 'Введите имя и фамилию'];
	}

	if (trim($_POST['description']) == '') {
		$errors[] = ['title' => 'Введите описание'];
	}

	if (empty($errors)) {

		$about->name = htmlentities($_POST['name']);
		//Не очищаем от html сущностей, т.к. там будет редактор
		$about->description = $_POST['description'];

		//Проверяем имя файла и временное местонахождение файла
		if(isset($_FILES['photo']['name']) && $_FILES['photo']['tmp_name'] != "") {

			//Записываем параметры картинки в переменные
			$fileName = $_FILES['photo']['name'];
			$fileTempLoc = $_FILES['photo']['tmp_name'];
			$fileType = $_FILES['photo']['type'];
			$fileSize = $_FILES['photo']['size'];
			$fileErrorMsg = $_FILES['photo']['error'];
			$kaboom = explode(".", $fileName);
			$fileExt = end($kaboom);

			//Проверяем файл на разные свойства
			list($width, $height) = getimagesize($fileTempLoc);

			if ($width < 10 || $height < 10) {
				$errors[] = ['title' => 'Изображение не имеет размеров. Загрузите изображение побольше.'];		
			}

			if ($fileSize > 2097152) {
				$errors[] = ['title' => 'Размер изображения не должен быть более 2 Мб'];
			}

			if (preg_match("/\.(jpg|jpeg|png)$/i", $fileName)) {
				$errors[] = ['title' => 'Неверный формат файла', 'desc' => '<p>Файл изображения должен быть в формате jpg, jpeg или png.</p>'];
			}

			if ($fileErrorMsg == 1) {
				$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку'];
			}

			//Перемещаем загруженный файл в нужную дерикторию

			//Создаем индивидуальное имя для файла
			$db_file_name = rand(10000000000000, 99999999999999) . "." . $fileExt;
			//Где будем хранить картинки постов из блога
			$aboutImgFolderLocation = ROOT . 'usercontent/about/';
			//Переменная, содержащая индивидуальное имя файла и местонахождение файла для дальнейшей загрузки
			$uploadfile = $aboutImgFolderLocation . $db_file_name;
			//Перемещаем файл
			$moveResult = move_uploaded_file($fileTempLoc, $uploadfile);

			if ($moveResult != true) {
				$errors[] = ['title' => 'Ошибка сохранения файла'];
			}

			//Подключаем библиотеку
			include_once ROOT . 'libs/image_resize_imagick.php';
			//Записываем путь к измененному файлу
			$target_file = $aboutImgFolderLocation . $db_file_name;
			$wmax = 222;
			$hmax = 222;
			//Создаем миниатюру. Возвращается объект.
			$img = createThumbnail($target_file, $wmax, $hmax);
			//Записываем измененную картинку из буфера
			$img->writeImage($target_file);

			//Записываем в БД большую картинку поста
			$about->photo = $db_file_name;
		}



		R::store($about);
		header('Location: ' . HOST . 'about');
		exit();
	}

}

//Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/about/edit-text.tpl";
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>