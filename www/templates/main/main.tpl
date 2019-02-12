<<<<<<< HEAD
<div class="brief-resume">
	<div class="sticky-footer-content">
		<div class="container user-content pt-80">
			<div class="row">
				<div class="col-md-3">
					<div class="avatar avatar--big"><img src="../img/avatars/avatar-1-big.jpg" /></div>
				</div>
				<div class="col-md-9">
					<h1 class="title-1">Емельян Казаков</h1>
					<p>Я веб разработчик из Казани. Мне 28 лет.<br />Занимаюсь разработкой современных сайтов и приложений. Мне нравится делать интересные и современные проекты.</p>
					<p>Этот сайт я сделал в рамках обучения в школе онлайн обучения WebCademy. <br />Чуть позже я освежу в нём свой контент. А пока посмотрите, как тут всё классно и красиво!</p>
					<h3 class="title-3">Что я умею</h3>
					<p>Меня привлекет Frontend разработка, это не только моя работа, но и хобби. <br />Также знаком и могу решать не сложные задачи на Backend.</p>
					<p>Знаком и использую современный workflow, работаю с репозиториями git и сборкой проекта на gulp.</p>
					<div class="brief-resume__button"><a class="button" href="#!">Подробнее</a></div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="hr-line"></div>
<div class="sticky-footer-content">
	<div class="container user-content pt-90 mb-80">
		<div class="works__header mb-25 title-1"> <span> <strong>Новые <a href="#!" target="_blank">работы</a></strong></span></div>
		<div class="row justify-content-between mb-50">
			<div class="card-portfolio">
				<div class="card-portfolio__image mb-15"><img src="../img/thumbs/portfolio-thumb.png" alt="Верстка Landing Page" /></div>
				<div class="card-portfolio__title ml-20">Верстка Landing Page</div><a class="button" href="#!">Смотреть кейс</a>
			</div>
			<div class="card-portfolio">
				<div class="card-portfolio__image mb-15"><img src="../img/thumbs/portfolio-thumb1.png" alt="Верстка UI набора" /></div>
				<div class="card-portfolio__title ml-20">Верстка UI набора</div><a class="button" href="#!">Смотреть кейс</a>
			</div>
			<div class="card-portfolio">
				<div class="card-portfolio__image mb-15"><img src="../img/thumbs/portfolio-thumb2.png" alt="Верстка интернет магазина" /></div>
				<div class="card-portfolio__title ml-20">Верстка интернет магазина</div><a class="button" href="#!">Смотреть кейс</a>
			</div>
		</div>
	</div>
</div>
<div class="sticky-footer-content">
	<div class="container user-content mb-100">
		<div class="works__header mb-40 title-1"><span> <strong>Новые записи в <a href="#!" target="_blank">блоге</a></strong></span></div>
		<div class="row justify-content-between">
			<div class="card-post">
				<div class="card-post__image mb-15"><img src="../img/thumbs/post-thumb3.png" alt="Поездка в New York" /></div>
				<div class="card-post__title">Поездка в New York</div><a class="button" href="#!">Читать</a>
			</div>
			<div class="card-post">
				<div class="card-post__image mb-15"><img src="../img/thumbs/post-thumb1.png" alt="Что я делал в долине" /></div>
				<div class="card-post__title">Что я делал в долине</div><a class="button" href="#!">Читать</a>
			</div>
			<div class="card-post">
				<div class="card-post__image mb-15"><img src="../img/thumbs/post-thumb2.png" alt="Как я ходил в поход этим летом" /></div>
				<div class="card-post__title">Как я ходил в поход этим летом</div><a class="button" href="#!">Читать</a>
			</div>
=======
<?php require_once ROOT . "templates/about/_about-text.tpl"; ?>
<div class="hr-line"></div>
<div class="sticky-footer-content pt-80 pb-55">
	<div class="container user-content mb-100">
		<div class="works__header mb-40 title-1"><span> <strong>Новые записи в <a href="<?=HOST?>blog" target="_blank">блоге</a></strong></span></div>
		<div class="row">
			<?php foreach ($posts as $post) { 
				include ROOT . 'templates/_parts/_blog-card.tpl';
			} ?>
>>>>>>> Main page is ready and fix some links and bugs
		</div>
	</div>
</div>