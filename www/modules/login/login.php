<?php 

$title = "Вход на сайт";
$lostPasLink = HOST . "lost-password";

if (isset($_POST['login'])) {

	//Если из поля email приходит пустая строка
	if (trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email'];
	}

	if (trim($_POST['password']) == '') {
		$errors[] = ['title' => 'Введите Пароль'];		
	}

	//Если нет ошибок, то входим
	if (empty($errors)) {
		//Находим пользователя в таблице БД
		$user = R::findOne('users', 'email = ?', array($_POST['email']));

		if ($user) {
			//Сравниваем пароль пользователя и пароль из БД
			if (password_verify($_POST['password'], $user->password)) {
				$_SESSION['logged_user'] = $user;
				$_SESSION['login'] = "1";
				$_SESSION['role'] = $user->role;

				// Сравнение и обновление корзинывынесено в отдельный файл. 
				require ROOT . 'modules/cart/_cart-update-in-login.php';

				header('Location: ' . HOST);
				exit();
			} else {
				$errors[] = [
					'title' => "Неверный email или пароль",
					'desc' => "<p>Введите верные данные для входа или воспользуйтесь<a href='" . $lostPasLink . "'> восстановлением пароля</a>, чтобы войти на сайт.</p>"
				];
			}
		} else {
			$errors[] = [
				'title' => "Неверный email или пароль",
				'desc' => "<p>Введите верные данные для входа, зарегистрируйтесь или воспользуйтесь<a href='" . $lostPasLink . "'> восстановлением пароля</a>, чтобы войти на сайт.</p>"
			];
		}
	} 
}

//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/login/form-login.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/login/login-page.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>