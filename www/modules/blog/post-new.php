<?php 

$title = "Блог - Добавить новый пост";

if (isset($_POST['postNew'])) {
	
	if (trim($_POST['postTitle']) == '') {
		$errors[] = ['title' => 'Введите название поста'];
	}

	if (trim($_POST['postText']) == '') {
		$errors[] = ['title' => 'Введите текст поста'];
	}

	if (empty($errors)) {
		//В таблице posts создаем новую запись
		$post = R::dispense('posts');
		$post->title = htmlentities($_POST['postTitle']);
		$post->text = $_POST['postText'];
		$post->authorId = $_SESSION['logged_user']['id'];
		//isoDateTime() - возвращает дату и время и записывает в БД
		$post->dateTime = R::isoDateTime();

		//ЗАГРУЖАЕМ КАРТИНКИ

		//Проверяем имя файла и временное местонахождение файла
		if(isset($_FILES['postImg']['name']) && $_FILES['postImg']['tmp_name'] != "") {

			//Записываем параметры картинки в переменные
			$fileName = $_FILES['postImg']['name'];
			$fileTempLoc = $_FILES['postImg']['tmp_name'];
			$fileType = $_FILES['postImg']['type'];
			$fileSize = $_FILES['postImg']['size'];
			$fileErrorMsg = $_FILES['postImg']['error'];
			$kaboom = explode(".", $fileName);
			$fileExt = end($kaboom);

			//Проверяем файл на разные свойства
			list($width, $height) = getimagesize($fileTempLoc);

			if ($width < 10 || $height < 10) {
				$errors[] = ['title' => 'Изображение не имеет размеров. Загрузите изображение побольше.'];		
			}

			if ($fileSize > 4194304) {
				$errors[] = ['title' => 'Размер изображения не должен быть более 4 Мб'];
			}

			if (preg_match("/\.(gif|jpg|jpeg|png)$/i", $fileName)) {
				$errors[] = ['title' => 'Неверный формат файла', 'desc' => '<p>Файл изображения должен быть в формате gif, jpg, jpeg или png.</p>'];
			}

			if ($fileErrorMsg == 1) {
				$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку'];
			}

			//Перемещаем загруженный файл в нужную дерикторию

			//Создаем индивидуальное имя для файла
			$db_file_name = rand(10000000000000, 99999999999999) . "." . $fileExt;
			//Где будем хранить картинки постов из блога
			$postImgFolderLocation = ROOT . 'usercontent/blog/';
			//Переменная, содержащая индивидуальное имя файла и местонахождение файла для дальнейшей загрузки
			$uploadfile = $postImgFolderLocation . $db_file_name;
			//Перемещаем файл
			$moveResult = move_uploaded_file($fileTempLoc, $uploadfile);

			if ($moveResult != true) {
				$errors[] = ['title' => 'Ошибка сохранения файла'];
			}

			//Подключаем библиотеку
			include_once ROOT . 'libs/image_resize_imagick.php';
			//Записываем путь к измененному файлу
			$target_file = $postImgFolderLocation . $db_file_name;
			$wmax = 920;
			$hmax = 620;
			//Создаем миниатюру. Возвращается объект.
			$img = createThumbnailBig($target_file, $wmax, $hmax);
			//Записываем измененную картинку из буфера
			$img->writeImage($target_file);

			//Записываем в БД большую картинку поста
			$post->postImg = $db_file_name;

			//Миниатюры
			$target_file = $postImgFolderLocation . $db_file_name;
			$resized_file = $postImgFolderLocation . "320-" . $db_file_name;
			$wmax = 320;
			$hmax = 140;
			//Создаем миниатюру. Возвращается объект. createThumbnailCrop - обрезает четко по указаным размерам, а не оиентируясь на высоту
			$img = createThumbnailCrop($target_file, $wmax, $hmax);
			//Записываем измененную картинку из буфера
			$img->writeImage($resized_file);

			//Записываем в БД большую картинку поста
			$post->postImgSmall = "320-" . $db_file_name;
		}

		R::store($post);
		header('Location: ' . HOST . "blog");
		exit();
	}

}

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/blog/post-new.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>