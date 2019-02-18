<?php 

//Убиваем сессию
unset($_SESSION['logged_user']);
unset($_SESSION['login']);
unset($_SESSION['role']);
// Сбрасываем куку на локальную корзину
setcookie('cart', '');
//Убиваем сессию окончательно
session_destroy();
//Сбрасываем куки. Убиваем связь с сессией
setcookie(session_name(), '', time() - 60*60*24*32, '');
header("Location: " . HOST);

?>