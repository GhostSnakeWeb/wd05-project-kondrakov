<?php 

$recoveryCode = false;
$newPasswordReady = false;

//Проверяем, если email в GET непустой
if (!empty($_GET['email'])) {
	
	//Выбор в БД пользователя с указаным email
	$user = R::findOne('users', 'email = ?', array($_GET['email']));

	//Если пользователь найден
	if ($user) {
		$user->recovery_code_times--; //recovery_code_times = 2
		R::store($user);

		//Проверяем количество попыток
		if ($user->recovery_code_times < 1) {
			echo "Попытки восстановить страницу закончились";
			echo "<br><br>";
			echo "<a href='" . HOST . "'>Вернуться на главную</a>";
			die();
		}

		//Проверка верности кода
		if ($user->recovery_code == $_GET['code']) {
			$recoveryCode = true;
		} else {
			$recoveryCode = false;
		}
	} else {
		echo "Пользователь с таким Email не найден";
		die();
	}
} else if (isset($_POST['set-new-password'])){
	//Если форма установки пароля для пользователя отправлена

	//Ищем пользователя по Email
	$user = R::findOne('users', 'email = ?', array($_POST['resetemail']));
	$user->recovery_code_times--; //recovery_code_times = 1
	R::store($user);

	$user = R::findOne('users', 'email = ?', array($_POST['resetemail']));
	if ($user) {
		if ($user->recovery_code_times < 1) {
			die();
		}

		//Проверяем onetimecode
		if ($user->recovery_code == $_POST['onetimecode']) {
			//Если все верно - ставим новый пароль, хэшируя и убиваем код
			$user->password = password_hash($_POST['resetpassword'], PASSWORD_DEFAULT);

			//в любом случае убиваем код
			//Сбрасываем счетчик попыток, чтобы ссылка была недействительна
			$user->recovery_code_times = 0;
			R::store($user);
			$success[] = ['title' => "Пароль обновлен"];
			$newPasswordReady = true;
		}
	}
} else {
	header("Location: " . HOST . "lost-password");
	die();
}

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/login/form-set-new-password.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/login/login-page.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>