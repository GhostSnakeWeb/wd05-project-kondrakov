-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 12 2019 г., 14:56
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
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_small` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recovery_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recovery_code_times` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `name`, `surname`, `city`, `country`, `avatar`, `avatar_small`, `recovery_code`, `recovery_code_times`) VALUES
(1, 'vladan9820@mail.ru', '$2y$10$LHR4qkEs0uT/4SRrJexO5eEAgnJExgduCV2Tx5t0JF684b5CASPZS', 'admin', 'Владислав', 'Кондраков', 'Оренбург', 'Россия', '1272825169.jpg', '48-1272825169.jpg', 'jdPouprYAW5XOq0', 3),
(2, 'info2@mail.ru', '$2y$10$A1s4qA53pXNhXlAyR3iJ1uNR29.nldwxZj3EGQMnn.6w.bTAwnqOi', 'admin', 'Андрей', 'Григорьев', 'Санкт-Петербург', 'Россия', NULL, NULL, 'rF1qyVsevZtCBIl', 0),
(3, 'info87@mail.ru', '$2y$10$Deb9YV0EEnNWqevfNgokK.n0j5ZWEONkvHIRTxjnNxQTbHNDJET62', 'editor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'info56@gmail.com', '$2y$10$UgZinCiDzOIjQZf0eMh9.uFTCNxErgTnJApE4y.W1X5LNioEtHoqi', 'user', 'Емельян', 'Казаков', 'Витебск', 'Россия', '549790414.jpg', '48-549790414.jpg', NULL, NULL),
(5, 'info25@mail.ru', '$2y$10$7jFYna93e8C/ANLlwNQcEuLIU6bM9TAiR.upjqe3jmbqfHqSHNoKK', 'user', 'Анатолий', 'Крюк', 'Берлин', 'Германия', '730929847.jpg', '48-730929847.jpg', NULL, NULL),
(6, 'rememberme@mail.ru', '$2y$10$LpOD15EaEHTBdOSOG9RCdu28hUtIxugxqjyhnSoa6LB6oILFfa7Oq', 'user', 'Федор', 'Емельяненко', '', '', NULL, NULL, NULL, NULL),
(7, 'reaper@yandex.ru', '$2y$10$8cjX0M/FIgyLeQIr.7XSJ.e8FE46AfRpfZks/Lw8b7Yb5tD8x2cem', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'gnome@gmail.com', '$2y$10$nuE1oWO4x/65CvCDo94tO.nC.PkDKOZk2K/teMt8.0zJ8d2Ozpecm', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
