-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
<<<<<<< HEAD
<<<<<<< HEAD
-- Tiempo de generación: 04-12-2025 a las 09:34:06
=======
-- Tiempo de generación: 04-12-2025 a las 09:28:37
>>>>>>> 0f19311 (Nueva base de datos)
=======
-- Tiempo de generación: 04-12-2025 a las 09:34:06
>>>>>>> 70966d0 (base de datos nueva)
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portfolio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario`
--

CREATE TABLE `formulario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formulario`
--

INSERT INTO `formulario` (`id`, `nombre`, `email`, `mensaje`) VALUES
(1, '', '', ''),
(2, '', '', ''),
(3, '', '', ''),
(4, 'Sálocin', 'salocin@ejemplo.com', 'Esto es una prueba'),
(5, 'a', 'a@aaaaaa', 'abcd'),
(6, 'Chao Alarcón', 'chaoalarcon01@gmail.com', 'afafa'),
(7, 'Chao Alarcón', 'chaoalarcon01@gmail.com', 'afafa'),
(8, 'Chao Alarcón', 'chaoalarcon01@gmail.com', 'afafa'),
(9, 'Chao Alarcón', 'chaoalarcon01@gmail.com', 'afafa'),
(10, 'Chao Alarcón', 'chaoalarcon01@gmail.com', 'afafa'),
(11, 'Chao Alarcón', 'chaoalarcon01@gmail.com', 'afafa'),
(12, 'Chao Alarcón', 'chaoalarcon01@gmail.com', 'afafa'),
(13, 'Chao Alarcón', 'chaoalarcon01@gmail.com', 'afafa'),
(14, 'Chao Alarcón Chen', 'chaoalarcon01@gmail.com', 'GRGRGR'),
(15, 'Chao Alarcón Chen', 'chaoalarcon01@gmail.com', 'GRGRGR'),
(16, 'Chao Alarcón Chen', 'chaoalarcon01@gmail.com', 'hola'),
(17, 'Chao Alarcón Chen', 'chaoalarcon01@gmail.com', 'hola'),
(18, 'Chao Alarcón Chen', 'chaoalarcon01@gmail.com', 'hola'),
(19, 'Chao Alarcón Chen', 'chaoalarcon01@gmail.com', 'hola'),
(20, 'Chao Alarcón Chen', 'chaoalarcon01@gmail.com', 'hola'),
(21, 'Chao Alarcón Chen', 'chaoalarcon01@gmail.com', 'hola'),
(22, 'Chao Alarcón Chen', 'chaoalarcon01@gmail.com', 'hola'),
(23, 'Chao Alarcón Chen', 'chaoalarcon01@gmail.com', 'hola'),
(24, 'Chao Alarcón Chen', 'chaoalarcon01@gmail.com', 'hola');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`id`, `nombre`) VALUES
(1, 'Inglés'),
(2, 'Chino'),
(3, 'Español');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programadores`
--

CREATE TABLE `programadores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `imagen` varchar(60) DEFAULT NULL,
  `titulacion` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `numeroTelefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `programadores`
--

INSERT INTO `programadores` (`id`, `nombre`, `apellidos`, `imagen`, `titulacion`, `linkedin`, `email`, `numeroTelefono`) VALUES
(1, 'Álvaro', 'Santos Calvo', NULL, 'Desarrollador de aplicaciones web', 'https://www.linkedin.com/in/álvaro-santos-calvo', 'aalvar.s.c@gmail.com', '612345678'),
(2, 'Nicolás', 'García-Sampedro Docampo', NULL, 'Desarrollador de aplicaciones web', 'https://www.linkedin.com/in/nicolás-garcía-sampedro-docampo', 'nicolasgarciasampedrodocampo@gmail.com', '607896214'),
(3, 'Chao An', 'Alarcón Chen', NULL, 'Desarrollador de Aplicaciones Web', 'https://www.linkedin.com/in/chao-alarc%C3%B3n/', 'chaoalarcon03@gmail.com', '689846699');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programadores_idiomas`
--

CREATE TABLE `programadores_idiomas` (
  `id` int(11) NOT NULL,
  `programadorId` int(11) DEFAULT NULL,
  `idiomaId` int(11) DEFAULT NULL,
  `nivel` enum('Básico','Intermedio','Avanzado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `programadores_idiomas`
--

INSERT INTO `programadores_idiomas` (`id`, `programadorId`, `idiomaId`, `nivel`) VALUES
(1, 1, 1, 'Avanzado'),
(2, 2, 1, 'Intermedio'),
(3, 3, 2, 'Avanzado'),
(4, 3, 1, 'Avanzado'),
(5, 3, 3, 'Avanzado'),
(6, 2, 3, 'Avanzado'),
(7, 1, 3, 'Avanzado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programadores_proyectos`
--

CREATE TABLE `programadores_proyectos` (
  `id` int(11) NOT NULL,
  `programadorId` int(11) DEFAULT NULL,
  `proyectoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `programadores_proyectos`
--

INSERT INTO `programadores_proyectos` (`id`, `programadorId`, `proyectoId`) VALUES
(1, 1, 4),
(2, 1, 5),
(3, 1, 6),
(4, 1, 7),
(5, 1, 2),
(6, 2, 4),
(7, 2, 5),
(8, 2, 6),
(9, 2, 7),
(10, 2, 2),
(11, 3, 4),
(12, 3, 5),
(13, 3, 6),
(14, 3, 7),
(15, 3, 2),
(16, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programadores_tecnologias`
--

CREATE TABLE `programadores_tecnologias` (
  `id` int(11) NOT NULL,
  `programadorId` int(11) DEFAULT NULL,
  `tecnologiaId` int(11) DEFAULT NULL,
  `nivel` enum('Básico','Intermedio','Avanzado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `programadores_tecnologias`
--

INSERT INTO `programadores_tecnologias` (`id`, `programadorId`, `tecnologiaId`, `nivel`) VALUES
(101, 1, 1, 'Avanzado'),
(102, 1, 2, 'Avanzado'),
(103, 1, 3, 'Avanzado'),
(104, 1, 4, 'Avanzado'),
(105, 1, 6, 'Intermedio'),
(106, 1, 7, 'Intermedio'),
(107, 1, 8, 'Intermedio'),
(108, 1, 9, 'Avanzado'),
(109, 1, 10, 'Avanzado'),
(110, 1, 11, 'Avanzado'),
(111, 1, 12, 'Avanzado'),
(117, 1, 18, 'Avanzado'),
(118, 1, 19, 'Avanzado'),
(119, 1, 20, 'Intermedio'),
(120, 2, 1, 'Avanzado'),
(121, 2, 2, 'Avanzado'),
(122, 2, 3, 'Avanzado'),
(123, 2, 4, 'Avanzado'),
(124, 2, 6, 'Intermedio'),
(125, 2, 7, 'Intermedio'),
(126, 2, 8, 'Intermedio'),
(127, 2, 9, 'Avanzado'),
(128, 2, 10, 'Avanzado'),
(129, 2, 11, 'Intermedio'),
(130, 2, 12, 'Avanzado'),
(131, 2, 19, 'Básico'),
(132, 3, 1, 'Avanzado'),
(133, 3, 2, 'Avanzado'),
(134, 3, 3, 'Avanzado'),
(135, 3, 4, 'Avanzado'),
(136, 3, 6, 'Intermedio'),
(137, 3, 7, 'Intermedio'),
(138, 3, 8, 'Intermedio'),
(139, 3, 9, 'Avanzado'),
(140, 3, 10, 'Avanzado'),
(141, 3, 11, 'Intermedio'),
(142, 3, 12, 'Avanzado'),
(143, 3, 19, 'Básico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tecnologias` varchar(255) DEFAULT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `enlace` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `titulo`, `descripcion`, `tecnologias`, `empresa`, `fecha`, `enlace`) VALUES
(2, 'Sitio web centro comercial Plaza Río 2.', 'Creación de un sitio informativo sobre el centro comercial Plaza Río 2.', 'HTML5, CSS3, JavaScript, Bootstrap, JSON, GitHub, Netlify', 'Instituto Nebrija de Formación Profesional', '2025-06-01', 'https://plazario2.netlify.app/'),
(3, 'Sitio web de \"OnStream\".', 'Landing page de presentación para la APK de Streaming multimedia OnStream.', 'HTML5, CSS3, GitHub, Netlify', 'Instituto Nebrija de Formación Profesional', '2025-03-01', 'https://onstreamweb.netlify.app/'),
(4, 'Aventura Interactiva \"Warriors of Eazima\".', 'Aventura Interactiva realizada principalmente con el lenguaje Java. Sería un juego con una interfaz gráfica simple y con todo un desarrollo de personajes en la narrativa.', 'Java, GitHub, draw.io', 'Instituto Nebrija de Formación Profesional', '2025-06-01', 'https://github.com/ChaoAlarcon/Elige-Tu-Propia-Aventura-II'),
(5, 'Dominó Digital.', 'Juego del dominó hecho en\r\nlenguaje java para jugar de 2 a 4 personas.\r\n', 'Java, GitHub, draw.io', 'Instituto Nebrija de Formación Profesional', '2025-04-01', 'https://github.com/Nicolas-1400/Domino1.5'),
(6, 'Gestión de base de datos de un Hospital.', 'Mediante MySQL y Workbench, la gestión de la base de datos de un hospital.', 'MySQL, Workbench', 'Instituto Nebrija de Formación Profesional', '2025-01-01', NULL),
(7, 'Plataforma de E-Learning \"NebriAcademy\".', 'Creación de una plataforma online de E-Learning siguiendo una\r\narquitectura cliente/Servidor limpia y cubriendo todas las\r\netapas necesarias: Toma de requisitos, prototipado,\r\npruebas y despliegue. Tecnologías de desarrollo iniciales:\r\nNode (Back) y React (Front).\r\n', 'HTML5, CSS3, Bootstrap, JavaScript, React, Node, SQL, GitHub', 'Instituto Nebrija de Formación Profesional', '2026-02-01', 'https://github.com/Nicolas-1400/NebriAcademy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnologias`
--

CREATE TABLE `tecnologias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnologias`
--

INSERT INTO `tecnologias` (`id`, `nombre`) VALUES
(1, 'Java'),
(2, 'JavaScript'),
(3, 'HTML'),
(4, 'CSS'),
(6, 'Office'),
(7, 'Azure'),
(8, 'Linux'),
(9, 'React'),
(10, 'Node'),
(11, 'Bootstrap'),
(12, 'SQL'),
(13, 'Photoshop'),
(14, 'Premiere Pro'),
(15, 'After Effects'),
(16, 'Lightroom'),
(17, 'Adobe XD'),
(18, 'Illustrator'),
(19, 'Figma'),
(20, 'Workbench');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `formulario`
--
ALTER TABLE `formulario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `programadores`
--
ALTER TABLE `programadores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD UNIQUE KEY `email_4` (`email`),
  ADD UNIQUE KEY `email_5` (`email`),
  ADD UNIQUE KEY `email_6` (`email`),
  ADD UNIQUE KEY `email_7` (`email`),
  ADD UNIQUE KEY `email_8` (`email`),
  ADD UNIQUE KEY `email_9` (`email`),
  ADD UNIQUE KEY `email_10` (`email`),
  ADD UNIQUE KEY `email_11` (`email`),
  ADD UNIQUE KEY `email_12` (`email`),
  ADD UNIQUE KEY `email_13` (`email`),
  ADD UNIQUE KEY `email_14` (`email`),
  ADD UNIQUE KEY `email_15` (`email`),
  ADD UNIQUE KEY `email_16` (`email`),
  ADD UNIQUE KEY `email_17` (`email`),
  ADD UNIQUE KEY `email_18` (`email`),
  ADD UNIQUE KEY `email_19` (`email`),
  ADD UNIQUE KEY `email_20` (`email`),
  ADD UNIQUE KEY `email_21` (`email`),
  ADD UNIQUE KEY `email_22` (`email`);

--
-- Indices de la tabla `programadores_idiomas`
--
ALTER TABLE `programadores_idiomas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programadorId` (`programadorId`),
  ADD KEY `idiomaId` (`idiomaId`);

--
-- Indices de la tabla `programadores_proyectos`
--
ALTER TABLE `programadores_proyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programadorId` (`programadorId`),
  ADD KEY `proyectoId` (`proyectoId`);

--
-- Indices de la tabla `programadores_tecnologias`
--
ALTER TABLE `programadores_tecnologias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programadorId` (`programadorId`),
  ADD KEY `tecnologiaId` (`tecnologiaId`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tecnologias`
--
ALTER TABLE `tecnologias`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `formulario`
--
ALTER TABLE `formulario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `programadores`
--
ALTER TABLE `programadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `programadores_idiomas`
--
ALTER TABLE `programadores_idiomas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `programadores_proyectos`
--
ALTER TABLE `programadores_proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `programadores_tecnologias`
--
ALTER TABLE `programadores_tecnologias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tecnologias`
--
ALTER TABLE `tecnologias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `programadores_idiomas`
--
ALTER TABLE `programadores_idiomas`
  ADD CONSTRAINT `programadores_idiomas_ibfk_1` FOREIGN KEY (`programadorId`) REFERENCES `programadores` (`id`),
  ADD CONSTRAINT `programadores_idiomas_ibfk_2` FOREIGN KEY (`idiomaId`) REFERENCES `idiomas` (`id`);

--
-- Filtros para la tabla `programadores_proyectos`
--
ALTER TABLE `programadores_proyectos`
  ADD CONSTRAINT `programadores_proyectos_ibfk_1` FOREIGN KEY (`programadorId`) REFERENCES `programadores` (`id`),
  ADD CONSTRAINT `programadores_proyectos_ibfk_2` FOREIGN KEY (`proyectoId`) REFERENCES `proyectos` (`id`);

--
-- Filtros para la tabla `programadores_tecnologias`
--
ALTER TABLE `programadores_tecnologias`
  ADD CONSTRAINT `programadores_tecnologias_ibfk_1` FOREIGN KEY (`programadorId`) REFERENCES `programadores` (`id`),
  ADD CONSTRAINT `programadores_tecnologias_ibfk_2` FOREIGN KEY (`tecnologiaId`) REFERENCES `tecnologias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
