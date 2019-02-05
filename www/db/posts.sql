-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 05 2019 г., 20:43
-- Версия сервера: 5.5.61
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wd05-project-kondrakov`
--

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `author_id` int(11) UNSIGNED DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `post_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_img_small` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat` int(11) UNSIGNED DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`, `author_id`, `date_time`, `post_img`, `post_img_small`, `cat`, `update_time`) VALUES
(12, 'Математики из Армении создали сервис, который убирает посторонние звуки во время звонков', 'С помощью нейросетей Krisp определяет раздражающие шумы (вроде плача ребёнка или шуршания бумаги) и в реальном времени вырезает их из аудиопотока.', 1, '2019-01-29 20:05:20', NULL, NULL, 1, NULL),
(13, '&laquo;Ведомости&raquo;: &laquo;Яндекс&raquo; продал около 400 своих смартфонов через розничные сети в декабре 2018 года', 'С учётом собственного магазина компании и маркетплейса «Беру» продажи были выше, но не превысили 1000 штук, полагает аналитик.', 2, '2019-01-30 11:23:08', '947542024.jpg', '320-947542024.jpg', 3, NULL),
(14, 'Самый влиятельный человек в Кремниевой долине', 'Конспект материала Fast Company о том, куда и почему инвестирует глава японской фирмы SoftBank Масаёси Сон.', 2, '2019-01-30 11:23:37', '1235258329.jpg', '320-1235258329.jpg', 4, NULL),
(15, 'Глеб Кудрявцев, Skyeng: как развивать продукт в $100 млн, работать удаленно и научиться важным для продакта навыкам ', 'Разговор Алексея Иванова, продакт-дизайнера и ведущего канала PonchikNews, с Глебом Кудрявцевым, руководителем продакт-менеджмента детского направления онлайн-школы Skyeng. Это первое интервью- #пончик в серии бесед с топовыми специалистами в своих областях о продуктовом подходе, психологии и изменении поведения.', 2, '2019-01-30 11:24:17', '1181922300.png', '320-1181922300.png', 3, NULL),
(16, '8 ситуаций, способных убить мотивацию разработчиков ', 'Материал подготовлен командой рекрутингового агентства в сфере IT и digital iD:HR. ', 2, '2019-01-30 11:24:57', '630666997.jpg', '320-630666997.jpg', 4, NULL),
(18, 'Google представила новый дизайн мобильных приложений Gmail ', 'Google представила новый дизайн почтового приложения Gmail. В 2018 году компания обновила его веб-версию, а также показала новый Google Drive, «Календарь» и другие сервисы.', 2, '2019-01-30 11:31:06', '657795079.png', '320-657795079.png', 1, NULL),
(19, 'Американская сеть магазинов видеоигр Gamestop не нашла покупателя &mdash; акции компании упали почти на 28%', '<p><span style=\"font-size:16px\"><span style=\"font-family:Open Sans\">Компания решила и вовсе отказаться от продажи. Сеть магазинов видеоигр Gamestop отказалась от продажи бизнеса. На фоне этих новостей акции компании упали на 28%, а её оценка снизилась более чем на $440 млн, до $1,14 млрд.</span></span></p>\r\n', 1, '2019-01-30 11:31:41', '749935369.jpg', '320-749935369.jpg', 5, '2019-02-05 20:31:48'),
(20, 'Электронная коммерция с WordPress, как создать интернет-магазин?', '<h2><span style=\"font-family:Open Sans\"><strong>Подробности</strong></span></h2>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Open Sans\">======================================== </span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Open Sans\">Проверьте, что при регистрации на мероприятие вы указали реальные Имя и Фамилию. Если нет, пришлите письмо с ФИО. Для получения пропуска для входа в БЦ понадобится ПАСПОРТ. Если вы указали, что придете с гостем, пришлите ФИО гостя на почту. Регистрация открыта до 16:00, после этого финальный список будет передан в БЦ и попасть на мероприятие будет нельзя. </span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Open Sans\">======================================== </span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Open Sans\">Первый тематический митап про WooCommerce и не только. Обсуждаем особенности создания интернет-магазинов на WordPress, плагины, темы, оптимизацию работы сайта. Приглашаем всех, кто интересуется электронной коммерцией, имеет опыт или планирует открыть свой интернет-магазин. </span></span></p>\r\n\r\n<h2><span style=\"font-family:Open Sans\"><strong>РАСПИСАНИЕ</strong> </span></h2>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Open Sans\">Регистрация и открытие 😁 🎉 </span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Open Sans\">18:30 &laquo;Быстрый старт интернет-магазина без геморроя&raquo; Анатолий Юмашев </span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Open Sans\">19:10 &laquo;Обслуживание магазина на WooCommerce&raquo; Александр Урожаев Пицца 🍕🍕🍕 </span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Open Sans\">20:00 &laquo;Темные и светлые стороны интернет магазинов&raquo; Алексей Кульпин </span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Open Sans\">20:40 &laquo;Интеграция платежной системы одной кнопкой&raquo; Николай Миронов </span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Open Sans\">21:00 &laquo;Где тебя носит, солнце моё... Геолокация и WordPress&raquo; Катя Леурдо Закрытие 😢 👋🏼 </span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Open Sans\">Как обычно вас будут ждать бесплатные чай, кофе, печеньки во время кофе-брейков. На большой перерыв запланирована пицца. Вход свободный по предварительной регистрации. Проход по спискам, получение пропуска на 1м этаже по паспорту. Вокруг БЦ есть бесплатные городские парковки, также можно найти места во дворах/на свободных островках.</span></span></p>\r\n', 1, '2019-02-04 17:03:40', '1157364247.jpeg', '320-1157364247.jpeg', 1, '2019-02-05 18:57:25'),
(21, 'Центробанк обновит логотип и фирменный стиль', '<h2><strong>Их разработало агентство :Otvetdesign. </strong></h2>\r\n\r\n<p>Агентство:<strong>Otvetdesign</strong> показало на своём сайте новый логотип и фирменный стиль для Центробанка. В ЦБ vc.ru сообщили, что уже утвердили <u>новый</u> <em>фирменный</em> стиль и начали его внедрение.</p>\r\n\r\n<p>&laquo;Кардинальных изменений не происходит &ndash; в новом стиле сохранилась преемственность с предыдущим, при этом он стал более современным и удобным для использования&raquo;, &mdash; говорят в регуляторе.</p>\r\n', 1, '2019-02-05 16:53:56', '474783649.png', '320-474783649.png', 6, '2019-02-05 17:00:59');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_posts_author` (`author_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
