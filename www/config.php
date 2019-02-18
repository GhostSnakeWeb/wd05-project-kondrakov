<?php 

//Data base settings
define('DB_HOST', 'localhost');
define('DB_NAME', 'wd05-project-kondrakov');
define('DB_USER', 'root');
define('DB_PASS', '');

//Настройки для email
define('SITE_NAME', 'Личный сайт Владислава Кондракова');
define('SITE_EMAIL', 'info@mysite.ru');
define('ADMIN_EMAIL', 'vladan982004@gmail.com');
define('YANDEX_WALLET', '410016061819649');

//Устанавливаем путь до корневой директории скрипта по протоколу HTTP
//define('HOST', "http://$_SERVER['HTTP_HOST']/");
//$_SERVER['REQUEST_SCHEME'] - вернет тип протокола (http или https). Ненадежный, т.к. в Apache 2.4 его нет
//А если мы работаем с ссылками, которые формируются в браузере, мы используем HOST
define('HOST', 'http://'. $_SERVER['HTTP_HOST'] .'/');

//Устанавливаем физический путь до корневой директории скрипта. Когда инклюдим php, используем ROOT, т.к. это происходит на стороне сервера
define('ROOT', dirname(__FILE__).'/');


?>