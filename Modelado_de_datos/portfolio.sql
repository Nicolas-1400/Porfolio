-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2025 a las 11:07:13
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
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formulario`
--

INSERT INTO `formulario` (`id`, `nombre`, `email`, `mensaje`) VALUES
(1, 'Laura Martínez', 'laura.martinez@example.com', 'Estoy interesada en saber más sobre vuestros servicios.'),
(2, 'Carlos Pérez', 'carlos.perez@example.com', 'Me gustaría contactar con dos desarrolladores para un proyecto personal.'),
(3, 'Marta Gómez', 'marta.gomez@example.com', '¿Podrían enviarme información sobre disponibilidad y precios?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
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
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `titulacion` varchar(100) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `numeroTelefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `programadores`
--

INSERT INTO `programadores` (`id`, `nombre`, `apellidos`, `titulacion`, `linkedin`, `email`, `numeroTelefono`) VALUES
(1, 'Álvaro', 'Santos Calvo', 'Desarrollador de aplicaciones web', 'https://www.linkedin.com/in/álvaro-santos-calvo', 'aalvar.s.c@gmail.com', '612345678'),
(2, 'Nicolás', 'García-Sampedro Docampo', 'Desarrollador de aplicaciones web', 'https://www.linkedin.com/in/nicolás-garcía-sampedro-docampo', 'nicolasgarciasampedrodocampo@gmail.com', '607896214'),
(3, 'Chao An', 'Alarcón Chen', 'Desarrollador de Aplicaciones Web', 'https://www.linkedin.com/in/chao-alarc%C3%B3n/', 'chaoalarcon03@gmail.com', '689846699');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programadores_idiomas`
--

CREATE TABLE `programadores_idiomas` (
  `id` int(11) NOT NULL,
  `programadorId` int(11) NOT NULL,
  `idiomaId` int(11) NOT NULL,
  `nivel` enum('Básico','Intermedio','Avanzado') NOT NULL
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
  `programadorId` int(11) NOT NULL,
  `proyectoId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programadores_tecnologias`
--

CREATE TABLE `programadores_tecnologias` (
  `id` int(11) NOT NULL,
  `programadorId` int(11) NOT NULL,
  `tecnologiaId` int(11) NOT NULL,
  `nivel` enum('Básico','Intermedio','Avanzado') NOT NULL
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
  `titulo` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tecnologias` varchar(255) DEFAULT NULL,
  `empresa` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `enlace` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnologias`
--

CREATE TABLE `tecnologias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
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
  ADD UNIQUE KEY `email` (`email`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programadores_tecnologias`
--
ALTER TABLE `programadores_tecnologias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
