<?php

//Массивы с ошибками и с успешными действиями
$errors = array();
$success = array();

require 'config.php';
require 'db.php';
require ROOT . 'libs/functions.php';

session_start();

/*------------------------------

РОУТЕР

-------------------------------*/

//$_SERVER['REQUEST_URI'] - передает запрашиваемый адрес пользователя
//Получаем раздел
$uri = $_SERVER['REQUEST_URI']; // /portfolio/

//Обрезаем у строки (раздела) слэш
$uri = rtrim($uri, "/"); // /portfolio
//Защищаемся от опасных запросов в url
//filter_var — Фильтрует переменную с помощью определенного фильтра. 
//FILTER_SANITIZE_URL - Удаляет все символы, кроме букв, цифр и $-_.+!*'(),{}|\\^~[]`<>#%";/?:@&=. 
$uri = filter_var($uri, FILTER_SANITIZE_URL);
//Вырезаем первый символ (/)
$uri = substr($uri, 1); // portfolio

//Отделяем get запрос
$uri = explode('?', $uri);

switch ($uri[0]) {
	case '':
		include ROOT . 'modules/main/index.php';
		break;

	// ::::::::::: USERS :::::::::::::::::::::::
	case 'login':
		require ROOT . 'modules/login/login.php';
		break;

	case 'registration':
		include ROOT . 'modules/login/registration.php';
		break;

	case 'logout':
		include ROOT . 'modules/login/logout.php';
		break;

	case 'lost-password':
		include ROOT . 'modules/login/lost-password.php';
		break;

	case 'set-new-password':
		include ROOT . 'modules/login/set-new-password.php';
		break;

	case 'profile':
		include ROOT . 'modules/profile/index.php';
		break;

	case 'profile-edit':
		include ROOT . 'modules/profile/edit.php';
		break;

	case 'about':
		include ROOT . 'modules/about/index.php';
		break;
	case 'contacts':
		include ROOT . 'modules/contacts/index.php';
		break;
	case 'blog':
		include ROOT . 'modules/blog/index.php';
		break;
	default:
		echo "404 and Main page";
		break;
}


?>