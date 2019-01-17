<?php 

//Data base settings
define('DB_HOST', 'localhost');
define('DB_NAME', 'wd05-project-kondrakov');
define('DB_USER', 'root');
define('DB_PASS', '');

//Устанавливаем путь до корневой директории скрипта по протоколу HTTP
//define('HOST', "http://$_SERVER['HTTP_HOST']/");
//$_SERVER['REQUEST_SCHEME'] - вернет тип протокола (http или https)
define('HOST', $_SERVER['REQUEST_SCHEME'] .'://'. $_SERVER['HTTP_HOST'] .'/');

//Устанавливаем физический путь до корневой директории скрипта
define('ROOT', dirname(__FILE__).'/');


?>