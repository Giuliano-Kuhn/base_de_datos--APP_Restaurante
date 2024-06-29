-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2024 a las 17:52:30
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID_categoria` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID_categoria`, `Nombre`) VALUES
(1, 'Desayunos'),
(2, 'Entradas'),
(3, 'Bebidas'),
(4, 'Carnes'),
(5, 'Pastas'),
(6, 'Guarniciones'),
(7, 'Postres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE `item` (
  `ID_Item` int(11) NOT NULL,
  `Nombre` varchar(35) DEFAULT NULL,
  `Descripcion` varchar(85) DEFAULT NULL,
  `ID_Categoria` int(11) DEFAULT NULL,
  `Precio` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `item`
--

INSERT INTO `item` (`ID_Item`, `Nombre`, `Descripcion`, `ID_Categoria`, `Precio`) VALUES
(1, 'Cafe', 'Molido', 1, 1600.00),
(2, 'Cafe', 'Cortado', 1, 2600.00),
(3, 'Té', 'Verde', 1, 1600.00),
(4, 'Té', 'Hiervas', 1, 1600.00),
(5, 'Empanada', 'De Carne', 2, 1200.00),
(6, 'Empanada', 'De jamon y queso', 2, 1200.00),
(7, 'Papas', 'Con cheddar', 2, 5000.00),
(8, 'Picada', 'Salamin, queso, mani jamon, bondiola', 2, 8000.00),
(9, 'Coca-Cola', 'Botella de 1lts', 3, 2000.00),
(10, 'Coca-Cola', 'Botella de 500cc', 3, 1500.00),
(11, 'Sprite', 'Botella de 1lts', 3, 2000.00),
(12, 'Sprite', 'Botella de 500cc', 3, 1500.00),
(13, 'Cerveza', 'Botella de 1Lts', 3, 4000.00),
(14, 'Vino', 'Botella de 1Lts', 3, 6000.00),
(15, 'Parrillada', 'Asado de tira, Morcilla, Chorizo, Corte de cerdo', 4, 10000.00),
(16, 'Entrecot', 'Bife de chorizo', 4, 6500.00),
(17, 'Milanesa', 'De Carne de vaca', 4, 5000.00),
(18, 'Suprema', 'De Carne de pollo', 4, 4500.00),
(19, 'Fideos', 'Fideos cinta', 5, 3500.00),
(20, 'Ñoquis', 'Con salsa roja', 5, 3500.00),
(21, 'Ñoquis', 'Con salsa 4 quesos', 5, 4000.00),
(22, 'Pizza', 'Comun', 5, 6000.00),
(23, 'Pizza', 'Especial', 5, 8000.00),
(24, 'Ensalada', 'Lechuga y tomate', 6, 2500.00),
(25, 'Ensalada', 'César', 6, 2800.00),
(26, 'Papas', 'Fritas', 6, 3500.00),
(27, 'Puré', 'De papa', 6, 2600.00),
(28, 'Helado', '1 Bocha de Frutilla', 7, 1500.00),
(29, 'Helado', '1 Bocha de Vainilla', 7, 1500.00),
(30, 'Ensalada De Fruta', 'Pera, uva, naranja, manzana', 7, 1700.00),
(31, 'Budin De Pan', 'Con crema', 7, 2500.00),
(32, 'Budin De Pan', 'Con dulce de leche', 7, 2500.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items_por_orden`
--

CREATE TABLE `items_por_orden` (
  `ID_Item_Orden` int(11) NOT NULL,
  `ID_Orden` int(11) DEFAULT NULL,
  `ID_Item` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `items_por_orden`
--

INSERT INTO `items_por_orden` (`ID_Item_Orden`, `ID_Orden`, `ID_Item`, `Cantidad`) VALUES
(41, 40, 9, 1),
(42, 41, 11, 1),
(43, 42, 23, 1),
(49, 46, 19, 1),
(50, 47, 8, 1),
(51, 47, 15, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `Codigo_mesa` int(11) NOT NULL,
  `numero_mesa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesa`
--

INSERT INTO `mesa` (`Codigo_mesa`, `numero_mesa`) VALUES
(114345, 6),
(262646, 9),
(282646, 3),
(556675, 5),
(635384, 1),
(652238, 12),
(666675, 11),
(685384, 7),
(802537, 2),
(808767, 10),
(812537, 8),
(898767, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `ID_Orden` int(11) NOT NULL,
  `Codigo_mesa` int(11) DEFAULT NULL,
  `Mozo_DNI` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Total` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`ID_Orden`, `Codigo_mesa`, `Mozo_DNI`, `Fecha`, `Total`) VALUES
(40, 262646, 16520122, '2024-06-20 14:45:00', 2000.00),
(41, 666675, 22411714, '2024-06-20 14:45:17', 2000.00),
(42, 262646, 16520122, '2024-06-29 11:15:35', 8000.00),
(43, 114345, 22411714, '2024-06-29 11:18:45', 2700.00),
(46, 262646, 16520122, '2024-06-29 11:53:48', 3500.00),
(47, 282646, 22411714, '2024-06-29 11:56:05', 18000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `DNI` int(11) NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Apellido` varchar(35) DEFAULT NULL,
  `Numero_de_contacto` int(11) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `ID_Rol` int(11) DEFAULT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `Contraseña` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`DNI`, `Nombre`, `Apellido`, `Numero_de_contacto`, `Email`, `ID_Rol`, `Usuario`, `Contraseña`) VALUES
(16520122, 'Maria', 'Balmaceda', 79868941, 'maria@hotmail.com', 2, 'Maria', 'poiuy'),
(18917320, 'Carlos', 'Perez', 79846513, 'charly@hotmail.com', 3, 'Charly', '998877'),
(22411714, 'Jose', 'Lerda', 45612324, 'juan@gmail.com', 2, 'Jose', '4321'),
(25219317, 'Sebastian', 'Sanchez', 76435120, 'Ssanchez@gmail.com', 4, 'Ssanchez', '159753'),
(25885741, 'Roberto', 'Sanchez', 12345678, 'roberto@hotmail.com', 1, 'Roberto', '1234'),
(33455213, 'Juan', 'Rodriguez', 87654321, 'Juan@hotmail.com', 2, 'Juan', 'qwerty'),
(44781111, 'Hernan', 'Legman', 46513257, 'Herman@gmail.com', 3, 'Hernan', 'ytrewq');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ID_ROL` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`ID_ROL`, `Nombre`) VALUES
(1, 'Encargado'),
(2, 'Mozo'),
(3, 'Chef'),
(4, 'Caja');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_categoria`);

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ID_Item`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Indices de la tabla `items_por_orden`
--
ALTER TABLE `items_por_orden`
  ADD PRIMARY KEY (`ID_Item_Orden`),
  ADD KEY `ID_Orden` (`ID_Orden`),
  ADD KEY `ID_Item` (`ID_Item`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`Codigo_mesa`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`ID_Orden`),
  ADD KEY `Codigo_mesa` (`Codigo_mesa`),
  ADD KEY `Mozo_DNI` (`Mozo_DNI`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`DNI`),
  ADD KEY `ID_Rol` (`ID_Rol`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_ROL`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `items_por_orden`
--
ALTER TABLE `items_por_orden`
  MODIFY `ID_Item_Orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `ID_Orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria` (`ID_categoria`);

--
-- Filtros para la tabla `items_por_orden`
--
ALTER TABLE `items_por_orden`
  ADD CONSTRAINT `items_por_orden_ibfk_1` FOREIGN KEY (`ID_Orden`) REFERENCES `orden` (`ID_Orden`),
  ADD CONSTRAINT `items_por_orden_ibfk_2` FOREIGN KEY (`ID_Item`) REFERENCES `item` (`ID_Item`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`Codigo_mesa`) REFERENCES `mesa` (`Codigo_mesa`),
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`Mozo_DNI`) REFERENCES `personal` (`DNI`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`ID_Rol`) REFERENCES `rol` (`ID_ROL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
