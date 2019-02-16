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

	// ::::::::::: ABOUT ::::::::::::::::::::::::::

	case 'about':
		include ROOT . 'modules/about/index.php';
		break;
    
	case 'edit-text':
		include ROOT . 'modules/about/edit-text.php';
		break;

	case 'edit-skills':
		include ROOT . 'modules/about/edit-skills.php';
		break;

	case 'edit-jobs':
		include ROOT . 'modules/about/edit-jobs.php';
		break;

	case 'delete-jobs':
		include ROOT . 'modules/about/delete-jobs.php';
		break;

	case 'contacts':
		include ROOT . 'modules/contacts/index.php';
		break;

	case 'contacts-edit':
		include ROOT . 'modules/contacts/edit.php';
		break;

	case 'messages':
		include ROOT . 'modules/contacts/messages.php';
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

	case 'blog/post-delete':
		include ROOT . 'modules/blog/post-delete.php';
		break;

	case 'blog/post':
		include ROOT . 'modules/blog/post.php';
		break;

	// ::::::::::: ESHOP :::::::::::::::::::::::

	case 'shop':
		include ROOT . 'modules/shop/index.php';
		break;

	case 'shop/new':
		include ROOT . 'modules/shop/item-new.php';
		break;

	case 'shop/item':
		include ROOT . 'modules/shop/item.php';
		break;

	case 'shop/item-edit':
		include ROOT . 'modules/shop/item-edit.php';
		break;

	case 'shop/item-delete':
		include ROOT . 'modules/shop/item-delete.php';
		break;

	// ::::::::::: CART :::::::::::::::::::::::

	case 'addtocart':
		include ROOT . 'modules/cart/addtocart.php';
		break;

	case 'cart':
		include ROOT . 'modules/cart/cart.php';
		break;

	case 'removefromcart':
		include ROOT . 'modules/cart/removefromcart.php';
		break;

	// ::::::::::: ORDERS :::::::::::::::::::::::
	case 'order-create':
		include ROOT . 'modules/orders/order-create.php';
		break;

	default:
		echo "404";
		break;
}


?>