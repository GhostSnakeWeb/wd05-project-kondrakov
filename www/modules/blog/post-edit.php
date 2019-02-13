<?php 

//Закрываем доступ к странице для не админа
if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Редактировать пост";

$post = R::load('posts', $_GET['id']);

$cats = R::find('categories', 'ORDER BY cat_title ASC');

if (isset($_POST['postUpdate'])) {
	
	if (trim($_POST['postTitle']) == '') {
		$errors[] = ['title' => 'Введите название поста'];
	}

	if (trim($_POST['postText']) == '') {
		$errors[] = ['title' => 'Введите текст поста'];
	}

	if (empty($errors)) {
		$post->title = htmlentities($_POST['postTitle']);
		$post->cat = htmlentities($_POST['postCat']);
		$post->text = $_POST['postText'];
		$post->authorId = $_SESSION['logged_user']['id'];
		//isoDateTime() - возвращает дату и время и записывает в БД
		$post->updateTime = R::isoDateTime();

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

			//Если картинка поста загружена была ранее, т.е. установлена уже, то будем её удалять, чтобы далее заменить.
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
		header('Location: ' . HOST . "blog?result=postUpdated");
		exit();
	}

}

//Удаление картинки в Редактировании поста
if (isset($_POST['picDelete'])) {

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
	}

	$post->post_img = null;
	$post->post_img_small = null;

	R::store($post);

	header("Location: " . HOST . "blog/post-edit?id=" . $_GET['id'] . "&result=picDeleted");
	exit();
}

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/blog/post-edit.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>