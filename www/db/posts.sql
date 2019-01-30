-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 30 2019 г., 11:32
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
  `post_img_small` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`, `author_id`, `date_time`, `post_img`, `post_img_small`) VALUES
(12, 'Математики из Армении создали сервис, который убирает посторонние звуки во время звонков', 'С помощью нейросетей Krisp определяет раздражающие шумы (вроде плача ребёнка или шуршания бумаги) и в реальном времени вырезает их из аудиопотока.', 1, '2019-01-29 20:05:20', NULL, NULL),
(13, '&laquo;Ведомости&raquo;: &laquo;Яндекс&raquo; продал около 400 своих смартфонов через розничные сети в декабре 2018 года', 'С учётом собственного магазина компании и маркетплейса «Беру» продажи были выше, но не превысили 1000 штук, полагает аналитик.', 2, '2019-01-30 11:23:08', '947542024.jpg', '320-947542024.jpg'),
(14, 'Самый влиятельный человек в Кремниевой долине', 'Конспект материала Fast Company о том, куда и почему инвестирует глава японской фирмы SoftBank Масаёси Сон.', 2, '2019-01-30 11:23:37', '1235258329.jpg', '320-1235258329.jpg'),
(15, 'Глеб Кудрявцев, Skyeng: как развивать продукт в $100 млн, работать удаленно и научиться важным для продакта навыкам ', 'Разговор Алексея Иванова, продакт-дизайнера и ведущего канала PonchikNews, с Глебом Кудрявцевым, руководителем продакт-менеджмента детского направления онлайн-школы Skyeng. Это первое интервью- #пончик в серии бесед с топовыми специалистами в своих областях о продуктовом подходе, психологии и изменении поведения.', 2, '2019-01-30 11:24:17', '1181922300.png', '320-1181922300.png'),
(16, '8 ситуаций, способных убить мотивацию разработчиков ', 'Материал подготовлен командой рекрутингового агентства в сфере IT и digital iD:HR. ', 2, '2019-01-30 11:24:57', '630666997.jpg', '320-630666997.jpg'),
(17, 'Burger King ставит отметки &laquo;Мне нравится&raquo; твитам десятилетней давности для рекламы популярного в 2010 году блюда ', 'В январе 2019 года аккаунт сети Burger King начал ставить в Twitter отметки «Мне нравится» публикациям 2009–2010 года. В них пользователи писали о том, что они любят: музыку и сериалы.\r\n\r\nКогда они заметили необычное поведение аккаунта сети, то стали спрашивать у других пользователей, в чём дело.', 2, '2019-01-30 11:25:35', '1208288891.jpg', '320-1208288891.jpg'),
(18, 'Google представила новый дизайн мобильных приложений Gmail ', 'Google представила новый дизайн почтового приложения Gmail. В 2018 году компания обновила его веб-версию, а также показала новый Google Drive, «Календарь» и другие сервисы.', 2, '2019-01-30 11:31:06', '657795079.png', '320-657795079.png'),
(19, 'Американская сеть магазинов видеоигр Gamestop не нашла покупателя &mdash; акции компании упали почти на 28%', 'Компания решила и вовсе отказаться от продажи.', 2, '2019-01-30 11:31:41', '715414489.jpg', '320-715414489.jpg');

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
