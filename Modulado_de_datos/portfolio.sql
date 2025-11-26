-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2025 a las 10:31:58
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
(2, 'Chino');

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
(2, 'Nicolás', 'García-Sampedro Docampo', 'Desarrollador de aplicaciones web', 'https://www.linkedin.com/in/nicolás-garcía-sampedro-docampo', 'nicolasgarciasampedrodocampo@gmail.com', '634567890');

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
(2, 2, 1, 'Intermedio');

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
(5, 'MySQL'),
(6, 'Office'),
(7, 'Azure'),
(8, 'Linux'),
(9, 'React'),
(10, 'Node');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `programadores`
--
ALTER TABLE `programadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `programadores_idiomas`
--
ALTER TABLE `programadores_idiomas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `programadores_proyectos`
--
ALTER TABLE `programadores_proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programadores_tecnologias`
--
ALTER TABLE `programadores_tecnologias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tecnologias`
--
ALTER TABLE `tecnologias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
