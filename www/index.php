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

	// ::::::::::: CATEGORIES :::::::::::::::::

	case 'blog/categories':
		include ROOT . 'modules/categories/all.php';
		break;

	case 'blog/category-new':
		include ROOT . 'modules/categories/new.php';
		break;

	case 'blog/category-edit':
		include ROOT . 'modules/categories/edit.php';
		break;

	case 'blog/category-delete':
		include ROOT . 'modules/categories/delete.php';
		break;

	// ::::::::::: BLOG :::::::::::::::::::::::

	case 'blog':
		include ROOT . 'modules/blog/index.php';
		break;

	case 'blog/post-new':
		include ROOT . 'modules/blog/post-new.php';
		break;

	case 'blog/post-edit':
		include ROOT . 'modules/blog/post-edit.php';
		break;

	case 'blog/post':
		include ROOT . 'modules/blog/post.php';
		break;

	default:
		echo "404 and Main page";
		break;
}


?>