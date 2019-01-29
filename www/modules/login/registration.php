<?php 

$title = "Регистрация";
$lostPasLink = HOST . "lost-password";

//Если форма отправлена, то делаем регистрацию
//Если есть массив POST с элементом register
if (isset($_POST['register'])) {

	//Если из поля email приходит пустая строка
	if (trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email', 'desc' => '<p>Email обязателен для регистрации!</p>'];		
	}

	if (trim($_POST['password']) == '') {
		$errors[] = ['title' => 'Введите Пароль'];		
	}

	//Проверка, что пользователь уже существует
	//count - смотрит есть ли в БД записи, которые удовлетворяют определенному условию и если есть, то возвращает их количество
	if (R::count('users', 'email = ?', array($_POST['email'])) > 0) {
		$errors[] = [ 'title' => 'Пользователь с таким email уже существует',
			'desc' => "<p>Используйте другой email или воспользуйтесь<a href='" . $lostPasLink . "'> восстановлением пароля</a>.</p>"];
	}


	//Если нет ошибок, то делаем регистрацию
	if (empty($errors)) {
		$user = R::dispense('users');
		$user->email = htmlentities($_POST['email']);
		$user->role = 'user';
		//Шифруем пароль
		$user->password = password_hash($_POST['password'], PASSWORD_DEFAULT);
		R::store($user);

		$_SESSION['logged_user'] = $user;
		$_SESSION['login'] = "1";
		$_SESSION['role'] = $user->role;
		header('Location: ' . HOST . 'profile-edit');
		exit();
	}
}



//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/login/form-registration.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/login/login-page.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>