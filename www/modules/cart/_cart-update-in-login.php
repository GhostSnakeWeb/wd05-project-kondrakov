<?php 

// Если до логина накидали товар в корзину, то при логине данные должны сохранятся в БД и локально. Грубо говоря соединение корзин локальной и из БД. И запись всего этого в БД

// Загружаем пользователя, если придется обновить корзину в БД
$currentUser = $_SESSION['logged_user'];
// Загружаем пользователя из БД
$user = R::load('users', $currentUser->id);


//Определяем корзину в БД
$cartServer = json_decode($user->cart, true);

//Определяем локальную корзину
if (isset($_COOKIE['cart'])) {
	//json_decode - функция преобразует json формат в объект, true - переводит в ассоциативный массив
	$cartLocal = json_decode($_COOKIE['cart'], true);
} else {
	//Если не было до этого локальной корзины (массив), то создаем ее
	$cartLocal = array();
}

// Если есть товары и в локальной корзине и на сервере
if (count($cartServer) > 0 && count($cartLocal) > 0) {

	//Совмещаем обе корзины и сохраняем в БД и в Cookies. Принимает 2 массива (корзины). 
	function uniteCarts($cartServer, $cartLocal) {
		// Новая объединенная корзина
		$cartNew = array();

		// Создаем и обновляем корзину на основе корзины с Сервера
		foreach ($cartServer as $key => $value) {
			// Есть ли в локальной корзине такой товар
			if (array_key_exists($key, $cartLocal)) {

				// Если на сервере данного товара меньше, чем локально
				if ($cartServer[$key] < $cartLocal[$key]) {
					// В новый массив записываем товар в локальной корзине
					$cartNew[$key] = $cartLocal[$key];
				} else {
					// В новый массив записываем товар с серверной корзины
					$cartNew[$key] = $cartServer[$key];
				}
			}
		}

		// Дополняем корзину отсутствующими элементами с локальной корзины
		foreach ($cartLocal as $key => $value) {
			// Если локально есть товар, которого нет в новой корзине (не было на сервере)
			if (!(array_key_exists($key, $cartNew))) {

				// В новый массив записываем товар в локальной корзине
				$cartNew[$key] = $cartLocal[$key];
			}
		}

		// Сортируем товары в корзине по ID
		ksort($cartNew);
		// Преобразуем новую корзину в строку
		$cartNew = json_encode($cartNew);

		return $cartNew;
	}

	$cartNew = uniteCarts($cartServer, $cartLocal); //JSON строка
	$user->cart = $cartNew;
	R::store($user);
	// Записываем в куки новую корзину
	setcookie('cart', $cartNew);
} elseif (count($cartServer) <= 0 && count($cartLocal) > 0) {

	// На сервере нет товаров, локально есть

	// Берем корзину из cookie и сохраняем в БД
	$user->cart = json_encode($cartLocal);
} elseif (count($cartServer) > 0 && count($cartLocal) <= 0) {
	// Записываем локально то, что было на сервере
	setcookie('cart', json_encode($cartServer));
}

?>