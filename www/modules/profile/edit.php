<?php 

$title = "Редактировать профиль";

//Данные текущего пользователя
$currentUser = $_SESSION['logged_user'];

//Загружаем бин с определенными данными (в данном случае id) для изменения
$user = R::load('users', $currentUser->id);

if (isset($_POST['profile-update'])) {

	if (trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email'];
	}

	if (trim($_POST['name']) == '') {
		$errors[] = ['title' => 'Введите Имя'];		
	}

	if (trim($_POST['surname']) == '') {
		$errors[] = ['title' => 'Введите Фамилию'];		
	}

	if (empty($errors)) {

		//Очищаем от лишних и нежелательных html тегов
		$user->name = htmlentities($_POST['name']);
		$user->email = htmlentities($_POST['email']);
		$user->surname = htmlentities($_POST['surname']);
		$user->city = htmlentities($_POST['city']);
		$user->country = htmlentities($_POST['country']);

		//РАБОТА С АВАТАРКОЙ

		//Проверяем есть ли в глобальном массиве FILES элемент avatar и есть ли имя у него. tmp_name - временное имя, которое содержит путь хранения временного файла, который пока не помещен на сайт, но хранится где-то на сервере
		if (isset($_FILES['avatar']['name']) && $_FILES['avatar']['tmp_name'] != "") {
			
			//Записываем все параметры картинки в переменные

			//Имя файла
			$fileName = $_FILES['avatar']['name'];
			//Временное нахождение файла (где расположен)
			$fileTmpLoc = $_FILES['avatar']['tmp_name'];
			//Тип файла (jpg, png)
			$fileType = $_FILES['avatar']['type'];
			//Размеры файла
			$fileSize = $_FILES['avatar']['size'];
			//Сообщение об ошибке, если оно есть
			$fileErrorMsg = $_FILES['avatar']['error'];
			//Разбиваем имя файла по имени и формату (типу). В итоге получаем массив.
			$kaboom = explode(".", $fileName);
			//Берем из массива последний элемент
			$fileExt = end($kaboom);

			//Проверяем свойства файла на разные условия

			//list - Присвоить переменным из списка значения подобно массиву. Записываем длину и ширину картинки. getimagesize - создает массив с размерами картинки.
			list($width, $height) = getimagesize($fileTmpLoc);
			//Проверяем есть ли размеры у картинки
			if ($width < 10 || $height < 10) {
				$errors[] = ['title' => 'Изображение не имеет размеров. Загрузите изображение побольше.'];		
			}

			//Проверяем, чтобы картинка не была больше 4 Мб. Ограничение также может быть на сервере.
			if ($fileSize > 4194304) {
				$errors[] = ['title' => 'Размер изображения не должен быть более 4 Мб'];
			}

			//Проверяем через регулярку, если имя файла не соответсвует формату картинки
			if (preg_match("/\.(gif|jpg|jpeg|png)$/i", $fileName)) {
				$errors[] = ['title' => 'Неверный формат файла', 'desc' => '<p>Файл изображения должен быть в формате gif, jpg, jpeg или png.</p>'];
			}

			//Если в массиве FILES есть неизвестная ошибка.
			if ($fileErrorMsg == 1) {
				$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку'];
			}

			//ГОТОВИМСЯ К ЗАПИСИ

			//Проверяем установлен ли уже у пользователя аватар
			$avatar = $user->avatar;
			//Записываем путь где у нас записана аватарка пользователя
			$avatarFolderLocation = ROOT . 'usercontent/avatar/';

			//Если аватар загружен был ранее, т.е. установлен уже, то будем его удалять, чтобы далее заменить.
			if ($avatar != '') {
				//Записываем текущее нахождение аватара и его имя
				$picurl = $avatarFolderLocation . $avatar; //usercontent/avatar/photo.png
				//Удаляем большую аватарку, если существует такой файла
				if (file_exists($picurl)) {
					unlink($picurl);
				}
				$picurl48 = $avatarFolderLocation . "48-" . $avatar;
				//Удаляем маленькую аватарку, если существует такой файла
				if (file_exists($picurl48)) {
					unlink($picurl48);
				}
			}

			//Перемещаем загруженный файл в нужную дерикторию

			//Создаем индивидуальное имя для файла
			$db_file_name = rand(10000000000000, 99999999999999) . "." . $fileExt;
			//Переменная, содержащая индивидуальное имя файла и местонахождение файла для дальнейшей загрузки
			$uploadfile = $avatarFolderLocation . $db_file_name;
			//Перемещаем файл
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			if ($moveResult != true) {
				$errors[] = ['title' => 'Ошибка сохранения файла'];
			}

			//Подключаем библиотеку
			include_once ROOT . 'libs/image_resize_imagick.php';

			//Записываем путь к измененному файлу
			$target_file = $avatarFolderLocation . $db_file_name;
			//Задаем максимальные ширину и высоту аватарки
			$wmax = 222;
			$hmax = 222;
			//Создаем миниатюру. Возвращается объект.
			$img = createThumbnail($target_file, $wmax, $hmax);
			//Записываем измененную картинку из буфера
			$img->writeImage($target_file);

			//Записываем в БД аватарку пользователя большую картинку
			$user->avatar = $db_file_name;

			//СОЗДАЕМ МАЛЕНЬКУЮ АВАТАРКУ
			//Берем большой файл
			$target_file = $avatarFolderLocation . $db_file_name;
			$resized_file = $avatarFolderLocation . "48-" . $db_file_name;
			//Размеры для маленькой аватрки
			$wmax = 48;
			$hmax = 48;
			//Берем большую картинку, уменьшаем
			$img = createThumbnail($target_file, $wmax, $hmax);
			$img->writeImage($resized_file);

			//Записываем в БД аватарку пользователя маленькую картинку
			$user->avatarSmall = "48-" . $db_file_name;
		}

		R::store($user);
		//Записываем в сессию новые данные пользователя
		$_SESSION['logged_user'] = $user;
		header('Location: ' . HOST . "profile");
		exit();
	}
}

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/profile/profile-edit.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>