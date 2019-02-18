-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 15 2019 г., 10:19
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
-- Структура таблицы `about`
--

CREATE TABLE `about` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `about`
--

INSERT INTO `about` (`id`, `name`, `description`, `photo`) VALUES
(1, 'Кондраков Владислав', '<div class=\"about-me-description__content\">\r\n<p><span style=\"font-family:Open Sans\">Я веб разработчик-любитель из Оренбурга. Мне 20 лет.</span></p>\r\n\r\n<p><span style=\"font-family:Open Sans\">Учусь в университете. Недавно начал учить веб-разработку и мне это нравится. Хочу в дальнейшем заниматься разработкой современных сайтов и приложений.</span></p>\r\n\r\n<p><span style=\"font-family:Open Sans\">Этот сайт я сделал в рамках обучения в школе онлайн обучения WebCademy. Чуть позже я освежу в нём свой контент. А пока посмотрите, как тут всё классно и красиво!</span></p>\r\n</div>\r\n\r\n<h2><strong>Что я умею</strong></h2>\r\n\r\n<div class=\"about-me-description__content\">\r\n<p><span style=\"font-family:Open Sans\">Меня привлекет Frontend и Backend разработка, это мое хобби и, надеюсь, в дальнейшем будущая работа. Также знаком и могу решать не сложные задачи на Backend.</span></p>\r\n\r\n<p><span style=\"font-family:Open Sans\">Знаком и использую современный workflow, работаю с репозиториями git и сборкой проекта на gulp.</span></p>\r\n</div>\r\n', '502514576.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `about`
--
ALTER TABLE `about`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
