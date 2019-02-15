<?php 

// Записываем ID поста полученные из ajax
$currentPostId = intval($_POST['id']);

// Находим пост по ID
$post = R::load('posts', $_POST['id']);

echo json_encode($post);

?>