<?php

require 'config.php';
require 'db.php';

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