-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Авг 01 2022 г., 07:38
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `online_store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Майки', 'Майки на любой вкус'),
(2, 'Футболки', 'Футболки для улицы и дома'),
(3, 'Рубашки', 'Подойдет для работы'),
(4, 'Верхняя одежда', 'На любой сезон'),
(5, 'Шорты', 'Лучшие для жарких дней'),
(6, 'Обувь', 'Удобная, на все сезоны и размеры'),
(7, 'Женщинам', 'Для прекрасных женщин'),
(8, 'Мужчинам', 'Все, что надо для мужчин'),
(9, 'Аксессуары', 'Подойдут к любому гардеробу'),
(10, 'Книги', 'Лучший подарок - это книга'),
(11, 'Детям', 'Для самых маленьких и не только'),
(12, 'Игрушки', 'Все лучшее - детям'),
(13, 'Зоотовары', 'Для братьев наших меньших'),
(14, 'Электроника', 'От телефонов до микроволновки, по приемлемой цене'),
(15, 'Автотовары', 'Для любителей автомобилей'),
(16, 'Сад и Дача', 'Все для дачного сезона'),
(17, 'Пляжная одежда', 'Лучший выбор на лето'),
(18, 'Толстовки', 'Тепло для всех'),
(19, 'Джинсы', 'На любой период года'),
(20, 'Костюмы', 'Для деловых собраний '),
(21, 'Ничего', 'Ничего тут нет');

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `person_name` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `birth` date NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `theme` varchar(128) NOT NULL,
  `question` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`id`, `person_name`, `email`, `birth`, `gender`, `theme`, `question`) VALUES
(1, 'Константин', 'kostian@gmail.com', '2001-12-16', 1, 'Тема', 'Вот мой вопрос.'),
(5, 'Иван', 'ivan@mail.com', '2003-12-16', 1, 'У меня вопрос', 'Текст вопроса моего тут.'),
(6, 'Маша', 'masha@mail.com', '2000-12-21', 0, 'Заголовок', 'Раз, раз, раз, два'),
(8, 'Даша', 'daria@gmail.com', '2001-10-19', 0, 'Тема', 'Текствыарывдаывлпвдапрваыодпрывадпрыдавпрдвыа'),
(13, 'Констанитн', 'email@gmail.com', '1996-05-12', 1, 'Вопрос по сайту', 'Здравствуйте, как купить товар?'),
(14, 'Петя', 'petr@gmail.com', '1999-11-22', 1, 'Вопрос', 'Вопрос'),
(19, 'Вася', 'vasia@gmail.com', '2000-01-01', 1, 'Тема', 'Что-то осмысленное'),
(20, 'Константин', 'kostian123@gmail.com', '2001-12-16', 1, 'Вопросы', 'Проверяем');

-- --------------------------------------------------------

--
-- Структура таблицы `img`
--

CREATE TABLE `img` (
  `id` int(11) NOT NULL,
  `alt` varchar(64) DEFAULT NULL,
  `product_img` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `img`
--

INSERT INTO `img` (`id`, `alt`, `product_img`) VALUES
(1, 'Картинка_1_1', 'img/img1_1.png'),
(2, 'Картинка_1_2', 'img/img1_2.png'),
(3, 'Картинка_1_3', 'img/img1_3.png'),
(4, 'Картинка_2_1', 'img/img2_1.png'),
(5, 'Картинка_2_2', 'img/img2_2.png'),
(6, 'Картинка_2_3', 'img/img2_3.png'),
(7, 'Картинка_3_1', 'img/img3_1.png'),
(8, 'Картинка_3_2', 'img/img3_2.png'),
(9, 'Картинка_3_3', 'img/img3_3.png'),
(10, 'Картинка_4_1', 'img/img4_1.png'),
(11, 'Картинка_4_2', 'img/img4_2.png'),
(12, 'Картинка_4_3', 'img/img4_3.png'),
(13, 'Картинка_5_1', 'img/img5_1.png'),
(14, 'Картинка_5_2', 'img/img5_2.png'),
(15, 'Картинка_5_3', 'img/img5_3.png'),
(16, 'Картинка_6_1', 'img/img6_1.png'),
(17, 'Картинка_6_2', 'img/img6_2.png'),
(18, 'Картинка_6_3', 'img/img6_3.png'),
(19, 'Картинка_7_1', 'img/img7_1.png'),
(20, 'Картинка_7_2', 'img/img7_2.png'),
(21, 'Картинка_7_3', 'img/img7_3.png'),
(22, 'Картинка_8_1', 'img/img8_1.png'),
(23, 'Картинка_8_2', 'img/img8_2.png'),
(24, 'Картинка_8_3', 'img/img8_3.png'),
(25, 'Картинка_9_1', 'img/img9_1.png'),
(26, 'Картинка_9_2', 'img/img9_2.png'),
(27, 'Картинка_9_3', 'img/img9_3.png'),
(28, 'Картинка_10_1', 'img/img10_1.png'),
(29, 'Картинка_10_2', 'img/img10_2.png'),
(30, 'Картинка_10_3', 'img/img10_3.png'),
(31, 'Картинка_11_1', 'img/img11_1.png'),
(32, 'Картинка_11_2', 'img/img11_2.png'),
(33, 'Картинка_11_3', 'img/img11_3.png'),
(34, 'Картинка_12_1', 'img/img12_1.png'),
(35, 'Картинка_12_2', 'img/img12_2.png'),
(36, 'Картинка_12_3', 'img/img12_3.png'),
(37, 'Картинка_13_1', 'img/img13_1.png'),
(38, 'Картинка_13_2', 'img/img13_2.png'),
(39, 'Картинка_13_3', 'img/img13_3.png'),
(40, 'Картинка_14_1', 'img/img14_1.png'),
(41, 'Картинка_14_2', 'img/img14_2.png'),
(42, 'Картинка_14_3', 'img/img14_3.png'),
(43, 'Картинка_15_1', 'img/img15_1.png'),
(44, 'Картинка_15_2', 'img/img15_2.png'),
(45, 'Картинка_15_3', 'img/img15_3.png'),
(46, 'Картинка_16_1', 'img/img16_1.png'),
(47, 'Картинка_16_2', 'img/img16_2.png'),
(48, 'Картинка_16_3', 'img/img16_3.png'),
(49, 'Картинка_17_1', 'img/img17_1.png'),
(50, 'Картинка_17_2', 'img/img17_2.png'),
(51, 'Картинка_17_3', 'img/img17_3.png'),
(52, 'Картинка_18_1', 'img/img18_1.png'),
(53, 'Картинка_18_2', 'img/img18_2.png'),
(54, 'Картинка_18_3', 'img/img18_3.png'),
(55, 'Картинка_19_1', 'img/img19_1.png'),
(56, 'Картинка_19_2', 'img/img19_2.png'),
(57, 'Картинка_19_3', 'img/img19_3.png'),
(58, 'Картинка_20_1', 'img/img20_1.png'),
(59, 'Картинка_20_2', 'img/img20_2.png'),
(60, 'Картинка_20_3', 'img/img20_3.png'),
(61, 'Картинка_21_1', 'img/img21_1.png'),
(62, 'Картинка_21_2', 'img/img21_2.png'),
(63, 'Картинка_21_3', 'img/img21_3.png'),
(64, 'Картинка_22_1', 'img/img22_1.png'),
(65, 'Картинка_22_2', 'img/img22_2.png'),
(66, 'Картинка_22_3', 'img/img22_3.png'),
(67, 'Картинка_23_1', 'img/img23_1.png'),
(68, 'Картинка_23_2', 'img/img23_2.png'),
(69, 'Картинка_23_3', 'img/img23_3.png'),
(70, 'Картинка_24_1', 'img/img24_1.png'),
(71, 'Картинка_24_2', 'img/img24_2.png'),
(72, 'Картинка_24_3', 'img/img24_3.png'),
(73, 'Картинка_25_1', 'img/img25_1.png'),
(74, 'Картинка_25_2', 'img/img25_2.png'),
(75, 'Картинка_25_3', 'img/img25_3.png'),
(76, 'Картинка_26_1', 'img/img26_1.png'),
(77, 'Картинка_26_2', 'img/img26_2.png'),
(78, 'Картинка_26_3', 'img/img26_3.png'),
(79, 'Картинка_27_1', 'img/img27_1.png'),
(80, 'Картинка_27_2', 'img/img27_2.png'),
(81, 'Картинка_27_3', 'img/img27_3.png'),
(82, 'Картинка_28_1', 'img/img28_1.png'),
(83, 'Картинка_28_2', 'img/img28_2.png'),
(84, 'Картинка_28_3', 'img/img28_3.png'),
(85, 'Картинка_29_1', 'img/img29_1.png'),
(86, 'Картинка_29_2', 'img/img29_2.png'),
(87, 'Картинка_29_3', 'img/img29_3.png'),
(88, 'Картинка_30_1', 'img/img30_1.png'),
(89, 'Картинка_30_2', 'img/img30_2.png'),
(90, 'Картинка_30_3', 'img/img30_3.png'),
(91, 'Картинка_31_1', 'img/img31_1.png'),
(92, 'Картинка_31_2', 'img/img31_2.png'),
(93, 'Картинка_31_3', 'img/img31_3.png'),
(94, 'Картинка_32_1', 'img/img32_1.png'),
(95, 'Картинка_32_2', 'img/img32_2.png'),
(96, 'Картинка_32_3', 'img/img32_3.png'),
(97, 'Картинка_33_1', 'img/img33_1.png'),
(98, 'Картинка_33_2', 'img/img33_2.png'),
(99, 'Картинка_33_3', 'img/img33_3.png'),
(100, 'Картинка_34_1', 'img/img34_1.png'),
(101, 'Картинка_34_2', 'img/img34_2.png'),
(102, 'Картинка_34_3', 'img/img34_3.png'),
(103, 'Картинка_35_1', 'img/img35_1.png'),
(104, 'Картинка_35_2', 'img/img35_2.png'),
(105, 'Картинка_35_3', 'img/img35_3.png'),
(106, 'Картинка_36_1', 'img/img36_1.png'),
(107, 'Картинка_36_2', 'img/img36_2.png'),
(108, 'Картинка_36_3', 'img/img36_3.png'),
(109, 'Картинка_37_1', 'img/img37_1.png'),
(110, 'Картинка_37_2', 'img/img37_2.png'),
(111, 'Картинка_37_3', 'img/img37_3.png'),
(112, 'Картинка_38_1', 'img/img38_1.png'),
(113, 'Картинка_38_2', 'img/img38_2.png'),
(114, 'Картинка_38_3', 'img/img38_3.png'),
(115, 'Картинка_39_1', 'img/img39_1.png'),
(116, 'Картинка_39_2', 'img/img39_2.png'),
(117, 'Картинка_39_3', 'img/img39_3.png'),
(118, 'Картинка_40_1', 'img/img40_1.png'),
(119, 'Картинка_40_2', 'img/img40_2.png'),
(120, 'Картинка_40_3', 'img/img40_3.png');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `current_price` decimal(15,2) DEFAULT NULL,
  `sale_price` decimal(15,2) DEFAULT NULL,
  `default_price` decimal(15,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `img_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `store_name` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `current_price`, `sale_price`, `default_price`, `description`, `category_id`, `img_id`, `is_active`, `store_name`) VALUES
(1, 'Рубашка medicine', '2499.00', '2227.00', '2699.00', 'Рубашка Medicine выполнена из вискозной ткани с клетчатым узором. Детали: прямой крой; отложенный воротник; планка и манжеты на пуговицах; карман на груди.', 3, 1, 1, 1),
(2, 'Футболка UZcotton', '249.99', '222.00', '269.00', 'Базовая женская футболка Uzcotton выполнена из премиального трикотажа, который удобен в носке и приятен к телу.', 2, 4, 1, 1),
(3, 'Ботинки Elkland', '3553.00', '3000.00', '13133.00', 'Облегченные водостойкие треккинговые ботинки марки \"Elkland\" - комфортная обувь, которая обладает следующими характеристиками: мягкий носок; специальный изоляционный утеплитель поддерживает комфортную температуру внутри ботинка не только в мороз, но и в жаркую погоду.', 6, 7, 1, 1),
(4, 'Толстовка AMBLUS', '2809.00', '2500.00', '5699.00', 'Базовая женская толстовка выполнена в стиле ОВЕРСАЙЗ из теплого материала - футера трехниточного, с начесом плотностью 330 г/м2 на изнаночной стороне. В составе полотна - хлопковая пряжа пенье, прошедшая специальный отбор и обработку.', 18, 10, 1, 1),
(5, 'Толстовка СПРУТ', '908.00', '800.00', '2639.00', 'Куртка толстовка Etalon Travel - это теплая, модная куртка анорак с капюшоном, который регулируется по лицевому вырезу. Мягкая и приятная на ощупь стильная толстовка отлично сочетается с такими вещами, как джинсы, спортивки, утепленный жилет.', 18, 13, 1, 2),
(6, 'Веер Хозяюшка', '346.00', '300.00', '899.00', 'Компактный, складной веер с кружевом и пластиковым основанием спасёт вас от недостатка свежего воздуха в период сильной жары, либо станет отличным подарком для Вас или Ваших близких.', 9, 16, 1, 2),
(7, 'Джинсы YOUMILE', '2369.00', '2200.00', '9966.00', 'Джинсы женские с завышенной талией из премиального хлопка от бренда YOUMILE. Качественные ткани и современные лекала делают модель удобной и практичной для повседневной носки.', 19, 19, 1, 2),
(8, 'Костюм классический STENSER', '7640.00', '7500.00', '15099.00', 'Классический деловой костюм двойка синего цвета для мужчины, изготовленный по традиционным европейским канонам. Лекала разработаны для большинства типовых размеров российских мужчин.', 20, 22, 1, 2),
(9, 'Спортивный костюм Olivvia', '2267.00', '2000.00', '7900.00', 'Летний костюм женский бренда Olivvia 2х предметный состоит из футболки и шорт. Костюм с шортами женский - это тренд сезона и базовый повседневный образ. ', 20, 25, 1, 2),
(10, 'Рубашка Nouvelle Vague', '2719.00', '2600.00', '15790.00', 'Рубашка мужская классическая с длинным рукавом, рубашка льняная офисная летняя для мужчин, пляжная одежда 100% лен модная. Рубашки бренда Nouvelle Vague действительно отличаются своим Премиальным качеством.', 3, 28, 1, 3),
(11, 'Отцы и дети', '176.00', '150.00', '268.00', '\"Отцы и дети\" знаменитый роман Тургенева, ставший чуть ли не самым значительным произведением в истории о взаимоотношениях поколений.', 10, 31, 1, 3),
(12, 'Дюна', '573.00', '500.00', '814.00', 'Фрэнк Герберт успел написать много, но в истории остался прежде всего как автор эпопеи Дюна. Возможно, самой прославленной фантастической саги двадцатого столетия, саги, переведенной на десятки языков и завоевавшей по всему миру миллионы поклонников. ', 10, 34, 1, 3),
(13, 'Конструктор LEGO City Oceans', '5224.00', '5000.00', '5499.00', 'Познакомьтесь с морскими обитателями вместе с конструктором LEGO City Oceans 60265 \"Океан: исследовательская база\". В ярком наборе дети найдут все, что нужно для настоящих подводных исследований.', 12, 37, 1, 3),
(14, 'Мягкая игрушка Hansa Creation', '2660.00', '2500.00', '4073.00', 'Манул - обитатель степных просторов, лесных чащоб и камышовых зарослей. Несмотря на суровость взрослой особи, котенок манула, невероятно мил и обаятелен, как все кошачьи дети.', 12, 40, 1, 4),
(15, 'Рубашка SJM', '1967.00', '1799.00', '2999.00', 'Рубашка выполненая из 100% вискозы, что значит вы будете себя комфортно чувствовать, а ваша кожа будет дышать даже в очень жаркие дни.Это идеальный вариант, если вы собираетесь в отпуск и не знаете что надеть.', 3, 43, 1, 4),
(16, 'Садовая фигурка Зайчиха с корзинкой', '2489.00', '2299.00', '3260.00', 'Размер фигурки: высота 53 см, длина 25 см, ширина 26см. Вес фигурки 2,3 кг. Фигурка изготовлена из искусственного камня полистоуна, который сочетает в себе все качества природного материала.', 16, 46, 1, 4),
(17, 'Газон искусственный ARS Market', '1379.00', '1199.00', '9999.00', 'Искусственный газон подойдет для сада,дачи и частного дома.Искусственная зелень для декора отлично дополнит интерьер вашей квартиры или балкона.', 16, 49, 1, 4),
(18, 'Когтеточка для кошек \"Волна\"', '2394.00', '2099.00', '3254.00', 'Когтеточка \"Волна\" с площадкой, джут, ковролин, 42 х 25 х 74 см, светло-серый', 13, 52, 1, 1),
(19, 'Лежанка для собак', '497.00', '399.00', '1150.00', 'Лежанка изготовлена из высококачественных натуральных материалов с мягким наполнителем. Легко очищается от шерсти.', 13, 55, 1, 1),
(20, 'Телевизор L32M6-6ARG', '15990.00', '14999.00', '22522.00', 'Устройство получило ультратонкие рамки с трех сторон, операционную систему Android TV, голосовое управление и стереодинамики с поддержкой Dolby Audio и DTS-HD.Черный корпус телевизора изготавливается из металла и пластика.', 14, 58, 1, 1),
(21, 'Ноутбук Lenovo ThinkBook', '61591.00', '60999.00', '69990.00', 'Ноутбук для бизнеса Lenovo ThinkBook 15 G2 ITL это удачный выбор для решения деловых задач. Он очень лёгкий (весит всего 1,7 кг) и тонкий (толщина 18,9 мм), так что вы сможете без труда брать его в командировки и носить с собой, чтобы работать в любом удобном месте.', 14, 61, 1, 1),
(22, 'Коммутатор Tenda', '2394.00', '2999.00', '2598.00', 'TEF1105P-4-63W - коммутатор Tenda PoE, который предлагает 5 портов 10/100 Мбит / с Base-TX RJ45. Передача на расстояние до 250 метров, предел передачи за сотню метров.', 14, 64, 1, 1),
(23, 'Автомагнитола DCR-310G 1 DIN', '714.00', '699.00', '1099.00', 'Автопроигрыватель Digma DCR-310G типоразмера 1 din отличается от своих собратьев ярким дизайном. Он читает музыкальные треки формата MP3 с USB-накопителей или карт памяти и может передавать их с любого стороннего устройства, подключенного через AUX.4 канала звука по 45 Вт позволяют подсоединить к Digma DCR-310G две пары колонок и организовать неплохую аудиосистему в салоне автомобиля.', 15, 67, 1, 1),
(24, 'Корпус Термостата IronM', '3069.00', '2999.00', '7500.00', 'Корпус термостата Опель Астра Шевроле Круз 25192230**Устанавливался на автомобили:**- Opel Astra H J- Opel Zafira B C- Opel Insignia- Opel Mokka- Chevrolet Aveo Sonic- Chevrolet Tracker- Chevrolet Cruze', 15, 70, 1, 2),
(25, 'Туфли женские Rio Fiore', '3070.00', '2799.00', '7490.00', 'Модные туфли-деленки на устойчивом каблуке из искусственного велюра. Этот вид туфель очень популярен среди девушек, так как они удобные в носке и универсальны. Туфли будут прекрасно смотреться с юбками разных фасонов, а также с брюками чиносы или кюлотами.', 6, 73, 1, 2),
(26, 'CROCS', '2982.00', '2799.00', '3899.00', 'Отправляетесь вы на африканское сафари, в поход по мшистому лесу или на исследование городских достопримечательностей, будьте уверены: сабо Classic All-Terrain Clog покорится любой ландшафт.', 6, 76, 1, 2),
(27, 'Шляпа Stetson', '8990.00', '8790.00', '13029.00', 'Хлопковая шляпа федора с люверсами. TRAVELLER DELAVE - модель из 100% натурального хлопка светлого песочного оттенка. Люверсы по окружности обеспечат вентиляцию в жаркую погоду. Купите шляпу, а она вам как раз. Дополнена аккуратной лентой в тон изделия.', 9, 79, 1, 2),
(28, 'Рубашка классическая BAWER', '1900.00', '1800.00', '4990.00', 'Мужская рубашка Bawer выполнена из высококачественного хлопка. Силуэт Slim Fit - плотно сидит по фигуре. Лучше всего подходят для стандартного или худощавого телосложения. Подчёркивает фигуру.', 3, 82, 1, 2),
(29, 'Рубашка классическая Torae Black', '2433.00', '2299.00', '3060.00', 'Рубашка прямого кроя с длинным рукавом и c воротником стойкой. Мягкая хлопковая ткань с эффектом стрейч приятно ощущается на коже и хорошо пропускает воздух. Рубашка прекрасно подойдет под брюки.', 3, 85, 1, 3),
(30, 'Шорты Макс-Экстрим', '1043.00', '799.00', '3030.00', 'Шорты мужские трикотажные с карманами из турецкого хлопка качества пенье компакт.', 5, 88, 0, 3),
(31, 'Командная строка Linux. Полное руководство.', '1733.00', '1599.00', '2814.00', 'Международный бестселлер \"Командная строка Linux\" поможет преодолеть путь от первых робких щелчков по клавишам до уверенного создания полноценных программ для последней версии bash - наиболее популярной командной оболочки Linux.', 10, 91, 1, 3),
(32, 'Букварь', '396.00', '299.00', '1800.00', 'Логопедический букварь Н С Жуковой - первая книга для чтения по слогам для дошкольников . Автор Жукова Надежда - логопед со стажем более 30 лет, создала свою методику, благодаря которой, книга для девочек и мальчиков дошкольного возраста, стала бестселлером среди родителей и учителей.', 10, 94, 1, 3),
(33, 'Пуходерка щетка Пижон', '367.00', '299.00', '999.00', 'Всем известно, что блестящая и красивая шерсть - индикатор здоровья животных. Но и самой шерстке тоже нужен грамотный и регулярный уход. Эти процессы становятся заметно проще, если в арсенале есть хорошая расческа для вычесывания кошек и собак.', 13, 97, 1, 4),
(34, 'Тапочки OMEN', '1262.00', '1099.00', '2200.00', 'Кожаные тапки на все случаи жизни - домой, на улицу, на дачу, в отель. Будете пользоваться круглогодично. Верх - эластичная натуральная кожа, можно подмять под стопу, затем легко распрямляется и принимает прежнюю форму.', 6, 100, 1, 4),
(35, 'Джинсы Eremes', '1676.00', '1599.00', '7300.00', 'Джинсы на лето - незаменимая вещь современного модного базового мужского гардероба. Удобные и функциональные - эти штаны брюки используются в качестве рабочей одежды, для дома, для спорта, для бега.', 19, 103, 1, 4),
(36, 'Майка OMG WEAR', '1198.00', '1099.00', '3400.00', 'Майка мужская - это функциональная одежда, которая предназначена для удержания тепла, поддержания естественной вентиляции тела и защиты от избыточного потоотделения. Футболка мужская хлопок изготовлена из дышащего хлопкового полотна.', 1, 106, 1, 4),
(37, 'Двухсторонняя Майка 3g Speed', '1877.00', '1799.00', '3399.00', 'Обходи соперников в этой удобной универсальной майке для баскетбола. Она выполнена из сетчатого материала с контрастными тремя полосками с одной стороны, и плотного трикотажа - с другой.', 1, 109, 1, 4),
(38, 'Футболка neprosto', '590.00', '499.00', '1001.00', 'Комфортная базовая футболка из 100% хлопка. Черная футболка с модным принтом в виде самолета. Футболку удобно заправлять в шорты, брюки, юбки, джинсы и носить навыпуск. Она подойдет как под классический образ с костюмом, так и под повседневный, спортивный.', 2, 112, 1, 4),
(39, 'Футболка Turkish Shop', '703.00', '699.00', '1500.00', 'Имеет в составе 100% ЭКО хлопок премиального качества плотностью 180 гр. Мягкий,плотный,но в то же время дышащий и приятный к телу материал,при носке которого не появляются катышки.', 2, 115, 0, 4),
(40, 'Парктроник ParkMaster 238', '8654.00', '7999.00', '15183.00', 'ParkMaster 238 восьмидатчиковая система парковки с монохромным LCD-индикатором и чёткой картинкой. Характеристики:LCD-индикатор с универсальным креплением (ножка),графическая и цифровая индикация,звуковое и голосовое оповещение,шаг измерения расстояния 0,01 м,комплектуется 8 датчиками.', 15, 118, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `products_category`
--

CREATE TABLE `products_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `products_category`
--

INSERT INTO `products_category` (`product_id`, `category_id`) VALUES
(1, 3),
(1, 4),
(1, 7),
(2, 4),
(2, 2),
(2, 7),
(3, 6),
(3, 8),
(4, 4),
(4, 7),
(4, 18),
(5, 4),
(5, 8),
(5, 18),
(6, 7),
(6, 9),
(7, 7),
(7, 19),
(8, 4),
(8, 8),
(8, 20),
(9, 4),
(9, 7),
(9, 20),
(10, 3),
(10, 4),
(10, 8),
(11, 10),
(12, 10),
(13, 11),
(13, 12),
(14, 11),
(14, 12),
(15, 3),
(15, 4),
(15, 8),
(16, 16),
(17, 16),
(18, 13),
(19, 13),
(20, 14),
(21, 14),
(22, 14),
(23, 14),
(23, 15),
(24, 15),
(25, 6),
(25, 7),
(26, 6),
(26, 11),
(26, 17),
(27, 8),
(27, 9),
(28, 3),
(28, 4),
(28, 8),
(29, 3),
(29, 4),
(29, 8),
(30, 5),
(30, 8),
(30, 17),
(31, 10),
(32, 10),
(32, 11),
(33, 13),
(34, 6),
(34, 8),
(34, 17),
(35, 8),
(35, 19),
(36, 1),
(36, 4),
(36, 8),
(37, 1),
(37, 4),
(37, 8),
(38, 2),
(38, 4),
(38, 7),
(39, 2),
(39, 4),
(39, 8),
(40, 14),
(40, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `products_img`
--

CREATE TABLE `products_img` (
  `product_id` int(11) NOT NULL,
  `img_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `products_img`
--

INSERT INTO `products_img` (`product_id`, `img_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 13),
(5, 14),
(5, 15),
(6, 16),
(6, 17),
(6, 18),
(7, 19),
(7, 20),
(7, 21),
(8, 22),
(8, 23),
(8, 24),
(9, 25),
(9, 26),
(9, 27),
(10, 28),
(10, 29),
(10, 30),
(11, 31),
(11, 32),
(11, 33),
(12, 34),
(12, 35),
(12, 36),
(13, 37),
(13, 38),
(13, 39),
(14, 40),
(14, 41),
(14, 42),
(15, 43),
(15, 44),
(15, 45),
(16, 46),
(16, 47),
(16, 48),
(17, 49),
(17, 50),
(17, 51),
(18, 52),
(18, 53),
(18, 54),
(19, 55),
(19, 56),
(19, 57),
(20, 58),
(20, 59),
(20, 60),
(21, 61),
(21, 62),
(21, 63),
(22, 64),
(22, 65),
(22, 66),
(23, 67),
(23, 68),
(23, 69),
(24, 70),
(24, 71),
(24, 72),
(25, 73),
(25, 74),
(25, 75),
(26, 76),
(26, 77),
(26, 78),
(27, 79),
(27, 80),
(27, 81),
(28, 82),
(28, 83),
(28, 84),
(29, 85),
(29, 86),
(29, 87),
(30, 88),
(30, 89),
(30, 90),
(31, 91),
(31, 92),
(31, 93),
(32, 94),
(32, 95),
(32, 96),
(33, 97),
(33, 98),
(33, 99),
(34, 100),
(34, 101),
(34, 102),
(35, 103),
(35, 104),
(35, 105),
(36, 106),
(36, 107),
(36, 108),
(37, 109),
(37, 110),
(37, 111),
(38, 112),
(38, 113),
(38, 114),
(39, 115),
(39, 116),
(39, 117),
(40, 118),
(40, 119),
(40, 120);

-- --------------------------------------------------------

--
-- Структура таблицы `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `store`
--

INSERT INTO `store` (`id`, `name`) VALUES
(1, 'Lamoda'),
(2, 'Peach Rich'),
(3, 'Men`s'),
(4, 'МЕГАХЕНД');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `img_id` (`img_id`),
  ADD KEY `store_name` (`store_name`);

--
-- Индексы таблицы `products_category`
--
ALTER TABLE `products_category`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `products_img`
--
ALTER TABLE `products_img`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `img_id` (`img_id`);

--
-- Индексы таблицы `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`img_id`) REFERENCES `img` (`id`),
  ADD CONSTRAINT `store_name` FOREIGN KEY (`store_name`) REFERENCES `store` (`id`);

--
-- Ограничения внешнего ключа таблицы `products_category`
--
ALTER TABLE `products_category`
  ADD CONSTRAINT `products_category_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `products_img`
--
ALTER TABLE `products_img`
  ADD CONSTRAINT `products_img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_img_ibfk_2` FOREIGN KEY (`img_id`) REFERENCES `img` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
