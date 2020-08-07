-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 07-08-2020 a las 13:54:07
-- Versión del servidor: 5.6.47
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `scmx_covid`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_groups`
--

CREATE TABLE `admin_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_groups`
--

INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES
(1, 'webmaster', 'Webmaster'),
(2, 'admin', 'Administrator'),
(3, 'manager', 'Manager'),
(4, 'staff', 'Staff');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_login_attempts`
--

CREATE TABLE `admin_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_users`
--

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES
(1, '127.0.0.1', 'technest', '$2y$08$OzjNVlSGgY/16wMorv81vusw/U1vkF5I7Xm.ZfAuTwWfB8JGGjc0W', NULL, NULL, NULL, NULL, NULL, NULL, 1451900190, 1595020802, 1, 'technest', NULL),
(2, '127.0.0.1', 'issac', '$2y$08$t6d.1IjnLHcztU6DWWawb.WqBHUIS0vxj.wD66R5axcBmHPVTJYoW', NULL, 'issac.angelsnest@gmail.com', NULL, NULL, NULL, NULL, 1451900228, 1580072400, 1, 'issac', NULL),
(3, '127.0.0.1', 'manager', '$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa', NULL, NULL, NULL, NULL, NULL, NULL, 1451900430, 1465489585, 1, 'Manager', ''),
(4, '127.0.0.1', 'staff', '$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6', NULL, NULL, NULL, NULL, NULL, NULL, 1451900439, 1465489590, 1, 'Staff', ''),
(5, '::1', 'apuleya', '$2y$08$EhLxhz76LoeZD/iBBVy58OwUHsZfrOZOxEPKTnC47xQQj18ow.g2m', NULL, NULL, NULL, NULL, NULL, NULL, 1568746479, 1572042667, 1, 'apuleya', 'pons'),
(6, '::1', 'gabriel', '$2y$08$VkZ79sCsZhtChWj3oLkg2uNlZ2.s830IFRCx2OhF8sK8eFR4mvbN6', NULL, NULL, NULL, NULL, NULL, NULL, 1568746604, 1570491375, 1, 'gabriel', ''),
(7, '189.216.98.40', 'alan', '$2y$08$e5Hn8s4xDzJ0n10jSnIyROsfcWs8zRG2GCgpP7RIQT/EVpw5JR.zW', NULL, NULL, NULL, NULL, NULL, NULL, 1571165382, 1572898634, 1, 'Alan', 'Quintero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_users_groups`
--

CREATE TABLE `admin_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_users_groups`
--

INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_access`
--

CREATE TABLE `api_access` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `api_keys`
--

INSERT INTO `api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 0, 'anonymous', 1, 1, 0, NULL, 1463388382);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_limits`
--

CREATE TABLE `api_limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_logs`
--

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aportaciones`
--

CREATE TABLE `aportaciones` (
  `aportacionID` int(11) NOT NULL,
  `proyectoID` int(11) NOT NULL,
  `auth_code` varchar(256) NOT NULL,
  `event` varchar(50) NOT NULL,
  `hash` varchar(256) NOT NULL,
  `id` int(11) NOT NULL,
  `reference` varchar(256) NOT NULL,
  `status` varchar(100) NOT NULL,
  `total` varchar(40) NOT NULL,
  `nombreAportador` varchar(250) NOT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaInsert` varchar(20) NOT NULL,
  `recompensaID` int(11) NOT NULL,
  `usuarioID` int(11) NOT NULL,
  `estatus` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aportaciones`
--

INSERT INTO `aportaciones` (`aportacionID`, `proyectoID`, `auth_code`, `event`, `hash`, `id`, `reference`, `status`, `total`, `nombreAportador`, `fechaRegistro`, `fechaInsert`, `recompensaID`, `usuarioID`, `estatus`) VALUES
(1, 6, '21159916522020061800200008000000000000000000000000', 'oxxo', '453d7306fa41e543bd09a5977419eecbbe083eabf51ba522afe89fabb029d1bf', 15991652, '6-99-23', 'paid', '200.00', '99', '2020-06-16 15:45:05', '', 23, 99, '1'),
(2, 6, '750670', 'card', '37ed39157290e25ee362d8c38a32b8974e292460f08706982cfb9b1c29a3561e', 16018598, '6-99-32', 'paid', '100.00', '99', '2020-06-21 16:54:40', '2020-06-20 01:57:08', 32, 99, '1'),
(3, 6, '754554', 'card', '4f9be6ce428c7778d06129f54860939f50661dee66067712eff09274e4c8596c', 16018631, '6-105-32', 'paid', '100.00', '105', '2020-06-21 16:54:46', '2020-06-20 02:08:19', 32, 105, '1'),
(4, 6, '725175', 'card', 'bbf2583f91477b6b12180f99896389c6395ef197070ccd1691caa9439c53dbf1', 16029772, '6-102-31', 'paid', '150.00', '102', '2020-06-22 17:42:40', '2020-06-22 17:07:06', 31, 102, '1'),
(5, 6, '841141', 'card', 'c0256913c71604b9de81cf3200a91efafc6422be9d31887f56a766ce17e4d463', 16030101, '6-102-30', 'paid', '200.00', '102', '2020-06-22 17:42:47', '2020-06-22 17:22:58', 30, 102, '1'),
(6, 6, '697473', 'card', '646af90fdc781eee9fb8cd349a0363f97a60853da21db6043d886c37c766f3c8', 16037453, '6-106-31', 'paid', '150.00', '106', '2020-06-24 00:46:08', '2020-06-24 00:41:36', 31, 106, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aportaciones_fallidas`
--

CREATE TABLE `aportaciones_fallidas` (
  `aportacionID` int(11) NOT NULL,
  `proyectoID` int(11) NOT NULL,
  `auth_code` int(11) NOT NULL,
  `event` varchar(50) NOT NULL,
  `hash` varchar(256) NOT NULL,
  `id` int(11) NOT NULL,
  `reference` varchar(256) NOT NULL,
  `status` varchar(100) NOT NULL,
  `total` varchar(40) NOT NULL,
  `nombreAportador` varchar(250) NOT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `recompensaID` int(11) NOT NULL,
  `usuarioID` int(11) NOT NULL,
  `estatus` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'members', 'General User'),
(2, 'Angeles aportadores', ''),
(3, 'Emprendedores', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `imagenID` int(11) NOT NULL,
  `proyectoID` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `rutaImagen` varchar(100) NOT NULL,
  `fechaRegistro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`imagenID`, `proyectoID`, `categoria`, `rutaImagen`, `fechaRegistro`) VALUES
(21, 2, 'logotipo', '64c25-captura-de-pantalla-de-2019-04-08-12-48-57.png', '2019-09-25'),
(22, 4, 'logotipo', '666c4-captura-de-pantalla-de-2019-09-17-11-09-35.png', '2019-09-26'),
(23, 3, 'logotipo', '17114-avatar_prueba.png', '2019-09-25'),
(24, 3, 'idea', 'd9b55-captura-de-pantalla-de-2019-09-14-16-46-14.png', '2019-09-25'),
(25, 3, 'producto_servicio', 'd3e33-captura-de-pantalla-de-2019-09-17-11-09-35.png', '0000-00-00'),
(26, 3, 'idea', 'bd40f-5667a-foto-22.jpg', '2019-09-25'),
(27, 3, 'solucion', '9d41c-5667a-foto-22.jpg', '2019-09-25'),
(28, 2, 'idea', '8c65b-captura-de-pantalla-de-2019-09-14-16-46-14.png', '2019-09-26'),
(29, 2, 'producto_servicio', '71097-captura-de-pantalla-de-2019-09-14-15-47-41.png', '0000-00-00'),
(30, 2, 'solucion', 'f2536-captura-de-pantalla-de-2019-09-09-14-08-36.png', '0000-00-00'),
(31, 4, 'idea', 'a623c-lel.jpeg', '2019-09-26'),
(32, 4, 'producto_servicio', '196e8-5667a-foto-22.jpg', '0000-00-00'),
(33, 4, 'solucion', '838d4-captura-de-pantalla-de-2018-12-27-12-25-16.png', '0000-00-00'),
(35, 5, 'logotipo', '9fc4b-logo.png', '2019-09-26'),
(36, 5, 'producto_servicio', 'e251b-images-2-.jpeg', '2019-09-26'),
(37, 6, 'logotipo', '43a02-construyendo-caminos-merida-logo.png', '0000-00-00'),
(38, 6, 'producto_servicio', '08850-foto-13.jpg', '0000-00-00'),
(39, 6, 'solucion', '50720-foto-14.jpg', '0000-00-00'),
(40, 6, 'idea', 'd857f-foto-26.jpg', '0000-00-00'),
(42, 6, 'producto_servicio', '8c97b-foto-22.jpg', '0000-00-00'),
(43, 6, 'solucion', '48c11-foto-9.jpg', '0000-00-00'),
(44, 6, 'idea', '70a56-foto-18.jpg', '0000-00-00'),
(45, 8, 'logotipo', '4386a-los-pollos-hermanos.jpg', '2019-10-03'),
(46, 11, 'logotipo', 'bf257-2nmmxmsy.jpg', '0000-00-00'),
(47, 13, 'logotipo', '96a46-scmxplataforma_header_v1.0.png', '2020-06-14'),
(48, 14, 'logotipo', '25d96-scmxplataforma_header_hospitalmilitar_v1.0.png', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `proyectoID` int(11) NOT NULL,
  `usuarioID` int(11) DEFAULT NULL,
  `nombreProyecto` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `descripcionCorta` text NOT NULL,
  `idea` text NOT NULL,
  `montoRequerido` varchar(20) NOT NULL,
  `equipo` text NOT NULL,
  `mercado` text NOT NULL,
  `producto` text NOT NULL,
  `problema` text NOT NULL,
  `impacto` text NOT NULL,
  `ingresos` varchar(20) NOT NULL,
  `fechaRegistro` date NOT NULL,
  `fechaCambio` date NOT NULL,
  `estatus` varchar(100) NOT NULL,
  `paginaWeb` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`proyectoID`, `usuarioID`, `nombreProyecto`, `descripcion`, `descripcionCorta`, `idea`, `montoRequerido`, `equipo`, `mercado`, `producto`, `problema`, `impacto`, `ingresos`, `fechaRegistro`, `fechaCambio`, `estatus`, `paginaWeb`) VALUES
(1, NULL, 'kxnjvls', '<p>\n	xncvkjsdb</p>\n', '', '<p>\n	jnsdvjsdb</p>\n', 'nsdjlvn', '<p>\n	sdnvlfj</p>\n', '<p>\n	ldfjgnbl</p>\n', '<p>\n	jldfngvl</p>\n', '<p>\n	ldfjgnb</p>\n', '<p>\n	fdjlgn</p>\n', 'fgbjdkl', '2019-09-18', '2019-09-18', 'revision', ''),
(2, NULL, 'gomitas de coca', '<p>\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac enim leo. Donec vel mollis libero. Fusce laoreet porta commodo. Duis dapibus lacinia ipsum sit amet finibus. Suspendisse porttitor lectus vitae ligula scelerisque viverra. Nam tempus orci condimentum elit maximus, auctor feugiat metus blandit. Fusce rhoncus et sapien malesuada tempor. Fusce scelerisque velit sem, eget iaculis odio varius quis. Ut egestas libero nunc, ac mattis orci finibus quis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum neque ligula, vehicula auctor mattis quis, venenatis quis velit. Sed a nibh et neque maximus laoreet at ac tellus. Praesent ac congue nibh, eu fringilla nibh. Etiam a justo vitae magna suscipit ullamcorper.</p>\n', '<p>\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac enim leo. Donec vel mollis libero. Fusce laoreet porta commodo. Duis dapibus lacinia ipsum sit amet finibus. Suspendisse porttitor lectus vitae ligula scelerisque viverra.&nbsp;</p>\n', '<p>\n	<span background-color:=\"\" open=\"\" style=\"color: rgb(51, 51, 51); font-family: \" text-align:=\"\">Somos una asociaci&oacute;n civil que ofrece la atenci&oacute;n necesaria para favorecer el desarrollo de competencias art&iacute;sticas, actividades f&iacute;sicas&nbsp; y sociales en personas con discapacidad motriz y/o cognitiva para lograr su inserci&oacute;n en la comunidad. De igual forma, hemos desarrollado contenidos de divulgaci&oacute;n hacia la poblaci&oacute;n en general que permitan el entendimiento e inserci&oacute;n de j&oacute;venes y sus familias.</span></p>\n', '100000', '<p>\n	Mi equipo esta conformado por mi, mi otro mi y el mas importante, yop</p>\n', '<p>\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac enim leo. Donec vel mollis libero. Fusce laoreet porta commodo. Duis dapibus lacinia ipsum sit amet finibus. Suspendisse porttitor lectus vitae ligula scelerisque viverra. Nam tempus orci condimentum elit maximus, auctor feugiat metus blandit. Fusce rhoncus et sapien malesuada tempor. Fusce scelerisque velit sem, eget iaculis odio varius quis. Ut egestas libero nunc, ac mattis orci finibus quis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum neque ligula, vehicula auctor mattis quis, venenatis quis velit. Sed a nibh et neque maximus laoreet at ac tellus. Praesent ac congue nibh, eu fringilla nibh. Etiam a justo vitae magna suscipit ullamcorper.</p>\n', '<p>\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac enim leo. Donec vel mollis libero. Fusce laoreet porta commodo. Duis dapibus lacinia ipsum sit amet finibus. Suspendisse porttitor lectus vitae ligula scelerisque viverra. Nam tempus orci condimentum elit maximus, auctor feugiat metus blandit. Fusce rhoncus et sapien malesuada tempor. Fusce scelerisque velit sem, eget iaculis odio varius quis. Ut egestas libero nunc, ac mattis orci finibus quis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum neque ligula, vehicula auctor mattis quis, venenatis quis velit. Sed a nibh et neque maximus laoreet at ac tellus. Praesent ac congue nibh, eu fringilla nibh. Etiam a justo vitae magna suscipit ullamcorper.</p>\n', '<p>\n	<span background-color:=\"\" font-size:=\"\" open=\"\" style=\"color: rgb(51, 51, 51); font-family: \" text-align:=\"\">Atenci&oacute;n a j&oacute;venes y adultos con discapacidad y trastornos del neurodesarrollo que debido a su edad o nivel de maduraci&oacute;n en habilidades socio adaptativas, no cuentan con programas educativos (p&uacute;blicos y/o privados) que contribuyan a desarrollar sus capacidades e inclusi&oacute;n social.</span></p>\n', '<p>\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac enim leo. Donec vel mollis libero. Fusce laoreet porta commodo. Duis dapibus lacinia ipsum sit amet finibus. Suspendisse porttitor lectus vitae ligula scelerisque viverra. Nam tempus orci condimentum elit maximus, auctor feugiat metus blandit. Fusce rhoncus et sapien malesuada tempor.</p>\n', '1000', '2019-09-26', '2019-09-26', 'inactivo', ''),
(3, NULL, 'hola', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '<p>\n	Esta es una descripcion corta para este proyecto de Social Crowd Mx para la V 2.0 mas shida :V</p>\n', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '120,000', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '10000', '2019-09-26', '2019-09-26', 'inactivo', ''),
(4, NULL, 'pomada de canavis', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0);\" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s,</span></p>\n', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '100,000', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '<p>\n	<strong font-size:=\"\" open=\"\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\n', '10000', '2019-09-26', '2019-09-26', 'inactivo', ''),
(5, NULL, 'Toyvirtual', '<p>\n	Juguetes en realidad virtual</p>\n', '<p>\n	Nueva generaci&oacute;n de juguetes</p>\n', '<p>\n	Juguetes de &uacute;ltima tecnolog&iacute;a</p>\n', '10000', '<p>\n	yo y unos colegas</p>\n', '<p>\n	Entretenimiento</p>\n', '<p>\n	Juguetes virtuales</p>\n', '<p>\n	El aburrimiento en las edades j&oacute;venes (ni&ntilde;os-jovenes)</p>\n', '<p>\n	Dkksss</p>\n', '0', '2019-09-26', '2019-09-26', 'inactivo', ''),
(6, NULL, 'Construyendo Caminos Mérida', '<p>\n	Somos una asociaci&oacute;n civil que ofrece la atenci&oacute;n necesaria para favorecer el desarrollo de competencias art&iacute;sticas, actividades f&iacute;sicas y sociales en personas con discapacidad motriz y/o cognitiva para lograr su inserci&oacute;n en la comunidad. De igual forma, hemos desarrollado contenidos de divulgaci&oacute;n hacia la poblaci&oacute;n en general que permitan el entendimiento e inserci&oacute;n de j&oacute;venes y sus familias.</p>\n', '<p>\n	<span style=\"font-family: arial, helvetica, sans-serif;\">Somos un grupo de profesionales dedicados a la formaci&oacute;n integral de j&oacute;venes en diferentes &aacute;reas, teniendo la seguridad que son capacidades enriquecedoras y terap&eacute;uticas para el desarrollo de sus habilidades&nbsp;que les permitir&aacute;n una mejor calidad de vida.&nbsp;</span></p>\n', '<p>\n	Ofrecer un espacio inclusivo para j&oacute;venes y adultos con discapacidad y trastornos del desarrollo, en el que puedan aumentar sus habilidades, usando las artes como la principal herramienta para impulsar sus aptitudes musicales, pict&oacute;ricas, danc&iacute;sticas, teatrales y lograr una mejor calidad de vida, aumentando su autoestima, autonom&iacute;a e inclusi&oacute;n social, conplementando el programa con actividades para pr&aacute;cticas, habilidades socioadaptativas y de activaci&oacute;n f&iacute;sica.</p>\n', '10000', '<div>\n	Lourdes Janneth Espinosa Herrera, Presidente</div>\n<div>\n	Addy Isabel Tornero Aguilar, Vicepresidente</div>\n<div>\n	Jorge Albor D&iacute;az, Secretario</div>\n<div>\n	Gabriela Marlene de J. Caballero Chan, Tesorero</div>\n<div>\n	&nbsp;</div>\n', '<p>\n	Mercado: Educaci&oacute;n y Organizaciones P&uacute;blicas y/o privadas de sociedad civil a nivel peninsular y/o nacional dedicadas a los j&oacute;venes que presentan alg&uacute;n tipo de discapacidad.</p>\n', '<p>\n	Servicios educativos para j&oacute;venes con discapacidad.&nbsp;</p>\n', '<p>\n	Atenci&oacute;n a j&oacute;venes y adultos con discapacidad y trastornos del neurodesarrollo que debido a su edad o nivel de maduraci&oacute;n en habilidades socioadaptativas, no cuentan con programas educativos (p&uacute;blicos y/o privados) que contribuyan a desarrollar sus capacidades e inclusi&oacute;n social.</p>\n', '<div>\n	Beneficio directo a 14 j&oacute;venes y sus familias.</div>\n<div>\n	Fuente de empleo para ocho personas: seis docentes especialistas, un administrativo, un operativo.</div>\n<div>\n	Visibilidad para este segmento de la poblaci&oacute;n.</div>\n', '', '2020-06-17', '2020-06-17', 'revision', ''),
(7, NULL, 'vcb', '<p>\n	dv{m</p>\n', '<p>\n	dvk{,</p>\n', '<p>\n	c,vlsdv,</p>\n', '100', '<p>\n	sd,vm</p>\n', '<p>\n	km</p>\n', '<p>\n	dvmsmvd</p>\n', '<p>\n	dcvkmsdk.&ntilde;</p>\n', '<p>\n	vsdm</p>\n', '', '2019-10-03', '2019-10-03', 'captura', ''),
(8, NULL, 'Los Pollos Hermanos', '<p>\n	Distribuimos pollos en todo M&eacute;xico Norte Am&eacute;rica y Canad&aacute;</p>\n', '<p>\n	Distribuimos Pollos en toda Norte Am&eacute;rica y Canad&aacute;, adem&aacute;s de ser los productores n&uacute;mero uno en el Pa&iacute;s.</p>\n', '<p>\n	Contamos con Mil camiones para distribuir los pollos por el resto del mundo pero queremos exportar a Europa.</p>\n', '$10000', '<p>\n	Contamos con mil empleados en toda la Rep&uacute;blica Mexicana y con 200 empleados en Norte Am&eacute;rica y Canad&aacute;, adem&aacute;s de nuestro Jefe de operaciones.</p>\n', '<p>\n	Nuestro Nicho de Mercado se especializa en Mujeres de entre 20 y 40 a&ntilde;os de edad, deportistas e interesadas en cuidar el medio ambiente.</p>\n', '<p>\n	Pollos frescos de la mas alta calidad.</p>\n', '<p>\n	Nuestros precios son los mejores del mercado ayudando a la econom&iacute;a de las familias mexicanas y a preservar el ecosistema de los pollos.</p>\n', '<p>\n	Ayuda a unir a las familias</p>\n', '1000', '2019-10-03', '2019-10-03', 'captura', ''),
(9, NULL, 'HEXOLOTL DOWN ', '<p>\n	<span style=\"font-family: arial, helvetica, sans-serif;\">El proyecto nace desde el mes de Febrero del 2016 debido a que ten&iacute;amos la inquietud de apoyar a mi hijo &Aacute;ngel Gabriel Nava Mendoza que ahora cuenta con 22 a&ntilde;os de edad, el cual al ver que ya no hab&iacute;a mayor proyecci&oacute;n para &eacute;l , y de que se reconoci&oacute; como un joven con la necesidad de ser incluido para tener un un crecimiento y desarrollo personal, as&iacute; como econ&oacute;mico, que piensa y siente como todos los seres humanos, nos dimos a la tarea de buscar la forma de c&oacute;mo poder realizar una de las actividades que tanto le gustan a &Aacute;ngel que es Criar Pavos, ya que era una actividad que realizaba con el abuelo Ferm&iacute;n que ten&iacute;a cr&iacute;a de estas aves y a mi hermano y a m&iacute; nos gust&oacute; esta actividad, posteriormente otros j&oacute;venes tambi&eacute;n con S&iacute;ndrome de Down, fueron integr&aacute;ndose poco a poco siendo que en el mes de febrero del 2017 nos constituimos como una Sociedad Cooperativa, siendo la plataforma excelente para todos los j&oacute;venes y todos sus integrantes; misma que a la fecha estamos realizando en una granja que se encuentra en Amecameca y posteriormente con el apoyo de nuestro padre, nos han dado un terreno en el Cuarto Dinamo en el paraje denominado Los Llanos de Acopilco dentro de Los Bienes Comunales de la Comunidad de La Magdalena Atlitic donde mi padre es comunero y ya contamos con Acta de Asamblea, Anuencia y Uso de Suelo, para desarrollar nuestro proyecto aqu&iacute; en La Magdalena Contreras, debido a que por el entusiasmo y dedicaci&oacute;n que le hemos dado al proyecto muchos j&oacute;venes con S&iacute;ndrome de Down se han integrado al proyecto con el mismo entusiasmo, esto nos llev&oacute; a crecer nuestro proyecto y contamos con un proyecto de construcci&oacute;n 100% sustentable.</span></p>\n', '<p>\n	PRODUCCI&Oacute;N DE CARNE DE PAVO ORG&Aacute;NICO&nbsp;</p>\n', '', '150000', '', '<p>\n	Venta y producci&oacute;n de pavos</p>\n', '<p>\n	<span style=\"font-family: arial, helvetica, sans-serif;\">375 aves mensuales</span></p>\n<p>\n	<span style=\"font-family: arial, helvetica, sans-serif;\">&nbsp;De las cuales las procesamos en:</span></p>\n<ol>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Pierna</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Muslo</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Retazo (Huacal, Rabadilla y Pescuezos)</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Carne Molida para Alb&oacute;ndigas, Picadillo, Croquetas, Hamburguesas</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Menudencias (Coraz&oacute;n y Molleja)</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Milanesas de Pavo</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Al&oacute;n</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Brochetas</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Longaniza</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">&nbsp;Fajitas</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Hamburguesas</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Bolognesa</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Filete de pechuga natural</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Filete de pechuga enchilada</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Filete de Pechuga empanizado</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Pechuga Completa</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Paquete de carne Natural en Trocitos</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Paquete de carne enchilada en trocitos</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Carne Deshebrada</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Salchichas</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Jam&oacute;n</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Tradicional Pavo Navide&ntilde;o</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Pavo Ahumado&nbsp;</span></li>\n	<li>\n		<span style=\"font-family: arial, helvetica, sans-serif;\">Muslo Ahumado</span></li>\n	<li>\n		Jamon ahumado</li>\n</ol>\n<p>\n	&nbsp;</p>\n<p>\n	&nbsp;</p>\n', '<p>\n	<font color=\"#000000\" face=\"arial, helvetica, sans-serif\">- cerco natural para poder iniciar la construccion de las galeras&nbsp;</font></p>\n<p>\n	<font color=\"#000000\" face=\"arial, helvetica, sans-serif\">- caba&ntilde;as para velador&nbsp;</font></p>\n', '<p>\n	??????</p>\n', '', '2019-10-29', '2019-10-29', 'revision', ''),
(10, NULL, 'BIOMASA Samajo', '<p>\n	<span style=\"text-align: justify;\">Somos un grupo multidisciplinario de emprendedores sociales, con la firme convicci&oacute;n de resolver problemas que aquejan al pa&iacute;s, buscando generar empleos de manera directa e indirecta, mejorarando la vida de miles de familias mexicanas, contribuyendo al mejoramiento ambiental.</span></p>\n', '<p>\n	Uso integral de recursos naturales NO aprovechados, para la producci&oacute;n de energ&iacute;a limpia y alimentos nutritivos.</p>\n', '<p>\n	Producci&oacute;n de energ&iacute;a limpia y alimentos nutritivos</p>\n', '15000', '', '', '<p style=\"text-align: justify;\">\n	Hacemos uso integral de una especie arborea, que actualmente se desecha como basura el almendro Indio de cascara dura (Terminalia Catappa), en todo el sureste mexicano. Empleamos su cascara para producir un combustible renovable, ecol&oacute;gico en pellets o briquetas de BIOMASA, capaz de generar energ&iacute;a t&eacute;rmica, que podemos usar en nuestra vida diaria para generar calor. Al ser ecol&oacute;gico brinda emisiones neutras de gases de efecto invernadero. Ya que el mismo CO<sub>2</sub>&nbsp;que absorbi&oacute; durante su crecimiento en la fotos&iacute;ntesis, es el mismo que libera cuando se quema. Pero eso no es todo, esta especie, nos permite que con su fruto se elaboren productos nutritivos derivados de almendra secundarios como: palanquetas, harina y aceite.</p>\n<p style=\"text-align: justify;\">\n	Inicialmente capacitamos a 30 familias en el uso de esta tecnolog&iacute;a, actualmente hemos beneficiado a 200 familias, generando 10 empleos de manera directa en el cultivo de los almendros, buscando combatir la malnutrici&oacute;n de las familias con nuestros productos nutritivos.</p>\n<div>\n	&nbsp;</div>\n', '<p style=\"text-align: justify;\">\n	La mala calidad del aire, problema urgente de atender, cuyas consecuencias son enfermedades respiratorias, como la cardiopat&iacute;a isqu&eacute;mica , bornquitis asma etc. Afectando a ni&ntilde;os y adultos mayores y representa 467 muertes anuales seg&uacute;n datos de la OMS. La mala calidad del aire tambi&eacute;n aporta gases nocivos que generan calentamiento global como CO, CO<sub>2</sub>&nbsp;entre otros.</p>\n<p style=\"text-align: justify;\">\n	Hoy M&eacute;xico ocupa tercer lugar en emisi&oacute;n de gases contaminantes de am&eacute;rica latina y queremos contribuir a mitigar esas emisiones.</p>\n', '<p>\n	?????????</p>\n', '', '2019-10-29', '2019-10-29', 'revision', ''),
(11, 2, 'Bio-Ékaton (Producción de Fertilizante Orgánico).', '<p style=\"margin: 0cm 0cm 0.0001pt; color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n	<big><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:18px;\"><span style=\"color: rgb(32, 31, 30);\">Las chinampas fueron construidas hace m&aacute;s de 1000 a&ntilde;os y &eacute;sta zona es considerada&nbsp;<strong>Patrimonio Cultural de la Humanidad.</strong> </span></span></span></big></p>\r\n<p style=\"margin: 0cm 0cm 0.0001pt; color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n	<span style=\"color: rgb(32, 31, 30); font-size: 18px; font-family: \" trebuchet=\"\">Aqu&iacute; habita el </span><strong style=\"color: rgb(32, 31, 30); font-size: 18px; font-family: \" trebuchet=\"\">ajolote</strong><span style=\"color: rgb(32, 31, 30); font-size: 18px; font-family: \" trebuchet=\"\">, especie end&eacute;mica de M&eacute;xico y que&nbsp;</span><span class=\"Object\" color:=\"\" cursor:=\"\" id=\"OBJ_PREFIX_DWT87_com_zimbra_date\" style=\"font-size: 18px; font-family: \" trebuchet=\"\">hoy</span><span style=\"color: rgb(32, 31, 30); font-size: 18px; font-family: \" trebuchet=\"\">&nbsp;d&iacute;a se encuentra en <strong>peligro de extinci&oacute;n</strong> principalmente por la presencia de peces que son una plaga y que fueron introducidos en los a&ntilde;os 70&acute;s.</span></p>\r\n<p style=\"margin: 0cm 0cm 0.0001pt; color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n	<big><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:18px;\"><span style=\"color: rgb(32, 31, 30);\">&nbsp;</span></span></span></big></p>\r\n<p style=\"margin: 0cm 0cm 0.0001pt; color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n	<big><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:18px;\"><span style=\"color: rgb(32, 31, 30);\">En la zona de las chinampas existe una gran variedad de fauna pero con todo y eso, en t&eacute;rminos culturales y ecol&oacute;gicos, la especie m&aacute;s valiosa que <strong>habita en Xochimilco es el ajolote (Ambystoma mexicanum)</strong>.&nbsp;</span></span></span></big></p>\r\n<p style=\"margin: 0cm 0cm 0.0001pt; color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n	<big><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:18px;\"><span style=\"color: rgb(32, 31, 30);\">Este anfibio es fundamental porque se trata de un depredador que controla la cadena alimenticia del ecosistema.</span></span></span></big></p>\r\n<p style=\"margin: 0cm 0cm 0.0001pt; color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n	<br />\r\n	&nbsp;</p>\r\n<p style=\"margin: 0cm 0cm 0.0001pt; color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n	<big><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:18px;\"><span style=\"color: rgb(32, 31, 30);\">La raz&oacute;n principal por la cu&aacute;l el ajolote est&aacute; en peligro de <strong>extinci&oacute;n</strong> es que <strong>la tilapia</strong> <strong>y la carpa</strong> se alimentan de los huevecillos del ajolote que son fundamentales para su reproducci&oacute;n, </span></span></span></big></p>\r\n<p style=\"margin: 0cm 0cm 0.0001pt; color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n	<big><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:18px;\"><span style=\"color: rgb(32, 31, 30);\">adem&aacute;s de que se acaban el alimento y consumen las plantas de su h&aacute;bitat <strong>modificando con ello su ecosistema</strong> para resguardarse y madurar.</span></span></span></big></p>\r\n<p style=\"margin: 0cm 0cm 0.0001pt; color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:14px;\"><img alt=\"\" src=\"https://gdf-correo.cdmx.gob.mx/service/home/~/?auth=co&amp;loc=es&amp;id=4700&amp;part=2\" style=\"width: 800px; height: 450px;\" /></span></span></p>\r\n<p>\r\n	<strong><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\">&nbsp;<span style=\"font-size: 18px;\">Nuestro proyecto pretende coadyuvar a reparar el da&ntilde;o del ecosistema del ajolotle que ha causado por d&eacute;cadas la tilapia y la carpa en la Zona Chinampera de Xochimilco.&nbsp;</span></span></strong></p>\r\n<p>\r\n	&nbsp;</p>\r\n', '<p>\r\n	<span style=\"display: none;\">&nbsp;</span></p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span id=\"cke_bm_1462S\" style=\"display: none;\">&nbsp;</span>Proyecto que busca recupera el ecosistema del ajolote reducido por la&nbsp;inadecuada&nbsp;introduccion de especies exoticas.<strong>&nbsp;</strong></span><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><strong><span style=\"font-size: 16px;\">Utilizando la tilapia como fertilizante organico.</span></strong></span></p>\r\n<p>\r\n	<span style=\"display: none;\">&nbsp;</span></p>\r\n<p>\r\n	<span style=\"font-size: 18px;\"><img alt=\"\" src=\"https://gdf-correo.cdmx.gob.mx/service/home/~/?auth=co&amp;loc=es&amp;id=4700&amp;part=3\" style=\"width: 800px; height: 450px;\" /></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '<p>\r\n	<big><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size: 18px;\">Nuestra iniciativa&nbsp; propone capturar&nbsp; inicialmente 8 toneladas mensuales de &eacute;stos peces depredadores del ajolote y utilizarlos como materia prima para la producci&oacute;n de un Fertilizante Org&aacute;nico mediante un proceso de innovaci&oacute;n biotecnol&oacute;gica.</span></span></big></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<big><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size: 18px;\">Con ello <strong>se aprovecha el contenido de Nitr&oacute;geno y Nutrientes que aporta el pescado a las plantas.</strong></span></span></big></p>\r\n<p>\r\n	<big><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:18px;\"><span segoe=\"\" style=\"color: rgb(32, 31, 30); font-family: \" text-align:=\"\">Utilizar la tilapia y la carpa para ser transformadas mediante un <strong>proceso innovador en biofertilizante </strong>y con ello ayudar a la <strong>recuperaci&oacute;n </strong>del ecosistema del ajolote.</span></span></span></big></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span segoe=\"\" style=\"color: rgb(32, 31, 30); font-family: \" text-align:=\"\"><img alt=\"\" src=\"file:///E:/BIO%20ECKATON%20024%20logo0%20(1).jpg\" style=\"width: 100px;\" /><img alt=\"\" src=\"https://gdf-correo.cdmx.gob.mx/service/home/~/?auth=co&amp;loc=es&amp;id=4700&amp;part=4\" style=\"width: 1920px; height: 1080px;\" /></span></span></p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span segoe=\"\" style=\"color: rgb(32, 31, 30); font-family: \" text-align:=\"\"><img alt=\"\" src=\"file:///E:/BIO%20ECKATON%20024%20logo0%20(1).jpg\" style=\"width: 800px;\" /></span></span></p>\r\n', '$100,000.00', '<p style=\"margin: 0cm 0cm 0.0001pt; color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n	<span style=\"font-size:18px;\"><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span color:=\"\" segoe=\"\">Jos&eacute; Manuel &Aacute;vila Pe&ntilde;a Vera</span></span></span></p>\r\n<p style=\"margin: 0cm 0cm 0.0001pt; color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n	<span style=\"font-size:18px;\"><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span color:=\"\" segoe=\"\">Marco Tulio Pe&ntilde;a Vera Cervantes</span></span></span></p>\r\n<p style=\"margin: 0cm 0cm 0.0001pt; color: rgb(0, 0, 0); font-size: 11pt; font-family: Calibri, sans-serif; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n	<span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span color:=\"\" segoe=\"\" style=\"font-size: 11.5pt; font-family: \">&nbsp;</span></span></p>\r\n', '<p>\r\n	<strong><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:18px;\">Dirigido a personas que buscan un cambio positivo a el medio ambiente utilizando productos organicos que ayudan en el hogar y para extensos cultivos.</span></span><span style=\"font-size: 18px; font-family: \" trebuchet=\"\">&nbsp; &nbsp;</span></strong></p>\r\n', '<ul>\r\n	<li>\r\n		<span style=\"font-size:18px;\"><strong>1. PRESENTACI&Oacute;N HOGAR:&nbsp; </strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Presentaci&oacute;n 1 litro diluido, Concentraci&oacute;n 2N 2P 2K, con rociador est&aacute;ndar para plantas dentro del hogar. Instrucciones de uso en el envase.<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong></span></li>\r\n	<li>\r\n		<span style=\"font-size:18px;\"><strong>2. PRESENTACI&Oacute;N CASA &ndash; JARD&Iacute;N:&nbsp; </strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Presentaci&oacute;n 1 litro concentrado, Concentraci&oacute;n 2N 2P 2K,&nbsp; con aspersor especial para diluci&oacute;n (end &ndash; sprayer) para jard&iacute;n. Instrucciones de uso en el envase.</span></li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>\r\n<ul>\r\n	<li>\r\n		<strong><span style=\"font-size:18px;\">3. PRESENTACI&Oacute;N AGROINDUSTRIAL:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></strong></li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>\r\n<ul>\r\n	<li>\r\n		<big><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:18px;\">Presentaciones de 25, 50 y 200 litros. </span></span></big></li>\r\n	<li>\r\n		<big><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:18px;\">Concentraci&oacute;n 2N 2P 2K para la germinaci&oacute;n y desarrollo y 3.2&nbsp; Presentaciones de 25, 50 y 200 litros.<span style=\"font-size:18px;\"> </span></span></span></big></li>\r\n	<li>\r\n		<big><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:18px;\">Concentraci&oacute;n 2N 4P 4K para floraci&oacute;n. necesarios para fertilizar la tierra.</span></span></big></li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>\r\n<ul>\r\n	<li>\r\n		<big><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:18px;\">Servicios:</span><span style=\"font-size:18px;\"> </span><span style=\"font-size:18px;\">Soporte t&eacute;cnico y capacitaci&oacute;n con ingenieros agr&oacute;nomos y ambientales especializados, para ofrecer un servicio de excelencia.&nbsp;</span></span></big></li>\r\n</ul>\r\n', '<h2>\r\n	&nbsp;</h2>\r\n<ul>\r\n	<li>\r\n		<span style=\"font-size:18px;\"><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\">Con la fabricaci&oacute;n de los productos Bio &Eacute;katon, coadyuvamos a la limpieza &nbsp;y restauraci&oacute;n de los cuerpos de agua &nbsp;y los ecosistemas contaminados por plagas de pescado nocivas al medio ambiente.</span></span></li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>\r\n<ul>\r\n	<li>\r\n		<span style=\"font-size:18px;\"><span style=\"font-family:trebuchet ms,helvetica,sans-serif;\">Inicialmente lo haremos en los canales de Xochimilco para recuperar el ecosistema del ajolote.</span></span></li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>\r\n', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:18px;\"><span style=\"color: rgb(32, 31, 30); text-align: justify;\">El Proyecto Bio-&Eacute;katon utiliza la tilapia y la carpa para ser transformadas mediante un proceso innovador en biofertilizante y con ello ayudar a la recuperaci&oacute;n del ecosistema del ajolote.</span></span></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span font-size:=\"\" segoe=\"\" style=\"color: rgb(32, 31, 30); font-family: \" text-align:=\"\">El Proyecto Bio-&Eacute;katon utiliza la tilapia y la carpa para ser transformadas mediante un proceso innovador en biofertilizante y con ello ayudar a la recuperaci&oacute;n del ecosistema del ajolote.</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', '2020-01-26', '2020-01-26', 'revision', 'https://www.facebook.com/pg/AjoloteHechoEnXochimilco/photos/?ref=page_internal'),
(12, NULL, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2020-01-07', '', ''),
(13, NULL, '#MexicoUnido #COVID19', '<p>\n	Somos un grupo de voluntarios preocupados en apoyar a los cuerpos de salud, sanitario y de seguridad. Queremos llevar materiales a los hospitales, cl&iacute;nicas, centros de salud, asilos, escuelas y donde haga falta para procurar mitigar los riesgos de quienes noblemente est&aacute;n realizando la labor m&aacute;s importante: salvar vidas.</p>\n<p>\n	&nbsp;</p>\n', '<p>\n	Somos un grupo de voluntarios preocupados en apoyar a los cuerpos de salud, sanitario y de seguridad.</p>\n', '<p>\n	Social Crowd Mx es una plataforma que surgi&oacute; como un programa piloto para emprendimiento de alto impacto social, apoyada por el BID y diversos organismo p&uacute;blicos y privados. <strong>Reservada para apoyar el fondeo colectivo, hoy Social Crowd Mx, se solidariza con los cuerpos m&eacute;dicos, sanitarios, de seguridad, protecci&oacute;n que est&aacute;n cuidando de los enfermos de Covid-19, en hospitales, cl&iacute;nicas, asilos y otros lugares reservados para el tratamiento de los enfermos o poblaci&oacute;n en riesgo como herramienta digital para todos los que deseen aportar para la compra de materiales y equipo de protecci&oacute;n personal y/o insumos m&eacute;dicos. Social Crowd Mx Covid-19, se propuso ofrecer una alternativa de apoyos donde la visibilidad y transparencia son los valores que permitan tener la certeza de la entrega inmediata para llevar los insumos necesarios a quienes lo est&aacute;n requiriendo.</strong></p>\n<p>\n	&nbsp;</p>\n', '10000', '', '', '', '<p>\n	Nos proponemos a donar, en parte, las necesidades de EPP (Equipo de Protecci&oacute;n<span style=\"font-size: 9pt; line-height: 107%; font-family: Arial, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;</span>Personal) y otros insumos que se requieran en los lugares de atenci&oacute;n a enfermos COVID-19.</p>\n', '<p>\n	Nos proponemos atender, en parte, las necesidades de EPP y otros insumos que se requieran en los lugares de atenci&oacute;n a enfermos COVID-19.</p>\n', '', '2020-07-17', '2020-07-17', 'activo', '');
INSERT INTO `proyectos` (`proyectoID`, `usuarioID`, `nombreProyecto`, `descripcion`, `descripcionCorta`, `idea`, `montoRequerido`, `equipo`, `mercado`, `producto`, `problema`, `impacto`, `ingresos`, `fechaRegistro`, `fechaCambio`, `estatus`, `paginaWeb`) VALUES
(14, 14, '¡Apoyémos al Hospital Militar!', '<p>\n	Somos un grupo de voluntarios preocupados en apoyar a los cuerpos de salud, sanitario y de seguridad. Queremos llevar materiales a los hospitales, cl&iacute;nicas, centros de salud, asilos, escuelas y donde haga falta para procurar mitigar los riesgos de quienes noblemente est&aacute;n realizando la labor m&aacute;s importante: salvar vidas.</p>\n<p>\n	&nbsp;</p>\n', '<p>\n	Somos un grupo de voluntarios preocupados en apoyar a los cuerpos de salud, sanitario y de seguridad.</p>\n<p>\n	&nbsp;</p>\n', '<p>\n	Social Crowd Mx es una plataforma que surgi&oacute; como un programa piloto para emprendimiento de alto impacto social, apoyada por el BID y diversos organismo p&uacute;blicos y privados.&nbsp;<strong>Reservada para apoyar el fondeo colectivo, hoy Social Crowd Mx, se solidariza con los cuerpos m&eacute;dicos, sanitarios, de seguridad, protecci&oacute;n que est&aacute;n cuidando de los enfermos de Covid-19, en hospitales, cl&iacute;nicas, asilos y otros lugares reservados para el tratamiento de los enfermos o poblaci&oacute;n en riesgo como herramienta digital para todos los que deseen aportar para la compra de materiales y equipo de protecci&oacute;n personal y/o insumos m&eacute;dicos. Social Crowd Mx Covid-19, se propuso ofrecer una alternativa de apoyos donde la visibilidad y transparencia son los valores que permitan tener la certeza de la entrega inmediata para llevar los insumos necesarios a quienes lo est&aacute;n requiriendo.</strong></p>\n<p>\n	&nbsp;</p>\n', '10000', '', '', '', '<p>\n	Nos proponemos a donar, en parte, las necesidades de EPP (Equipo de Protecci&oacute;n<span style=\"font-size: 9pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: 12.84px; font-family: Arial, sans-serif;\">&nbsp;</span>Personal) y otros insumos que se requieran en los lugares de atenci&oacute;n a enfermos COVID-19.</p>\n', '<p>\n	Nos proponemos atender, en parte, las necesidades de EPP y otros insumos que se requieran en los lugares de atenci&oacute;n a enfermos COVID-19.</p>\n', '', '2020-07-17', '2020-07-17', 'activo', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recompensas`
--

CREATE TABLE `recompensas` (
  `recompensaID` int(11) NOT NULL,
  `proyectoID` int(11) NOT NULL,
  `monto` int(10) NOT NULL,
  `descripcion` text NOT NULL,
  `numAport` int(99) NOT NULL,
  `cantidad` varchar(50) NOT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `recompensas`
--

INSERT INTO `recompensas` (`recompensaID`, `proyectoID`, `monto`, `descripcion`, `numAport`, `cantidad`, `fechaRegistro`) VALUES
(1, 1, 10000, '<p>\n	Esta es una prueba para scmx...</p>\n', 0, '10', '2019-09-17 15:58:36'),
(2, 2, 500, '<p>\n	Prueba para scmx</p>\n', 0, '10', '0000-00-00 00:00:00'),
(3, 2, 10000, '<p>\n	Carta de agradecimiento y menci&oacute;n en redes sociales.</p>\n', 0, '15', '2019-09-24 05:00:00'),
(4, 3, 10, '<p>\n	Agradecimiento en nuestras redes sociales</p>\n', 0, '100', '2019-09-25 05:00:00'),
(5, 4, 500, '<p>\n	Pago en persona para el que aporte en nuestro proyecto</p>\n', 0, '50', '2019-09-26 05:00:00'),
(6, 4, 55, '<p>\n	Entrega de una de nuestras mercancias en persona y a todo color</p>\n', 0, '5', '2019-09-26 05:00:00'),
(7, 4, 30, '<p>\n	Esto es una prueba para scmx&nbsp;</p>\n', 0, '1', '2019-09-26 05:00:00'),
(8, 5, 500, '<p>\n	&lt;shnslajfvbaeslvjbslfvasnl&ntilde;vkas&ntilde;ikg</p>\n', 0, '10', '2019-09-26 05:00:00'),
(10, 6, 1000, '<p>\r\n	Eres un valioso ángel platino, gracias por apoyar este hermoso proyecto y creer en nosotros, es por eso que te brindamos un reconocimiento firmado por nuestros alumnos en una carta-acuarela para que la imprimas.</p>\r\n', 0, '19', '2019-09-27 05:00:00'),
(11, 8, 10000, '<p>\n	Voy a dar las Gracias y un abrazo.</p>\n', 0, '10', '2019-10-03 05:00:00'),
(14, 6, 500, '<p>\n	Las alas doradas llegar&aacute;n pronto a tu correo, representando la gran persona que eres, por eso mismo te enviamos un agradecimiento tama&ntilde;o carta para que lo puedas imprimir en cualquier material.</p>\n<p>\n	&nbsp;</p>\n', 0, '10', '2019-10-07 05:00:00'),
(15, 6, 300, '<p class=\"western\" lang=\"es-ES\" style=\"margin-bottom: 0.28cm; line-height: 108%\">\n	Los &aacute;ngeles tienen alas y t&uacute; eres uno de ellos, nuestras alitas de plata te llegar&aacute;n a tu correo en una cartita firmada. (Pintura acuarela en hoja carta para impresi&oacute;n, firmada por nuestros j&oacute;venes).</p>\n<p>\n	<style type=\"text/css\">\n@page { margin: 2cm }\n		p { margin-bottom: 0.25cm; direction: ltr; line-height: 115%; text-align: left; orphans: 2; widows: 2 }\n		p.western { so-language: es-ES }	</style>\n</p>\n', 0, '10', '2019-10-08 05:00:00'),
(16, 6, 100, '<p>\n	Eres uno de nuestros &aacute;ngeles de bronce, gracias por creer en nuestra labor. Recibir&aacute;s una menci&oacute;n en nuestras redes sociales.</p>\n', 0, '10', '2019-10-09 05:00:00'),
(18, 11, 100, '<p>\r\n	<span style=\"font-size:16px;\">Certicado electr&oacute;nico con el nombre de donante</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n', 0, '350', '2020-01-26 21:26:04'),
(19, 11, 250, '<p>\r\n	<span style=\"font-size:16px;\">Certificado electr&oacute;nico con el nombre del donante</span></p>\r\n<p>\r\n	<span style=\"font-size:16px;\">Tres stickers y un fertilizante de 1 litro.&nbsp;</span></p>\r\n', 0, '150', '2020-01-26 21:26:14'),
(20, 11, 500, '<p>\r\n	<span style=\"font-size:16px;\">Certificado electr&oacute;nico con el nombre del donante</span></p>\r\n<p>\r\n	<span style=\"font-size:16px;\">Tres stickers y dos fertilizantes de 1 litro.</span></p>\r\n', 0, '55', '2020-01-26 06:00:00'),
(21, 13, 10000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #ApoyaALosHeroes T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '50', '0000-00-00 00:00:00'),
(22, 13, 8000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #ApoyaALosHeroes T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '75', '0000-00-00 00:00:00'),
(23, 13, 7000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #ApoyaALosHeroes T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '100', '0000-00-00 00:00:00'),
(24, 13, 6500, '<p>\n	#YoYaSoyAngelAportador #COVID19 #ApoyaALosHeroes T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '125', '0000-00-00 00:00:00'),
(25, 13, 5000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #ApoyaALosHeroes T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '150', '0000-00-00 00:00:00'),
(26, 13, 3000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #ApoyaALosHeroes T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '175', '0000-00-00 00:00:00'),
(27, 13, 2000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #ApoyaALosHeroes T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '200', '0000-00-00 00:00:00'),
(28, 13, 1000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #ApoyaALosHeroes T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '250', '0000-00-00 00:00:00'),
(29, 13, 500, '<p>\n	#YoYaSoyAngelAportador #COVID19 #ApoyaALosHeroes T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '300', '0000-00-00 00:00:00'),
(30, 13, 200, '<p>\n	#YoYaSoyAngelAportador #COVID19 #ApoyaALosHeroes T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 2, '350', '0000-00-00 00:00:00'),
(31, 13, 150, '<p>\n	#YoYaSoyAngelAportador #COVID19 #ApoyaALosHeroes T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 2, '400', '0000-00-00 00:00:00'),
(32, 13, 100, '<p>\n	#YoYaSoyAngelAportador #COVID19 #ApoyaALosHeroes T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 2, '500', '0000-00-00 00:00:00'),
(33, 14, 10000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #H&eacute;roesMedicosMilitares #HospitalMIlitar T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '50', '0000-00-00 00:00:00'),
(34, 14, 8000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #H&eacute;roesMedicosMilitares #HospitalMIlitar T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '75', '0000-00-00 00:00:00'),
(35, 14, 7000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #H&eacute;roesMedicosMilitares #HospitalMIlitar T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '100', '0000-00-00 00:00:00'),
(36, 14, 6500, '<p>\n	#YoYaSoyAngelAportador #COVID19 #H&eacute;roesMedicosMilitares #HospitalMIlitar T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '125', '0000-00-00 00:00:00'),
(37, 14, 5000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #H&eacute;roesMedicosMilitares #HospitalMIlitar T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '150', '0000-00-00 00:00:00'),
(38, 14, 3000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #H&eacute;roesMedicosMilitares #HospitalMIlitar T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '175', '0000-00-00 00:00:00'),
(39, 14, 2000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #H&eacute;roesMedicosMilitares #HospitalMIlitar T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '200', '0000-00-00 00:00:00'),
(40, 14, 1000, '<p>\n	#YoYaSoyAngelAportador #COVID19 #H&eacute;roesMedicosMilitares #HospitalMIlitar T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '250', '0000-00-00 00:00:00'),
(41, 14, 500, '<p>\n	#YoYaSoyAngelAportador #COVID19 #H&eacute;roesMedicosMilitares #HospitalMIlitar T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '300', '0000-00-00 00:00:00'),
(42, 14, 200, '<p>\n	#YoYaSoyAngelAportador #COVID19 #H&eacute;roesMedicosMilitares #HospitalMIlitar T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '350', '0000-00-00 00:00:00'),
(43, 14, 150, '<p>\n	#YoYaSoyAngelAportador #COVID19 #H&eacute;roesMedicosMilitares #HospitalMIlitar T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '400', '0000-00-00 00:00:00'),
(44, 14, 100, '<p>\n	#YoYaSoyAngelAportador #COVID19 #H&eacute;roesMedicosMilitares #HospitalMIlitar T&uacute; tambi&eacute;n puedes hacerlo en:</p>\n', 0, '500', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scv2_estadosrepublica`
--

CREATE TABLE `scv2_estadosrepublica` (
  `estadoID` int(11) NOT NULL,
  `cve_ent` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `estatus` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `scv2_estadosrepublica`
--

INSERT INTO `scv2_estadosrepublica` (`estadoID`, `cve_ent`, `nombre`, `estatus`) VALUES
(1, 0, 'Aguascalientes', 1),
(2, 0, 'Baja California', 1),
(3, 0, 'Baja California Sur', 1),
(4, 0, 'Campeche', 1),
(5, 0, 'Chiapas', 1),
(6, 0, 'Chihuahua', 1),
(7, 0, 'Coahuila de Zaragoza', 1),
(8, 0, 'Colima', 1),
(9, 0, 'Durango', 1),
(10, 0, 'Estado de México', 1),
(11, 0, 'Guanajuato', 1),
(12, 0, 'Guerrero', 1),
(13, 0, 'Hidalgo', 1),
(14, 0, 'Jalisco', 1),
(15, 0, 'Michoacán de Ocampo', 1),
(16, 0, 'Morelos', 1),
(17, 0, 'Nayarit', 1),
(18, 0, 'Nuevo León', 1),
(19, 0, 'Oaxaca', 1),
(20, 0, 'Puebla', 1),
(21, 0, 'Querétaro', 1),
(22, 0, 'Quintana Roo', 1),
(23, 0, 'San Luis Potosí', 1),
(24, 0, 'Sinaloa', 1),
(25, 0, 'Sonora', 1),
(26, 0, 'Tabasco', 1),
(27, 0, 'Tamaulipas', 1),
(28, 0, 'Tlaxcala', 1),
(29, 0, 'Veracruz de Ignacio de la Llave', 1),
(30, 0, 'Yucatán', 1),
(31, 0, 'Zacatecas', 1),
(32, 0, 'Ciudad de México', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scv2_industrias`
--

CREATE TABLE `scv2_industrias` (
  `industriaID` int(11) NOT NULL,
  `industria` varchar(256) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estatus` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `scv2_industrias`
--

INSERT INTO `scv2_industrias` (`industriaID`, `industria`, `fecha_registro`, `estatus`) VALUES
(5, 'Aeroespacial', '2017-12-07 06:35:05', 1),
(6, 'Agrícola', '2017-12-07 06:35:05', 1),
(7, 'Agroindustrial', '2017-12-07 06:35:05', 1),
(8, 'Apoyo a negocios', '2017-12-07 06:35:05', 1),
(9, 'Artes escénicas', '2017-12-07 06:35:05', 1),
(10, 'Artes visuales', '2017-12-07 06:35:05', 1),
(11, 'Automotriz', '2017-12-07 06:35:05', 1),
(12, 'Calzado', '2017-12-07 06:35:05', 1),
(13, 'Construcción', '2017-12-07 06:35:05', 1),
(14, 'Desarrollo tecnológico', '2017-12-07 06:35:05', 1),
(15, 'Diseño y moda', '2017-12-07 06:35:05', 1),
(16, 'Energìa convecional', '2017-12-07 06:35:05', 1),
(17, 'Energía renovable', '2017-12-07 06:35:05', 1),
(18, 'Equipo médico', '2017-12-07 06:35:05', 1),
(19, 'Escultura', '2017-12-07 06:35:05', 1),
(20, 'Industria textil', '2017-12-07 06:35:05', 1),
(21, 'Investigación científica', '2017-12-07 06:35:05', 1),
(22, 'Logistica', '2017-12-07 06:40:10', 0),
(23, 'Maquinaria y equipo', '2017-12-07 06:35:05', 1),
(24, 'Minerìa', '2017-12-07 06:35:05', 1),
(25, 'Minería de datos', '2017-12-07 06:35:05', 1),
(26, 'Musica', '2017-12-07 06:35:05', 1),
(27, 'Pintura', '2017-12-07 06:35:05', 1),
(28, 'Quìmica', '2017-12-07 06:35:05', 1),
(29, 'Reconstrucciòn', '2017-12-07 06:35:05', 1),
(30, 'Turismo', '2017-12-07 06:35:05', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scv2_proyectos`
--

CREATE TABLE `scv2_proyectos` (
  `proyectoID` int(11) NOT NULL,
  `usuarioID` int(11) NOT NULL,
  `industriaID` int(11) NOT NULL,
  `nombre_proyecto` varchar(256) NOT NULL,
  `slug` varchar(256) NOT NULL,
  `descripcion_corta` varchar(256) NOT NULL,
  `imagen_url` varchar(256) NOT NULL,
  `descripcion_proyecto` text NOT NULL,
  `producto_o_servicio` text NOT NULL,
  `monto_requerido` varchar(256) NOT NULL,
  `problema_que_resuelve` text NOT NULL,
  `desglose_recursos` text NOT NULL,
  `video_youtube` varchar(256) NOT NULL,
  `correo` varchar(256) NOT NULL,
  `telefono` varchar(256) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_registro_proyecto` datetime NOT NULL,
  `estado_republica_id` int(11) NOT NULL,
  `fecha_activacion` datetime NOT NULL,
  `plazo_fondeo` int(11) NOT NULL,
  `leyenda_recompensas` varchar(500) NOT NULL,
  `etapaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `scv2_proyectos`
--

INSERT INTO `scv2_proyectos` (`proyectoID`, `usuarioID`, `industriaID`, `nombre_proyecto`, `slug`, `descripcion_corta`, `imagen_url`, `descripcion_proyecto`, `producto_o_servicio`, `monto_requerido`, `problema_que_resuelve`, `desglose_recursos`, `video_youtube`, `correo`, `telefono`, `fecha_registro`, `fecha_registro_proyecto`, `estado_republica_id`, `fecha_activacion`, `plazo_fondeo`, `leyenda_recompensas`, `etapaID`) VALUES
(1, 24, 19, 'ReClicArte', 'reclicarte', 'Crear arte y muebles para impulsar la economía local desde técnicas y materiales reciclados', '', 'A través de Madera , latas (aluminio) , cartón, desperdicio metálico y resina podemos crear muebles, cuadros, y artículos decorativos para activar la economía local a través de la venta de estos artículos, podemos dar empleo, fomentar la creatividad y el arte creando un corredor comercial en la zona!! \r\n\r\nTodo esto fomentado la cultura del reciclaje y cultura de la basura en la zona\r\n\r\nLa localidad se encuentra a pie de carretera donde es un paso obligado entre el transito de una ciudad a otra ! ', 'Se podrá vender : \r\n\r\nMesas para Comedor\r\nCuadros\r\nCabeceras \r\nMesas de Centro\r\nArtículos decorativos para hogar y oficinas \r\n\r\nLa combinación de madera, aluminio y resina epoxica es ilimitado tiene miles de aplicaciones y cada producto es considerada  como pieza de arte, única, eterna y decorativa', '$130,000 ', 'Crear un sistema de comercio organizado, escalable y en linea sustentado de auto empleos basado en oficios para potenciar una creciente demanda de artículos (muebles)  únicos para el hogar llevando ingresos a esta comunidad en especifico , creando un modelo replicable en diversas comunidades :\r\n\r\nya que la materia prima , omitiendo las resinas epoxicas, son de fácil acceso, en la mayoría gratuitas! ', '- Taller de Capinteria ( herramientas múltiples ) : $90,000\r\n\r\n- Fundidora de metales  suaves $ 10,000 \r\n\r\n- Resinas Epoxicas y pigmentos $ 30,000', '', 'shariffbeyruti@gmail.com', '2299011329', '2019-10-24 22:42:38', '2019-10-22 12:41:00', 29, '0000-00-00 00:00:00', 0, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scv2_users`
--

CREATE TABLE `scv2_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `industria` varchar(256) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `paterno` varchar(256) NOT NULL,
  `materno` varchar(256) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `pais` varchar(256) NOT NULL,
  `estado_provincia` varchar(256) NOT NULL,
  `telefono_celular` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `scv2_users`
--

INSERT INTO `scv2_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `industria`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `paterno`, `materno`, `last_name`, `company`, `phone`, `pais`, `estado_provincia`, `telefono_celular`) VALUES
(1, '::1', '', '$2y$08$11dJ2aRt9zveuZhyGHyPjOGOHL3vijWEgm25..FOaOjnjcdgE.uRq', NULL, 'carolina2@gmail.com', '', NULL, NULL, NULL, NULL, 1569782576, 1569811048, 1, 'Yobani', 'Hdz', 'Rivera', NULL, NULL, '5522644304', '', '', ''),
(2, '189.216.99.115', '', '$2y$08$eEEp1shQLyyrEV8WVs2B6eLpgB/Uzv29SzIcOpa.uUeQRiavRTw/q', NULL, 'alan.mendoza2.0.angelsnest@gmail.com', '', NULL, NULL, NULL, NULL, 1570041233, NULL, 1, 'Alan ', 'Mendoza', 'Hernández', NULL, NULL, '5534988831', '', '', ''),
(3, '189.216.98.40', NULL, '$2y$08$mmj7XzvXEkK8ETxd5.8YYOFPjjWgaiRlPmdVqKBCSYQp7PGMnHRsu', NULL, 'nala0183@gmail.com', '', NULL, NULL, NULL, NULL, 1570041381, 1573155595, 1, 'Alannala', 'Quintero ', 'Nava ', NULL, NULL, '5568795830', '', '', ''),
(4, '189.216.99.115', '', '$2y$08$HMxVe5Fhcg7klaM0rqk7KuIx9vhfX2C1ZFhKY.8jZ7QbRqsWxJNu.', NULL, 'jazzfusion.am@gmail.com', '', NULL, NULL, NULL, NULL, 1570041785, 1570115680, 1, 'Alan ', 'Mendoza', 'Hernández', NULL, NULL, '5534988831', '', '', ''),
(5, '189.216.99.115', '', '$2y$08$x0QDOASgZkSPt9Uzvr.sFeiRrAgV5R04D.grGBTQsrKJ4oJBeR.CC', NULL, 'cesar.angelsnest@gmail.com', '', NULL, NULL, NULL, NULL, 1570043422, 1572022889, 1, 'Cesar', 'Perez', 'Hernandez', NULL, NULL, '5542136859', '', '', ''),
(6, '189.216.99.179', '', '$2y$08$xRrkRbtzFEyceiv5WALJ7OmJVwv/scQuWShyTD03xY9PJMfFNlXry', NULL, 'alan.mendoza.angelsnest@gmail.com', '', NULL, NULL, NULL, NULL, 1570119550, 1570119559, 1, 'Alan', 'Mendoza', 'Hernández', NULL, NULL, '5534988831', '', '', ''),
(7, '201.141.84.99', '', '$2y$08$dINRmJOh8sCO6H9euhCafuwbBLTKhfirJ9T5dA9x98DuWDoOLivKi', NULL, 'gabriel.angelsnest@gmail.com', '', NULL, NULL, NULL, NULL, 1570334867, 1577993033, 1, 'Gabriel', 'Delgado', 'Ramirez', NULL, NULL, '5510047103', '', '', ''),
(8, '::1', NULL, '123456789', NULL, 'israel@angelsnest.lat', '', NULL, NULL, NULL, NULL, 1570549980, NULL, 1, 'Israel', 'Pons', '', NULL, NULL, NULL, '', '', ''),
(9, '189.216.98.40', 'Leovigildo ', '$2y$08$OTs2gHl17RGqrCHBSdCLiuOY/jkLdcXPngTvce.UdE1NPlAuw8ege', NULL, 'eduardosanchezmx@yahoo.mx', '', NULL, NULL, NULL, NULL, 1570722828, 1572370186, 1, 'Leovigildo ', 'Sanchez', '', 'Sanchez', NULL, NULL, '', '', ''),
(10, '189.216.98.40', 'Israel', '$2y$08$6RrVd50QvuK4AKFxkier1O5M3rkysYZMJRwZ1Vgk/TSaU2QH.zuz.', NULL, 'israel@soldai.com', '', NULL, NULL, NULL, NULL, 1570722896, 1572470873, 1, 'Israel ', 'Cauich ', '', NULL, NULL, NULL, '', '', ''),
(11, '189.216.98.40', 'Jose', '$2y$08$touK3Ncc6vbNJUaEJH8HBuHnaP1f3FFcxtIB.lkszQlh/VNtXew.G', NULL, 'jmhg12000@yahoo.com.mx', '', NULL, NULL, NULL, NULL, 1570722962, 1572370497, 1, 'Jose', 'Higareda', '', 'Higareda', NULL, NULL, '', '', ''),
(12, '189.216.98.40', 'Ricardo', '$2y$08$LYWyuBKjAQVIyvOVETVEpOv3wuwYHuU2x7WdGEx2OzKMqp3mjIf0S', NULL, 'rugalde@sunik.com.mx', '', NULL, NULL, NULL, NULL, 1570723064, 1572370628, 1, 'Ricardo', 'Patiño', '', 'Patiño', NULL, NULL, '', '', ''),
(13, '189.216.98.40', 'Roberto', '$2y$08$cy9.MNmuxf9msGzWaHChMun76kK/cc5IBi0bZ1LcnGVPemdhJa8OO', NULL, 'rponce.wayak@gmail.com', '', NULL, NULL, NULL, NULL, 1570723124, 1572370740, 1, 'Roberto ', 'Diaz', '', 'Diaz', NULL, NULL, '', '', ''),
(14, '189.216.98.40', 'Jose_Antonio', '$2y$08$QOc4KJ.LwxFKwL1I9ifSue/ut3MA809f0WA2LBW8Wu2eOyMPZqNxG', NULL, 'tony.silveira@inquire.mx', '', NULL, NULL, NULL, NULL, 1570723215, 1572370850, 1, 'Jose', 'Silveira', '', 'Silveira', NULL, NULL, '', '', ''),
(15, '189.216.98.40', 'Joaquín', '$2y$08$/lUNqLsXBRErwqLdheBweuISu6Kp32qyCnNAI8zPpLvd.eRxz1A2u', NULL, 'jemoralesv62@gmail.com', '', NULL, NULL, NULL, NULL, 1570723291, 1572370967, 1, 'Joaquín', 'Elías', 'Morales', 'Morales', NULL, NULL, '', '', ''),
(16, '189.216.98.40', 'Edgard', '$2y$08$d0GGYfwVnPr5e7Wle97Vie9bmIWe1CtzKc.PcHr9V.EcNxivfTfve', NULL, 'edgard@npointgroup.com', '', NULL, NULL, NULL, NULL, 1570723342, 1572371107, 1, 'Edgard', 'Cambranis', '', 'Cambranis', NULL, NULL, '', '', ''),
(17, '189.216.98.40', 'Israel_imán', '$2y$08$av4oLPcNk6kIDpQ5dVKNGOmTiiCIR8fB3i5fHPr3y6Ako6pD0RLEK', NULL, 'lic.imanb@gmail.com', '', NULL, NULL, NULL, NULL, 1570723390, 1572371234, 1, 'Israel', 'Imán', '', 'Imán', NULL, NULL, '', '', ''),
(18, '189.239.135.81', '', '$2y$08$bTnCSYmdnB5lEoWpkhsczuhv.zIP90E8.C8JIv9kMyOle12WUcbVy', NULL, 'pavodown@outlook.com', '', NULL, NULL, NULL, NULL, 1570733951, 1572464159, 1, 'Gabriela', 'Mendoza', 'Gonzalez', NULL, NULL, '5519262858', '', '', ''),
(19, '187.193.79.157', '', '$2y$08$yIUutBDeplLpBJB5y.SCYu6GqtdxdBxGW2f9GQGUO6rRfCtPweWyK', NULL, 'kirimankato@hotmail.com', '', NULL, NULL, NULL, NULL, 1571010607, 1571010634, 1, 'Esteban', 'Castellanos', 'Rodríguez', NULL, NULL, '4424791936', '', '', ''),
(20, '189.158.48.208', '', '$2y$08$7bKEj1i2WAchsExqVCwXlOGVY6D8bT6tfcWXkFvXlzQQpiX8dNZ/y', NULL, 'a01570855@itesm.mx', '', NULL, NULL, NULL, NULL, 1571031840, 1571031856, 1, 'Fernanda', 'Reyes', 'Sánchez', NULL, NULL, '8184718237', '', '', ''),
(21, '189.172.198.142', '', '$2y$08$IAAA1/VLbF2kyf/TF7oEz.0bMLs7faQ6zfjlyV3zcQtuMaCmjQv/K', NULL, 'joraldia@gmail.com', '', NULL, NULL, NULL, NULL, 1571365266, 1571365285, 1, 'Jorge Alberto ', 'Albor ', 'Díaz ', NULL, NULL, '9992153371', '', '', ''),
(22, '189.216.97.243', '', '$2y$08$OtmE2zjv2vR6JUlBW9QJfe6cFCXNHK2K8MnMPPlxIUIhpON8YdwEe', NULL, 'cesar@technest.mx', '', NULL, NULL, NULL, NULL, 1571852161, NULL, 1, 'Ricardo', 'Perez ', 'Hernandez', NULL, NULL, '5542136859', '', '', ''),
(23, '189.172.169.252', '', '$2y$08$qqZqTKDwvhmAoE5zi3.4dukGQ.EyQAodWvqUdKURtqmiSrNQhKQfy', NULL, 'mquittnerm@gmail.com', '', NULL, NULL, NULL, NULL, 1571880925, 1571924676, 1, 'María del Carmen ', 'Quittner', 'Mimenza', NULL, NULL, '9992428892', '', '', ''),
(24, '177.247.87.232', '', '$2y$08$5RqnumVM/94JTiUoEwCnwu8VhEv.L7JV47lhGnVasCPlw3cpeO2W6', NULL, 'shariffbeyruti@gmail.com', '', NULL, NULL, NULL, NULL, 1571934903, 1571934949, 1, 'Shariff', 'Fernandez', 'Beyruti', NULL, NULL, '2299011329', '', '', ''),
(25, '189.240.106.237', '', '$2y$08$0ch8CmV9AIbPpK5gOhRFEOHsuGD9CuwH8wNi/3Efk2U/eOkMe3QK2', NULL, 'isaac.angelsnest@gmail.com', '', NULL, NULL, NULL, NULL, 1571952511, NULL, 1, 'Isaac', 'Alberto', 'm', NULL, NULL, '5583925097', '', '', ''),
(26, '189.240.106.237', '', '$2y$08$9u7FBE/oRYTsC8eXJ8AusOlM/vP8dgAfVYXYIsDujusK/uM4YJQw2', NULL, 'esmeralda.angelsnest@gmail.com', '', NULL, NULL, NULL, NULL, 1571960672, 1572020752, 1, 'ESMERALDA', 'ISLAS', 'MECHU', NULL, NULL, '5521288503', '', '', ''),
(27, '189.240.106.237', '', '$2y$08$TKLHvmwgp6kQtVdwgo3uLe/hwW6C9F8yqI7wK1mnhT0fI6JN/tVx6', NULL, 'enya94cancun@gmail.com', '', NULL, NULL, NULL, NULL, 1572035018, 1572035066, 1, 'Enya', 'Cardenas', 'Chi', NULL, NULL, '5560278843', '', '', ''),
(28, '201.175.133.191', '', '$2y$08$QnP7M1fKsNfSv2tjqzvSP.4AAwpQOgDWLNPmkhNfAYFT9pKayeXPi', NULL, 'dennalcc@gmail.com', '', NULL, NULL, NULL, NULL, 1572035403, 1572036196, 1, 'Denisse', 'Alcántara ', 'Caba', NULL, NULL, '5565767469', '', '', ''),
(29, '189.240.106.237', '', '$2y$08$g6LhIPDomWNrMYQHXSshAu/kcwxWraMRf7m0w21HgakgmdkLHJyBW', NULL, 'abitaop94@hotmail.com', '', NULL, NULL, NULL, NULL, 1572035513, 1572035535, 1, 'Abigail', 'Olmedo', 'Pérez ', NULL, NULL, '5561468633', '', '', ''),
(30, '189.240.106.237', '', '$2y$08$R7iCVDSQitIO1po3WKdAHeSclPWMyOREqo5BhznvH.JIa2irzYjWi', NULL, 'islashesme@gmail.com', '', NULL, NULL, NULL, NULL, 1572035776, 1572035826, 1, 'Esme', 'Islas', 'Hernández', NULL, NULL, '5530391626', '', '', ''),
(31, '189.240.106.237', '', '$2y$08$LwMg5VdfBMZFYkckVsXv4e57H5pt7HI/zUe.sdVTm9tn1YrIv4bsW', NULL, 'paulina.angelsnest@gmail.com', '', NULL, NULL, NULL, NULL, 1572035783, NULL, 1, 'Paulina', 'Hernandez', 'Tovar', NULL, NULL, '5516905170', '', '', ''),
(32, '189.240.106.237', '', '$2y$08$qnjoHvq2IjbawCD/44cW7OpPEh5By0.fNont.nunMZr1FBPHM6I1G', NULL, 'paulinatovar13@outlook.com', '', NULL, NULL, NULL, NULL, 1572036023, NULL, 1, 'Paulina', 'Hernandez', 'Tovar', NULL, NULL, '5516905170', '', '', ''),
(33, '201.160.143.193', '', '$2y$08$p6.gWGUGeJp7qIsmMj8MeegMqjJCDUkwbfD7a/NIcS4CQJLsS5vp2', NULL, 'archen01@gmail.com', '', NULL, NULL, NULL, NULL, 1572066325, 1572066358, 1, 'Pedro', 'Zúñiga', 'Quintal', NULL, NULL, '019991356218', '', '', ''),
(34, '189.153.221.32', '', '$2y$08$/k9ZUaE0a6saRL1tVoYtqONFfBqEjwvjYWV64BfSo0eB/cd/O4k7K', NULL, 'fernandareyessanchez.2002@gmail.com', '', NULL, NULL, NULL, NULL, 1572129245, 1572129249, 1, 'Fernanda', 'Reyes', 'Sánchez', NULL, NULL, '8184718237', '', '', ''),
(35, '189.217.97.79', '', '$2y$08$7gIJj9ly21EqOYK5hXs21e/QzDuHiB9Cx9wrJOQ85AKv8oXQT7use', NULL, 'alejandro@techstem.com.mx', '', NULL, NULL, NULL, NULL, 1572301818, 1572414408, 1, 'Alejandro David', 'Crespo', 'López', NULL, NULL, '5533358671', '', '', ''),
(36, '189.216.98.40', '', '$2y$08$oo7tALWNlslD0woKD3VAruyAloLR1QbJC3.kCZOPZTWSkbMkv3EGe', NULL, 'nala_159@live.com.mx', '', NULL, NULL, NULL, NULL, 1572366876, 1572367818, 1, 'Jazziel ', 'Nava', 'Hernandez', NULL, NULL, '5568795830', '', '', ''),
(37, '189.216.98.40', '', '$2y$08$JqOH5QNBkXGnj8/brT2swekZt1WhBKZnVWZJ6vc26CP8zcA5WvD7G', NULL, 'aquintero.angelsnest@gmail.com', '', NULL, NULL, NULL, NULL, 1572366985, 1572367014, 1, 'Nalllely ', 'Nava ', 'Rodriguez ', NULL, NULL, '5568795830', '', '', ''),
(38, '189.216.98.40', '', '$2y$08$/gxc8giZ1v5cNcdvJzXKPeG1QUDR8MyQBfZ2qFAw8qQpzenqCbFtm', NULL, 'fgarcia@makerlab.mx', '', NULL, NULL, NULL, NULL, 1572471113, 1572471190, 1, 'Franco ', 'Garcia', '-', NULL, NULL, '5568795830', '', '', ''),
(39, '201.175.134.84', '', '$2y$08$d31tEOmw1lGk41E4JAEYdOxzA7QzeDeiCKFRcgWcuEw19aGHBZLz6', NULL, 'barrysniper@hotmail.com', '', NULL, NULL, NULL, NULL, 1572479403, 1572481989, 1, 'Rubí ', 'Peña', 'Belmán ', NULL, NULL, '5514876483', '', '', ''),
(40, '189.240.106.237', '', '$2y$08$zVv084lC5Qws7BjtnbBRLun3S9mcRZMZTHNPoQPGNuDqugDyg/aYK', NULL, 'ian.angelsnest@gmail.com', '', NULL, NULL, NULL, NULL, 1572483320, 1572483879, 1, 'Ian ', 'Manuel', '', NULL, NULL, '5529183553', '', '', ''),
(41, '189.240.106.237', '', '$2y$08$qgdCUOPbmGNqGamc0QouZu1iSOOhZw7B24m9YLZxAYqI7GtDL8t2.', NULL, 'gabriel.xocz@gmail.com', '', NULL, NULL, NULL, NULL, 1572557025, NULL, 1, 'Gabriel', 'Delgado', 'Ramirez', NULL, NULL, '5510047103', '', '', ''),
(42, '201.167.122.82', '', '$2y$08$mc.x.QwzM4D7noh2WoozxuUBibiMT105aYaynmOMlcBLvJkK/Rjm6', NULL, 'jjjjuanmendoza@hotmail.com', '', NULL, NULL, NULL, NULL, 1572638711, 1572638751, 1, 'JUAN DE DIOS ', 'MENDOZA ', 'BETANCOURT', NULL, NULL, '3411769462', '', '', ''),
(43, '189.172.116.159', '', '$2y$08$Vv3guZ570aSVbKJr.uXPvughsKk/WlNU5RtPIlh9Elfnc6WUPOPDe', NULL, 'tereycobolsas@hotmail.com', '', NULL, NULL, NULL, NULL, 1572715597, 1574271210, 1, 'Teresa', 'Moguel ', 'Baños', NULL, NULL, '9991370441', '', '', ''),
(44, '187.190.191.38', '', '$2y$08$YrBO79iYEk70XU95g0KwBed1iswo5Q58TmxHNoD92zuh9ofJ6h2re', NULL, 'caroaguilar25jh@gmail.com', '', NULL, NULL, NULL, NULL, 1572806456, 1572806460, 1, 'Carolina', 'Aguilar', 'Tuyub', NULL, NULL, '9992758939', '', '', ''),
(45, '189.240.106.237', NULL, '$2y$08$hFJ3bswgPB/DmxKhrw38xuUtUNJQ0wj0Md1RRTvEGVl9Bf8k5Wv.K', NULL, '', '', NULL, NULL, NULL, NULL, 1572888558, 1572888584, 1, NULL, '', '', NULL, NULL, NULL, '', '', ''),
(46, '189.240.106.237', '', '$2y$08$ejY352nE74MMwCa7f/ThAeswPQmbx4l7/GSMurkDxfF.U9bdcYZhW', NULL, 'elnovatodk@gmail.com', '', NULL, NULL, NULL, NULL, 1572899003, 1572899009, 1, 'Marco ', 'Delgado ', 'Garduño', NULL, NULL, '5615037025', '', '', ''),
(47, '177.237.160.59', '', '$2y$08$d7vxhu8LmuGcIpC61/.kouNV12BJAiSk50JVv3JFvUtGt7gFXMbu6', NULL, 'inessita_62@hotmail.com', '', NULL, NULL, NULL, NULL, 1572927715, 1572927725, 1, 'ines', 'reyes', 'oramas', NULL, NULL, '9932764635', '', '', ''),
(48, '189.216.98.40', '', '$2y$08$Uq8VWTrlgZWJEh4A8oZIg.n/5For0eqEJzWtxbTX8dEvsL2TjxlXa', NULL, 'technestmx@gmail.com', '', NULL, NULL, NULL, NULL, 1572983856, 1585766933, 1, 'Yobani', 'Hernández', 'Rivera', NULL, NULL, '5522644304', '', '', ''),
(49, '189.240.106.237', '', '$2y$08$a5VSDJZblwPqCAZKGUGbH.OUiPIrfbEY8AM4Qbd8fNsUTJyFriS9m', NULL, 'sebastian.angelsnest@gmail.com', '', NULL, NULL, NULL, NULL, 1572984341, 1572984358, 1, 'Sebastian', 'Ramírez', 'Reyes', NULL, NULL, '5562917007', '', '', ''),
(50, '189.216.98.40', '', '$2y$08$6qNCaKIEr4IJYaMVMoOrie73x5buPayBY2cYzAxnKqE.rqrqm2gHu', NULL, 'michelle.angelsnest@gmail.com', '', NULL, NULL, NULL, NULL, 1573148248, 1573154288, 1, 'Michelle', 'Ruiz', 'Hernandez', NULL, NULL, '5542136859', '', '', ''),
(51, '189.240.106.237', '', '$2y$08$HJzTzpAlMZWzjIXt9Ltrw./tuv8t6cIFvUAn7H2q4WbrknLbDNcdW', NULL, 'hardroy_28@outlook.com', '', NULL, NULL, NULL, NULL, 1573242501, 1573242534, 1, 'Isaac', 'Alberto', 'Guzmán', NULL, NULL, '5583925097', '', '', ''),
(52, '187.187.229.193', '', '$2y$08$ZRot1/khY0xJkdgA9zIi7Op/GQy6KePo.62GldorlPdA0GjPajuiy', NULL, 'jorgeacamposax@gmail.com', '', NULL, NULL, NULL, NULL, 1573336269, 1573336286, 1, 'Jorge ', 'Campos', 'Canepa', NULL, NULL, '9381209639', '', '', ''),
(53, '187.178.147.28', '', '$2y$08$oj4jnJRViBJzyiRbVo5Z4On6xXz/LOipCrCieFsrFET/NsrmL3yzO', NULL, 'epau25@gmail.com', '', NULL, NULL, NULL, NULL, 1573587566, 1573587580, 1, 'Edgar', 'Paulino', 'Manzano', NULL, NULL, '7221025577', '', '', ''),
(54, '189.217.123.59', '', '$2y$08$8Eay4tlX7etrrjG1bXQKu.Rn4szvFJqYhFIcllTZo.pcklobTFmnC', NULL, 'mmoreno_e@yahoo.com.mx', '', NULL, NULL, NULL, NULL, 1573598177, 1573598193, 1, 'Jesus ', 'Mendez ', 'Moreno ', NULL, NULL, '5510177947', '', '', ''),
(55, '201.175.157.200', '', '$2y$08$BcOQN/v1E1f4tbnZD5Rb/OvhB.ZxChdzfP9QmdjU3QDIGyESpHS/W', NULL, 'moravillegasivanomar@gmail.com', '', NULL, NULL, NULL, NULL, 1573681370, 1573681409, 1, 'Iván Omar', 'Mora', 'Villegas', NULL, NULL, '+524436421982', '', '', ''),
(56, '187.135.202.155', '', '$2y$08$N.e.qbb1G.xCGQ.wZ9kXa.lhdB0WGg3khu6tdk.HWQ3MhALyK8CJq', NULL, 'e.rnesto.a.mor@hotmail.com', '', NULL, NULL, NULL, NULL, 1573756226, 1573756243, 1, 'Ernesto Alonso', 'López', 'de la Cruz', NULL, NULL, '9931072541', '', '', ''),
(57, '177.247.104.132', '', '$2y$08$KXma3qiZiyHFAP2NoayU0.Sw7gzEaOo9PeKkxcFoy2authCPf0sMy', NULL, 'ruthjrios.2015@gmail.com', '', NULL, NULL, NULL, NULL, 1574096809, 1574096814, 1, 'RUTH', 'RIOS', 'JOSE', NULL, NULL, '2224740595', '', '', ''),
(58, '187.189.114.68', '', '$2y$08$SX/vbplyU4KEuJnNp9HqiO/.Xh7R5V0DFLFsrFmLML.CjM5h1zYru', NULL, 'oscreba@gmail.com', '', NULL, NULL, NULL, NULL, 1574124341, 1574124456, 1, 'Oscar', 'Crespo ', 'del Barrio', NULL, NULL, '2299783845', '', '', ''),
(59, '201.156.176.35', '', '$2y$08$PS.FXkGJG/ThpuXnKXk6W.uTFApHEQpTnpwR0OyJUgV6zzdnugtd6', NULL, 'luisalomeli@noosinteligenciacreativa.com', '', NULL, NULL, NULL, NULL, 1574206572, 1574206669, 1, 'María Luisa', 'Lomelí', 'Torres', NULL, NULL, '3331281943', '', '', ''),
(60, '177.245.222.197', '', '$2y$08$M92HF/FfQm8xvhfZc9cDk.K6UpnuGuf0bb9zoqkLUS3302lCyABCO', NULL, 'j.escaliermx@gmail.com', '', NULL, NULL, NULL, NULL, 1574222778, 1574222800, 1, 'Jaime ', 'Escalier ', 'Sandoval', NULL, NULL, '3324040836', '', '', ''),
(61, '189.156.233.243', '', '$2y$08$6Bs47CG2R3USeo7EkCfEB.odzZsxi4GSnUJm7C/9AGSHfNkymsRn6', NULL, 'reneworks25@gmail.com', '', NULL, NULL, NULL, NULL, 1574932636, 1574932646, 1, 'Rene ', 'Luna', 'Villaseñor', NULL, NULL, '8443901710', '', '', ''),
(62, '177.70.193.44', '', '$2y$08$m.v3/k/295vVjE2YLMS/WO9qCYgnGuZmJgACtsWuEmpzcWbwqP.tO', NULL, 'peterrichard7414@gmail.com', '', NULL, NULL, NULL, NULL, 1575118938, NULL, 1, 'yxDQpXVILkvl', 'RrKbjqlSNYkg', 'tCphHEOfacgMZASD', NULL, NULL, '4786374795', '', '', ''),
(63, '177.247.74.167', '', '$2y$08$15GIpvU.J01j87nlB.K9/.08j7ee4Tvu2ZiJLKT3PE1E9ZisLvaAO', NULL, 'bedaitzel@gmail.com', '', NULL, NULL, NULL, NULL, 1575143188, 1575324822, 1, 'beda ', 'Pérez ', 'Pérez ', NULL, NULL, '2295265379', '', '', ''),
(64, '189.176.167.228', '', '$2y$08$xHM7z/w3ogAfITiXfTen0ehjyBs9jLPakffhYfYFHM2n.1e3V1vYi', NULL, 'canetcampeones@gmail.com', '', NULL, NULL, NULL, NULL, 1575647029, 1575647940, 1, 'JOSE LUIS', 'CAMARGO', 'CISNEROS', NULL, NULL, '9811050415', '', '', ''),
(65, '189.240.106.237', '', '$2y$08$4OTZm7cYO82hpJyO9/3TdudcyTaTVuFsjY2Ldg8kC6HawdgK43RJi', NULL, 'jaguez98@hotmail.com', '', NULL, NULL, NULL, NULL, 1575667016, NULL, 1, 'Jared', 'Rodríguez', 'Mendiola', NULL, NULL, '5574631209', '', '', ''),
(66, '189.240.106.237', '', '$2y$08$C3IE66svGVpyHWcXOe3czuc8JvpNw5nt2SViSt1FeWVAeDiA/N.Fi', NULL, 'ramrom35@hotmail.com', '', NULL, NULL, NULL, NULL, 1575667357, 1577994254, 1, 'Ramiro', 'Gutiérrez ', 'Zepeda', NULL, NULL, '5514972688', '', '', ''),
(67, '177.249.43.27', '', '$2y$08$fVuAM4xYUnNYKux609SRdOUyrMtn4unMYC5fE4gB95EI5G6LuJSRm', NULL, 'oscarneri1710@gmail.com', '', NULL, NULL, NULL, NULL, 1575667821, 1575667872, 1, 'Oscar Rodrigo', 'Neri', 'Pérez', NULL, NULL, '3314743161', '', '', ''),
(68, '189.172.88.142', '', '$2y$08$G7VUSKei1NRBvlM1TKa6heMioK8h1PcqvJ0jZuzoTaYD8.EMG/0Ce', NULL, 'live.290@hotmail.com', '', NULL, NULL, NULL, NULL, 1576082746, 1576084343, 1, 'Virgilio', 'Meléndez', 'Rodríguez', NULL, NULL, '9622036888', '', '', ''),
(69, '187.190.191.20', '', '$2y$08$f8geyzeLUubdAaUhjVDtF.7/AFykSbFbC3zwbYSTVFFxa5ONamtRa', NULL, 'japmontufar@gmail.com', '', NULL, NULL, NULL, NULL, 1576091016, 1576091036, 1, 'José Alberto', 'Pineda', 'Montufar', NULL, NULL, '9811037931', '', '', ''),
(70, '189.186.11.29', '', '$2y$08$ehAB0SlcP4PUSlrJPPiRGujSe5.zBUkc025UhMSRuQsQ4c53QBG3y', NULL, 'lpmsj1@gmail.com', '', NULL, NULL, NULL, NULL, 1576602876, 1576602894, 1, 'Hesron Obed ', 'Felix', 'Ontiveros', NULL, NULL, '6672944270', '', '', ''),
(71, '187.134.11.97', '', '$2y$08$epQnsLUxn.hboc3M27NDCuAPjEobzYVSSo7tRqZ0qcLosl0WVWlXC', NULL, 'ivan_dnop@outlook.com', '', NULL, NULL, NULL, NULL, 1576603229, 1576603234, 1, 'Francisco Javier ', 'Rojas ', 'Pegueros ', NULL, NULL, '461 2775000', '', '', ''),
(72, '201.141.237.123', '', '$2y$08$nTR.7tBcUgXexVd6cTlWUOKKQV3dTPIv0CqUzOJBL1CoP8pe0L4FG', NULL, 'bio.ekaton@gmail.com', '', NULL, NULL, NULL, NULL, 1576865150, 1576865174, 1, 'José Manuel', 'Avila', 'Peña Vera ', NULL, NULL, '5545167717', '', '', ''),
(73, '189.214.4.67', '', '$2y$08$3QAHNoKwGUJ7f5jAKCXOb.jSRjccYtLOnrXBOt6h6J0eNTX4YtCi2', NULL, 'abdala_carlos@hotmail.com', '', NULL, NULL, NULL, NULL, 1578937425, 1578937452, 1, 'Carlos', 'Rosales', 'Abdala', NULL, NULL, '9212462529', '', '', ''),
(74, '201.159.104.38', '', '$2y$08$3ggfhEQpjdULKuFM2mMIX.NSI5n5ruk1KEUe0/vb38V7t.K97min.', NULL, 'saygutentag_21@hotmail.com', '', NULL, NULL, NULL, NULL, 1579200690, 1579200739, 1, 'Diana Valentina', 'Uribe', 'Carranza', NULL, NULL, '8441544246', '', '', ''),
(75, '189.214.1.25', '', '$2y$08$0p2h6HaUlkVwkAHbNnYkHurz/W9iTBfRSvp99/s2i3hjoHmJiFaVe', NULL, 'elitex000@gmail.com', '', NULL, NULL, NULL, NULL, 1579387829, 1579387851, 1, 'José Daniel', 'Gutierrez', 'Gutierrez', NULL, NULL, '9991912042', '', '', ''),
(76, '189.222.193.196', '', '$2y$08$JUFcpdl88w4aomw46Jc2iuX9u9FsoOvV7jZRpIMrZDUqfJ8JDV1dS', NULL, 'fco.mojica.m@gmail.com', '', NULL, NULL, NULL, NULL, 1582150205, 1582150226, 1, 'Francisco David ', 'Marquez ', 'Mojica', NULL, NULL, '6462380343', '', '', ''),
(77, '177.239.21.131', '', '$2y$08$a4dUbEQPUeydNO6tqpymCeiRffave2J.iHv1st2.wLBygvLyQDmxG', NULL, 'trajetshorsroute07@hotmail.com', '', NULL, NULL, NULL, NULL, 1584832591, 1584832600, 1, 'Jesus Alejandro', 'dueñez', 'martinez', NULL, NULL, '6864221723', '', '', ''),
(78, '189.203.45.215', '', '$2y$08$bCinmuKgRLKh89T6MAR0CeEII2x4otZoBxkj9UhONQmcvxU0upB6a', NULL, 'eliaschalitaoficial@hotmail.com', '', NULL, NULL, NULL, NULL, 1585270728, 1585510961, 1, 'Elias', 'Chalita', 'Nuñez', NULL, NULL, '5530728507', '', '', ''),
(79, '192.141.244.183', '', '$2y$08$kH2UEFBaDbiHfWwBR7PoMOULzdPfOcDn0URwtHVWrnbxrlD4cfSom', NULL, 'garcia.casi1995@gmail.com', '', NULL, NULL, NULL, NULL, 1585616041, NULL, 1, 'Yeraldi Yazmin', 'Garcia ', 'Casimiro', NULL, NULL, '7775996717', '', '', ''),
(80, '201.141.86.198', '', '$2y$08$g2swwRINquhQD9dEUfssAuAI0G0yqcqu4AZRfCe/7dSRTFQLUPMKu', NULL, 'eduardo.chan.alejandre@hotmail.com', '', NULL, NULL, NULL, NULL, 1585631850, 1585631853, 1, 'Eduardo Alberto', 'Chan', 'Alejandre', NULL, NULL, '5514116939', '', '', ''),
(81, '187.189.176.145', '', '$2y$08$2b3CU9yL6IbRqVzA71qLQOmZewvk1gtQR.rzqaDvh5fDZAdMJAxF.', NULL, 'uhg@empaquesconfiables.com', '', NULL, NULL, NULL, NULL, 1586032806, 1586032828, 1, 'Francisco Ulises', 'Hernández ', 'García', NULL, NULL, '8116115173', '', '', ''),
(82, '177.232.84.189', '', '$2y$08$9DEQFSaJEycIYc8cPIZneu0EzsAPrNzdxanoS1iGazGKkda4oiWZ2', NULL, 'patricia.vazmor@gmail.com', '', NULL, NULL, NULL, NULL, 1586164583, 1586164590, 1, 'PerlaPatricia', 'Vázquez ', 'Mora', NULL, NULL, '4428750738', '', '', ''),
(83, '201.141.173.58', '', '$2y$08$4bGBjhzd6jM9myPraadWJ.lfwxPjyapbX.O.sWPTq9CwLsAp1WnVq', NULL, 'ileydana@hotmail.com', '', NULL, NULL, NULL, NULL, 1586919649, 1586919694, 1, 'Anadyeli', 'vazquez', 'candido', NULL, NULL, '5551968173', '', '', ''),
(84, '187.190.188.90', '', '$2y$08$KV54wk9v5j1AQxGfzEpd/eSTuvI5UWVRFPynSaX2qfR9Ke5cgp2x.', NULL, 'car_iv@hotmail.com', '', NULL, NULL, NULL, NULL, 1587009139, 1587009151, 1, 'Carlos Ivan', 'Castelan ', 'Ramon', NULL, NULL, '7772985199', '', '', ''),
(85, '201.106.107.197', '', '$2y$08$67Y/w5uIoi0uxjFLZwE9W.dZxMbpNSBsjsdkDYYc7SLJ3rS/.7jxy', NULL, 'admin@giner.company', '', NULL, NULL, NULL, NULL, 1587173745, 1587173766, 1, 'Alejandro', 'Flores', 'Arias', NULL, NULL, '7223503098', '', '', ''),
(86, '1.163.161.221', '', '$2y$08$BhQaK19ZFVlPzh9mxqqlm.Sx88l.URVIuZRvqJlPE3WCOtKxL6qey', NULL, 'robertwhite6303@gmail.com', '', NULL, NULL, NULL, NULL, 1587533743, NULL, 1, 'xeswbQhkH', 'FKERvBNdYTMg', 'BKUPjHeEhzX', NULL, NULL, '5959337983', '', '', ''),
(87, '200.68.138.36', '', '$2y$08$QTiJg2mcrhZE4LrUDPYuDOySULCFyM8XnKTJAZVWX989y1b6zjEP2', NULL, 'sofia.bojorjes@iec-jb.com.mx', '', NULL, NULL, NULL, NULL, 1587837904, 1587837911, 1, 'SOFIA', 'BOJORJES ', 'CUEVAS', NULL, NULL, '3310201544', '', '', ''),
(88, '189.150.165.213', '', '$2y$08$Jy64bglejTh2tR6NOMDPAOH9KMUBpmjeaf8MHn/wchepnmy1QzvkO', NULL, 'noemicirerol@hotmail.com', '', NULL, NULL, NULL, NULL, 1587919978, 1587919989, 1, 'ELVIA NOEMY', 'CIREROL ', 'MUÑOZ', NULL, NULL, '9932597965', '', '', ''),
(89, '187.169.253.178', '', '$2y$08$D.hwOFUt5QTkFxCpTpDtMuBm6i6c8fP7VzO/0ZrRy8DioNJiNvYJO', NULL, 'psicoarteycafe@gmail.com', '', NULL, NULL, NULL, NULL, 1588276552, 1588276645, 1, 'Nallely', 'Rodríguez', 'Barrios', NULL, NULL, '5564765174', '', '', ''),
(90, '189.179.241.147', '', '$2y$08$v3rCmNrGMhPQ1Y9osK8RauTaRfsVS8zaD3.BwZPmTPVqt9UnEqSqm', NULL, 'bmontes177@gmail.com', '', NULL, NULL, NULL, NULL, 1589230638, 1589230654, 1, 'brayan', 'montes', 'garcia', NULL, NULL, '8771642690', '', '', ''),
(91, '187.159.90.157', '', '$2y$08$AUfmePTSSIFSkIFGxTkHx.td4vAyA5zhW/LPld5DZm10lSV8gFCVW', NULL, 'ule1997frv@gmail.com', '', NULL, NULL, NULL, NULL, 1589618360, 1589618375, 1, 'Edgar Ulises ', 'Marroquin', 'Tienda', NULL, NULL, '7755936685', '', '', ''),
(92, '187.190.160.250', '', '$2y$08$v.GcqTmrxGobgQ6odE89me.ySG.2UwNCpHlz4TnSW2tjXhABss0i6', NULL, 'laelenamol@hotmail.com', '', NULL, NULL, NULL, NULL, 1589815900, 1589815922, 1, 'Elena', 'Molina', 'Alvarado', NULL, NULL, '4611719735', '', '', ''),
(93, '177.241.42.208', '', '$2y$08$moUex1MOJZgwl8sQD4ukreJrGAI/6I.1ni3UaPw/y80hxUATmw80C', NULL, 'presidenciapnm@gmail.com', '', NULL, NULL, NULL, NULL, 1590074709, 1590074717, 1, 'esthela', 'osuna', 'magaña', NULL, NULL, '3318209271', '', '', ''),
(94, '189.163.235.75', '', '$2y$08$QGyGccE68ZKkBLTrXCHki.F/j4JkrucizfzWY1Y8j9YuxPBgjVAnC', NULL, 'luisvazquezm0@gmail.com', '', NULL, NULL, NULL, NULL, 1591141946, 1591288107, 1, 'Luis', 'Vázquez', 'Manzano ', NULL, NULL, '3336679411', '', '', ''),
(95, '201.137.124.77', '', '$2y$08$nGrR2q7SLwWMu3UyUyAJw.Y3UR/fJtRMdD61Pi3y6f9/EIRHqEWym', NULL, 'christian@caleidomedia.com', '', NULL, NULL, NULL, NULL, 1591149632, 1591149638, 1, 'Christian', 'Suarez', 'Bermeo', NULL, NULL, '5533805846', '', '', ''),
(96, '187.154.31.4', '', '$2y$08$1GdgVhaR4iNO08/r/gX2Ouxa9Lg5cpKTLHtaUl1Zrb8gH0JYLlPqu', NULL, 'elisur_bl92@hotmail.com', '', NULL, NULL, NULL, NULL, 1591197036, 1591197553, 1, 'ELISUR', 'BARTOLO', 'LOPEZ', NULL, NULL, '9511144951', '', '', ''),
(97, '201.108.87.164', '', '$2y$08$ZAkNqbKYWkhZCHr.SkRP/uEDt6CLUv2Jq/ggt5Z7UyKx/GKWgH1Di', NULL, 'allisonsegurag@gmail.com', '', NULL, NULL, NULL, NULL, 1591567373, 1591587643, 1, 'Allison', 'Segura', 'Galán ', NULL, NULL, '2331150038', '', '', ''),
(98, '187.188.9.145', '', '$2y$08$N46minzfyb1uLP1sJ.kLqujsg6.C/C6C14fIOjWrhdAl.Mw1xg/8i', NULL, 'alejandra.garcia@fondounido.org.mx', '', NULL, NULL, NULL, NULL, 1591816382, 1591816391, 1, 'Fondo', 'Unido', 'México', NULL, NULL, '5561116191', '', '', ''),
(99, '187.145.28.6', '', '$2y$08$jFTAvYyvp9VSU/rHgitEluQy/WDzosYNMSoL5eQW4CcUe/lDh/8ei', NULL, 'israelpons@me.com', '', NULL, NULL, NULL, NULL, 1592239174, 1592617835, 1, 'Israel', 'Pons', 'Alvarez', NULL, NULL, '+525545683300', '', '', ''),
(100, '189.216.65.77', '', '$2y$08$rO04Cq76rZQIcs0m3WS67eQutPq6s2ooUWDtQTxXnx72RTE0hgu1e', NULL, '19084027@alumnos.icel.edu.mx', '', NULL, NULL, NULL, NULL, 1592247303, 1594669763, 1, 'Alan', 'Nava', 'Quintero', NULL, NULL, '5568795830', '', '', ''),
(101, '187.189.163.71', '', '$2y$08$XBPHaL2aZTalxm0974B/VeSUk5LlMSfBbvKmpJv.hoFJYm3Mkluia', NULL, 'miguelrato.di@hotmail.com', '', NULL, NULL, NULL, NULL, 1592352389, 1592352395, 1, 'Miguel Angel', 'Ramon', 'Torrescano', NULL, NULL, '4424675759', '', '', ''),
(102, '189.212.199.127', '', '$2y$08$Xjo9wWfUXj/qYAWcibcEquLc19dqtCfcXBt6mjCTPV.asziAi4Ova', NULL, 'arturo@angelsnest.lat', '', NULL, NULL, NULL, NULL, 1592429131, 1592844729, 1, 'Arturo', 'Pérez', 'Espinosa', NULL, NULL, '5517981920', '', '', ''),
(103, '177.241.32.184', '', '$2y$08$UKPGUvd4s2JDBAnihSEOLOIE4nnSgR7CMTIReLZEkHLtM5okQUwKC', NULL, 'registrosbeekon@gmail.com', '', NULL, NULL, NULL, NULL, 1592431977, 1592431992, 1, 'Francisco Javier', 'Villalobos', 'García', NULL, NULL, '3310535112', '', '', ''),
(104, '189.237.228.53', '', '$2y$08$Le7qOo/qj2W0a98Af3/yQe5AKlUOMYw8A0B6JV/mimjyoTevzKbWq', NULL, 'cesareomargtz@gmail.com', '', NULL, NULL, NULL, NULL, 1592519678, 1592849463, 1, 'Cesar', 'Omar', 'Gutierrez', NULL, NULL, '6251463317', '', '', ''),
(105, '187.145.27.77', '', '$2y$08$wwM0kZCVxOErzAegQCKur.ftcECvZD4Me/tmjndL1uzeKZ.86TGui', NULL, 'israelpons@gmail.com', '', NULL, NULL, NULL, NULL, 1592618767, 1592618773, 1, 'María Luz ', 'Alvarez ', 'Olguín ', NULL, NULL, '5545683300', '', '', ''),
(106, '177.225.133.45', '', '$2y$08$XeIPFf0dhp73nZ7//y/PgOYvYUL36kIdeiH4tMROpIHVzdF1n2jjK', NULL, 'taragray13@me.com', '', NULL, NULL, NULL, NULL, 1592958948, 1592958968, 1, 'Tara', 'victoria', 'gray', NULL, NULL, '5545683300', '', '', ''),
(107, '189.212.199.127', '', '$2y$08$RIkfGl8bkTv4gt/QzFKsxOnMY/B/QLOnfHacyQ2ya.O7vHKTbSJby', NULL, 'arturo.angelsnest@gmail.com', '', NULL, NULL, NULL, NULL, 1593039082, 1593039086, 1, 'Angel', 'Pérez', '', NULL, NULL, '+525570983736', '', '', ''),
(108, '201.175.159.49', '', '$2y$08$/W94OZgcdR570KcWUO459OyExzZY6UDniuNeGq4oThxwzWPqEZ7F2', NULL, 'ammurillolopez@gmail.com', '', NULL, NULL, NULL, NULL, 1593914077, 1593914096, 1, 'andres manuel', 'murillo', 'lopez', NULL, NULL, '3221220163', '', '', ''),
(109, '189.177.18.60', '', '$2y$08$v6GbydgspSnImnpKn57GGeqUXKYUbo0Fp2hjRqw6M2sJmwOgAi2he', NULL, 'enrique_jadi@hotmail.com', '', NULL, NULL, NULL, NULL, 1594223747, 1594223779, 1, 'JESUS ENRIQUE', 'NAVARRO', 'GOMEZ', NULL, NULL, '3222291487', '', '', ''),
(110, '189.232.55.248', '', '$2y$08$V82OU1vkLEqvMjqGEZ1q6urMlhN52oZPTg5vo/U1tGX68mm9qaPIC', NULL, 'gramon@hachiloyalty.com', '', NULL, NULL, NULL, NULL, 1594319327, 1594320067, 1, 'Gustavo', 'Ramón', 'Beltrán', NULL, NULL, '5552144511', '', '', ''),
(111, '201.141.203.142', '', '$2y$08$1ezCc5BnmKsyoMhouSI.1.eoFyTZCb/82hw7m5.FCMGV8H0tOBkBe', NULL, 'andresaguirre91@yahoo.com', '', NULL, NULL, NULL, NULL, 1594929856, 1594929865, 1, 'Andrés', 'Aguirre Aldeco', 'Aguirre Aldeco', NULL, NULL, '5558665720', '', '', ''),
(112, '189.188.232.158', '', '$2y$08$pu8owoZkaZyh8R/NSLlzC.mkrTNZMEdsh.53rwzV4OzPCd8wotfXq', NULL, 'contacto@imexc.org', '', NULL, NULL, NULL, NULL, 1595187724, 1595315962, 1, 'Luis Enrique', 'Vasquez', 'Pillado', NULL, NULL, '5578622517', '', '', ''),
(113, '177.249.41.121', '', '$2y$08$fP6bgio8.6wtoPG90e8DXOjykkQUvScpKJi0RMDIxASo.Wh/XPZea', NULL, 'jorge_mr50@hotmail.com', '', NULL, NULL, NULL, NULL, 1595947509, 1595947515, 1, 'Jorge Abraham', 'Morales', 'Romo', NULL, NULL, '3321109791', '', '', ''),
(114, '200.194.32.149', '', '$2y$08$/Omn.DKQjvblvHKwcdFcVOI2CJteEoQWbc5GtNGiavuUMaPLPHGLu', NULL, 'imeandie@gmail.com', '', NULL, NULL, NULL, NULL, 1596042259, 1596042267, 1, 'IMELDA', 'GARZA', 'TUÑON', NULL, NULL, '5616259329', '', '', ''),
(115, '189.203.179.212', '', '$2y$08$8IRMcE/sDz2NcQkj/2FpruvUHCm09dJUWgnC6pFiFhHmSNtBdFYpC', NULL, 'emprendedores@calpulli.mx', '', NULL, NULL, NULL, NULL, 1596514752, 1596514762, 1, 'Jonathan', 'Canales', 'Garcia', NULL, NULL, '7713812235', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `paterno` varchar(256) DEFAULT NULL,
  `materno` varchar(256) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `paterno`, `materno`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'member', '$2y$08$kkqUE2hrqAJtg.pPnAhvL.1iE7LIujK5LZ61arONLpaBBWh/ek61G', NULL, 'member@member.com', NULL, NULL, NULL, NULL, 1451903855, 1451905011, 1, 'Member', NULL, NULL, 'One', NULL, NULL),
(2, '::1', 'yobani', '$2y$08$rmCPissLyX41FhCES.2e7eZ/GL3a1Mtd9GylxxvzRdy6kLwjLvaze', NULL, 'yobani@technest.mx', NULL, NULL, NULL, NULL, 1569776847, 1569778485, 1, 'yobani', NULL, NULL, 'hernández', NULL, NULL),
(3, '189.216.98.40', 'Leovigildo ', '$2y$08$OTs2gHl17RGqrCHBSdCLiuOY/jkLdcXPngTvce.UdE1NPlAuw8ege', NULL, 'eduardosanchezmx@yahoo.mx', NULL, NULL, NULL, NULL, 1570722828, NULL, 1, 'Leovigildo ', NULL, NULL, 'Sanchez', NULL, NULL),
(4, '189.216.98.40', 'Mario', '$2y$08$6RrVd50QvuK4AKFxkier1O5M3rkysYZMJRwZ1Vgk/TSaU2QH.zuz.', NULL, 'israel@soldai.com', NULL, NULL, NULL, NULL, 1570722896, NULL, 1, 'Mario ', NULL, NULL, 'Campos', NULL, NULL),
(5, '189.216.98.40', 'Jose', '$2y$08$touK3Ncc6vbNJUaEJH8HBuHnaP1f3FFcxtIB.lkszQlh/VNtXew.G', NULL, 'jmhg12000@yahoo.com.mx', NULL, NULL, NULL, NULL, 1570722962, NULL, 1, 'Jose', NULL, NULL, 'Higareda ', NULL, NULL),
(6, '189.216.98.40', 'Ricardo', '$2y$08$LYWyuBKjAQVIyvOVETVEpOv3wuwYHuU2x7WdGEx2OzKMqp3mjIf0S', NULL, 'rugalde@sunik.com.mx', NULL, NULL, NULL, NULL, 1570723064, NULL, 1, 'Ricardo', NULL, NULL, 'Patiño', NULL, NULL),
(7, '189.216.98.40', 'Roberto', '$2y$08$cy9.MNmuxf9msGzWaHChMun76kK/cc5IBi0bZ1LcnGVPemdhJa8OO', NULL, 'rponce.wayak@gmail.com', NULL, NULL, NULL, NULL, 1570723124, NULL, 1, 'Roberto ', NULL, NULL, 'DIaz', NULL, NULL),
(8, '189.216.98.40', 'Jose_Antonio', '$2y$08$QOc4KJ.LwxFKwL1I9ifSue/ut3MA809f0WA2LBW8Wu2eOyMPZqNxG', NULL, 'tony.silveira@inquire.mx', NULL, NULL, NULL, NULL, 1570723215, NULL, 1, 'Jose', NULL, NULL, 'Silveira', NULL, NULL),
(9, '189.216.98.40', 'Joaquín', '$2y$08$/lUNqLsXBRErwqLdheBweuISu6Kp32qyCnNAI8zPpLvd.eRxz1A2u', NULL, 'jemoralesv62@gmail.com', NULL, NULL, NULL, NULL, 1570723291, NULL, 1, 'Joaquín', NULL, NULL, 'Elías Morales', NULL, NULL),
(10, '189.216.98.40', 'Edgard', '$2y$08$d0GGYfwVnPr5e7Wle97Vie9bmIWe1CtzKc.PcHr9V.EcNxivfTfve', NULL, 'edgard@npointgroup.com', NULL, NULL, NULL, NULL, 1570723342, NULL, 1, 'Edgard', NULL, NULL, 'Cambranis', NULL, NULL),
(11, '189.216.98.40', 'Israel_imán', '$2y$08$av4oLPcNk6kIDpQ5dVKNGOmTiiCIR8fB3i5fHPr3y6Ako6pD0RLEK', NULL, 'lic.imanb@gmail.com', NULL, NULL, NULL, NULL, 1570723390, NULL, 1, 'Israel', NULL, NULL, ' Imán', NULL, NULL),
(12, '189.216.98.40', 'lel', '$2y$08$R2/qDK9VOH142.nlDkFDp.UwA378E0toCU3Oe7Yf/uzD380f4Rmnq', NULL, 'ph10.omar10@gmail.com', NULL, NULL, NULL, NULL, 1570723949, NULL, 1, 'lsl', NULL, NULL, 'ell', NULL, NULL),
(13, '189.216.98.40', 'lele', '$2y$08$HFthMex6ZTWaak3YG9Xcm.4xl44TknRNwwSWtGUtKl5LmVXWFoDCy', NULL, 'ph10.omar10@gmail.co', NULL, NULL, NULL, NULL, 1570724225, NULL, 1, 'lel', NULL, NULL, 'lel', NULL, NULL),
(14, '189.216.98.40', 'Franco', '$2y$08$SbaiDXzlqVUKAiZXRNEZ6uecBNm4PBgplduH2/m9tdqd2Iy77b.Pm', NULL, 'fgarcia@makerlab.mx', NULL, NULL, NULL, NULL, 1572470573, NULL, 1, 'Franco ', NULL, NULL, 'Garcia', NULL, NULL),
(15, '189.240.106.237', 'informaticacdmm@gmail.com', '$2y$08$oScAhg5EBlJomgeXuSMjreS7YPrZmbFcvVHPUAlJELTIaWqtY0WTW', NULL, 'informaticacdmm@gmail.com', NULL, NULL, NULL, NULL, 1572889443, NULL, 1, 'Alan ', NULL, NULL, 'Quintero ', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 0, 1),
(4, 0, 1),
(5, 1, 1),
(6, 2, 1),
(7, 3, 1),
(8, 4, 1),
(9, 5, 1),
(10, 6, 1),
(11, 7, 1),
(12, 3, 2),
(13, 4, 2),
(14, 5, 2),
(15, 6, 2),
(16, 7, 2),
(17, 8, 2),
(18, 9, 2),
(19, 10, 2),
(20, 11, 2),
(21, 12, 2),
(22, 13, 2),
(23, 18, 1),
(24, 19, 1),
(25, 20, 1),
(26, 21, 1),
(27, 22, 1),
(28, 23, 1),
(29, 24, 1),
(30, 25, 1),
(31, 26, 1),
(32, 27, 1),
(33, 28, 1),
(34, 29, 1),
(35, 30, 1),
(36, 31, 1),
(37, 32, 1),
(38, 33, 1),
(39, 34, 1),
(40, 35, 1),
(41, 36, 1),
(42, 37, 1),
(43, 14, 2),
(44, 38, 1),
(45, 39, 1),
(46, 40, 1),
(47, 41, 1),
(48, 42, 1),
(49, 43, 1),
(50, 44, 1),
(52, 15, 3),
(53, 46, 1),
(54, 47, 1),
(55, 48, 1),
(56, 49, 1),
(57, 50, 1),
(58, 51, 1),
(59, 52, 1),
(60, 53, 1),
(61, 54, 1),
(62, 55, 1),
(63, 56, 1),
(64, 57, 1),
(65, 58, 1),
(66, 59, 1),
(67, 60, 1),
(68, 61, 1),
(69, 62, 1),
(70, 63, 1),
(71, 64, 1),
(72, 65, 1),
(73, 66, 1),
(74, 67, 1),
(75, 68, 1),
(76, 69, 1),
(77, 70, 1),
(78, 71, 1),
(79, 72, 1),
(80, 73, 1),
(81, 74, 1),
(82, 75, 1),
(83, 76, 1),
(84, 77, 1),
(85, 78, 1),
(86, 79, 1),
(87, 80, 1),
(88, 81, 1),
(89, 82, 1),
(90, 83, 1),
(91, 84, 1),
(92, 85, 1),
(93, 86, 1),
(94, 87, 1),
(95, 88, 1),
(96, 89, 1),
(97, 90, 1),
(98, 91, 1),
(99, 92, 1),
(100, 93, 1),
(101, 94, 1),
(102, 95, 1),
(103, 96, 1),
(104, 97, 1),
(105, 98, 1),
(106, 99, 1),
(107, 100, 1),
(108, 101, 1),
(109, 102, 1),
(110, 103, 1),
(111, 104, 1),
(112, 105, 1),
(113, 106, 1),
(114, 107, 1),
(115, 108, 1),
(116, 109, 1),
(117, 110, 1),
(118, 111, 1),
(119, 112, 1),
(120, 113, 1),
(121, 114, 1),
(122, 115, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

CREATE TABLE `videos` (
  `videoID` int(11) NOT NULL,
  `proyectoID` int(11) NOT NULL,
  `url` varchar(250) NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `videos`
--

INSERT INTO `videos` (`videoID`, `proyectoID`, `url`, `categoria`) VALUES
(1, 2, 'https://www.youtube.com/watch?v=YOYloOO80qk', 'principal'),
(5, 4, 'https://www.youtube.com/watch?v=sTNfFatKfoI', 'principal'),
(11, 3, 'https://www.youtube.com/watch?v=Uwx0zwFpPnI', 'principal'),
(12, 5, 'https://www.youtube.com/watch?v=ogqs6t5pRf8&feature=youtu.be', 'principal'),
(16, 8, 'https://www.youtube.com/watch?v=yG7MPEQm1-w', 'principal'),
(17, 6, 'https://www.youtube.com/watch?v=vvWhDBMwUzI', 'principal'),
(18, 6, 'https://www.youtube.com/watch?v=9TpQYsMI14s', 'idea'),
(19, 11, 'https://www.youtube.com/watch?v=3oSWvNwjyEk', 'principal'),
(20, 13, 'https://www.youtube.com/watch?v=F0ErivI7KuM', 'principal'),
(21, 14, 'https://www.youtube.com/watch?time_continue=2&v=F0ErivI7KuM&feature=emb_title', 'principal');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_groups`
--
ALTER TABLE `admin_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `admin_login_attempts`
--
ALTER TABLE `admin_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `admin_users_groups`
--
ALTER TABLE `admin_users_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_access`
--
ALTER TABLE `api_access`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_limits`
--
ALTER TABLE `api_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `aportaciones`
--
ALTER TABLE `aportaciones`
  ADD PRIMARY KEY (`aportacionID`);

--
-- Indices de la tabla `aportaciones_fallidas`
--
ALTER TABLE `aportaciones_fallidas`
  ADD PRIMARY KEY (`aportacionID`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`imagenID`);

--
-- Indices de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`proyectoID`);

--
-- Indices de la tabla `recompensas`
--
ALTER TABLE `recompensas`
  ADD PRIMARY KEY (`recompensaID`);

--
-- Indices de la tabla `scv2_estadosrepublica`
--
ALTER TABLE `scv2_estadosrepublica`
  ADD PRIMARY KEY (`estadoID`);

--
-- Indices de la tabla `scv2_industrias`
--
ALTER TABLE `scv2_industrias`
  ADD PRIMARY KEY (`industriaID`);

--
-- Indices de la tabla `scv2_proyectos`
--
ALTER TABLE `scv2_proyectos`
  ADD PRIMARY KEY (`proyectoID`);

--
-- Indices de la tabla `scv2_users`
--
ALTER TABLE `scv2_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`videoID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_groups`
--
ALTER TABLE `admin_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `admin_login_attempts`
--
ALTER TABLE `admin_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `admin_users_groups`
--
ALTER TABLE `admin_users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `api_access`
--
ALTER TABLE `api_access`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `api_limits`
--
ALTER TABLE `api_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aportaciones`
--
ALTER TABLE `aportaciones`
  MODIFY `aportacionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `aportaciones_fallidas`
--
ALTER TABLE `aportaciones_fallidas`
  MODIFY `aportacionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `imagenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `proyectoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `recompensas`
--
ALTER TABLE `recompensas`
  MODIFY `recompensaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `scv2_estadosrepublica`
--
ALTER TABLE `scv2_estadosrepublica`
  MODIFY `estadoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `scv2_industrias`
--
ALTER TABLE `scv2_industrias`
  MODIFY `industriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `scv2_proyectos`
--
ALTER TABLE `scv2_proyectos`
  MODIFY `proyectoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `scv2_users`
--
ALTER TABLE `scv2_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `videoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
