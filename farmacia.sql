-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-02-2019 a las 01:47:19
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmacia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `nit_cliente` int(11) NOT NULL,
  `cliente` varchar(30) NOT NULL,
  `direccion_cliente` varchar(30) NOT NULL,
  `email_cliente` varchar(30) NOT NULL,
  `tel_cliente` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `precio_compra` int(11) NOT NULL,
  `cant_comprada` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  `total_compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `no_factura` int(30) NOT NULL,
  `nit_cliente` int(11) NOT NULL,
  `cod_medicina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `drogueria`
--

CREATE TABLE `drogueria` (
  `nit_drogueria` int(11) NOT NULL,
  `nombre_drogueria` varchar(30) NOT NULL,
  `direccion_drogueria` varchar(30) NOT NULL,
  `email_drogueria` varchar(30) NOT NULL,
  `telefono_drogueria` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `nit_empleado` varchar(30) NOT NULL,
  `empleado` varchar(30) NOT NULL,
  `tel_empleado` int(8) NOT NULL,
  `direccion_empleado` varchar(30) NOT NULL,
  `email_empleado` varchar(30) NOT NULL,
  `cod_turno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `no_factura` int(30) NOT NULL,
  `fecha_emicion` date NOT NULL,
  `total_factura` varchar(30) NOT NULL,
  `nit_empleado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicina`
--

CREATE TABLE `medicina` (
  `cod_medicina` int(11) NOT NULL,
  `medicina` varchar(30) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `stock` varchar(30) NOT NULL,
  `cant_grs` varchar(30) NOT NULL,
  `via_administracion` varchar(30) NOT NULL,
  `nit_drogueria` int(11) NOT NULL,
  `precio_venta` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `cod_turno` int(11) NOT NULL,
  `turno` varchar(30) NOT NULL,
  `descripcion_turno` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `precio_venta` int(11) NOT NULL,
  `cant_vendida` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `precio_compra` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`nit_cliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`precio_compra`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD KEY `no_factura` (`no_factura`),
  ADD KEY `nit_cliente` (`nit_cliente`),
  ADD KEY `cod_medicina` (`cod_medicina`);

--
-- Indices de la tabla `drogueria`
--
ALTER TABLE `drogueria`
  ADD PRIMARY KEY (`nit_drogueria`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`nit_empleado`),
  ADD KEY `cod_turno` (`cod_turno`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`no_factura`),
  ADD KEY `nit_empleado` (`nit_empleado`);

--
-- Indices de la tabla `medicina`
--
ALTER TABLE `medicina`
  ADD PRIMARY KEY (`cod_medicina`),
  ADD KEY `nit_drogueria` (`nit_drogueria`),
  ADD KEY `precio_venta` (`precio_venta`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`cod_turno`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`precio_venta`),
  ADD KEY `precio_compra` (`precio_compra`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`no_factura`) REFERENCES `factura` (`no_factura`),
  ADD CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`nit_cliente`) REFERENCES `cliente` (`nit_cliente`),
  ADD CONSTRAINT `detalle_ibfk_3` FOREIGN KEY (`cod_medicina`) REFERENCES `medicina` (`cod_medicina`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`nit_empleado`) REFERENCES `empleado` (`nit_empleado`);

--
-- Filtros para la tabla `medicina`
--
ALTER TABLE `medicina`
  ADD CONSTRAINT `medicina_ibfk_1` FOREIGN KEY (`nit_drogueria`) REFERENCES `drogueria` (`nit_drogueria`),
  ADD CONSTRAINT `medicina_ibfk_2` FOREIGN KEY (`precio_venta`) REFERENCES `venta` (`precio_venta`);

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `turno_ibfk_1` FOREIGN KEY (`cod_turno`) REFERENCES `empleado` (`cod_turno`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`precio_compra`) REFERENCES `compra` (`precio_compra`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
