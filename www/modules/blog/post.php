<?php

//SQL запрос. 
//Выбираем все что связано с постом, именем и фамилией пользователя, названием категории
$sqlPost = '
		SELECT 
			posts.id, posts.title, posts.text, posts.post_img, posts.date_time, posts.author_id, posts.cat, posts.update_time,
	    	users.name, users.surname,
	    	categories.cat_title
    	FROM `posts`
    	LEFT JOIN categories ON posts.cat = categories.id
    	LEFT JOIN users ON posts.author_id = users.id
    	WHERE posts.id = ' . $_GET['id'] . ' LIMIT 1';

//getAll - создает массив с удовлетворяющими запросу записями из БД
$post = R::getAll($sqlPost);

//Чтобы работать с внутренним массивом, выбираем сразу запись под индексом 0 (она там и так одна)
$post = $post[0];

$title = $post['title'];

//Запрос на получение комментов. JOIN'им таблицу юзеров
$sqlComments = 'SELECT
			comments.text, comments.date_time, comments.user_id,
			users.name, users.surname, users.avatar_small
		FROM `comments` 
		INNER JOIN users ON comments.user_id = users.id
		WHERE comments.post_id = ' . $_GET['id'];
$comments = R::getAll($sqlComments);

// получаем данные колонки id из таблицы posts
$postId = R::getCol('SELECT id FROM posts');

foreach ($postId as $index => $id) {
	// Если id в массиве совпадает с id поста
	if ($id == $post['id']) {
		@$nextId = $postId[$index + 1];
		@$prevId = $postId[$index - 1];
		break;
	}
}

//Если пришел массив POST с addComment
if (isset($_POST['addComment'])) {
	if (trim($_POST['commentText']) == '') {
		$errors[] = ['title' => 'Введите текст комментария'];
	}

	if (empty($errors)) {
		$comment = R::dispense('comments');
		// Записываем id поста, к которому был сделан коммент
		$comment->postId = htmlentities($_GET['id']);
		// Записываем id пользователя, написавшего коммент
		$comment->userId = htmlentities($_SESSION['logged_user']['id']);
		// Текст из textarea записываем в БД
		$comment->text = htmlentities($_POST['commentText']);
		// Записываем время коммента
		$comment->dateTime = R::isoDateTime();
		R::store($comment);
		//Повторно запускаем получение всех комментов. Таким оразом избегаем перенаправления
		$comments = R::getAll($sqlComments);
	}
}

//Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/blog/blog-post.tpl";
$content = ob_get_contents();
ob_end_clean();

//Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>