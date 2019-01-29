
<?php 

$title = "Восстановление пароля";

if (isset($_POST['lost-password'])) {

	//Если из поля email приходит пустая строка
	if (trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email'];
	}

	//Если нет ошибок
	if (empty($errors)) {
		//Находим пользователя по email
		$user = R::findOne('users', 'email = ?', array($_POST['email']));

		//Если пользоваетль найден
		if ($user) {

			//Генерация кода и сохранение кода в БД
			function rand_str($num = 30) {
				//Вырезает из строки первый 30 символ. str_shuffle - случайным образом перемешивает символы в строке
				return substr(str_shuffle('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, $num);
			}
			$recovery_code = rand_str(15);
			//Записываем этот код пользователю
			$user->recovery_code = $recovery_code;
			//Количество попыток
			$user->recovery_code_times = 3;
			R::store($user);

			//Высылаем инструкции на почту
			$recovery_message = "<p>Код для сброса пароля: <b>$recovery_code</b></p>";
			$recovery_message .= "<p>Для сброса пароля перейдите по ссылке ниже, и установите новый пароль:</p>";
			$recovery_message .= "<p><a href=" . HOST;
			//Передаем в GET запрос email и код
			$recovery_message .= "set-new-password?email=" . $_POST['email'] . "&code=" . $recovery_code;
			$recovery_message .= '"target="_blank">';
			$recovery_message .= "Установите новый пароль</a></p>";

			$headers = "MIME-Version: 1.0" . PHP_EOL . "Content-Type: text/html; charset = utf-8" .
			PHP_EOL . "From:" . adopt(SITE_NAME) . "<" . SITE_EMAIL . ">" . PHP_EOL . "Reply-To:" . ADMIN_EMAIL;
			//Отправляем
			mail($_POST['email'], 'Восстановление доступа', $recovery_message, $headers);
			//Уведомляем пользователя
			$success[] = [
				'title' => "Восстановление пароля",
				'desc' => "<p>Инструкции по восстановлению доступа высланы на {$_POST['email']}</p>"
			];
		} else {
			$errors[] = [
				'title' => "Ошибка восстановления",
				'desc' => "<p>Пользователь с таким Email не зарегестрирован</p>"
			];
		}
	}
}


//Готовим контент для центральной части
//ob_start() - буферизированный вывод.
ob_start();
include ROOT . "templates/login/form-lost-password.tpl";
//ob_get_contents() - получает контент записанный между функциями ob_start и ob_get_contans из буфера.
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/login/login-page.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>

