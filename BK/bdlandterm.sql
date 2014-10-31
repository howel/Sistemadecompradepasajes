-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2014 a las 19:11:13
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdlandterm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asientos`
--

CREATE TABLE IF NOT EXISTS `asientos` (
  `idasientos` int(11) NOT NULL,
  `EstadoAsientos` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `nroAsientos` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `SeccionAsiento` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `fechaViaje` datetime NOT NULL,
  `Buses_idBuses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buses`
--

CREATE TABLE IF NOT EXISTS `buses` (
`idBuses` int(11) NOT NULL,
  `NombreBus` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Año` date NOT NULL,
  `Placa` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `tarifa_idtarifa` int(11) NOT NULL,
  `pisos_idpisos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chofer`
--

CREATE TABLE IF NOT EXISTS `chofer` (
  `idchofer` int(11) NOT NULL,
  `Nombrechofer` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idBuses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprapasajes`
--

CREATE TABLE IF NOT EXISTS `comprapasajes` (
  `idcompraPasajes` int(11) NOT NULL,
  `numeropasajes` int(11) NOT NULL,
  `compraPasajescol` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `viajes_idViajes` int(11) NOT NULL,
  `Tarjeta_idTarjeta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprapasajes_has_buses`
--

CREATE TABLE IF NOT EXISTS `comprapasajes_has_buses` (
  `compraPasajes_idcompraPasajes` int(11) NOT NULL,
  `asientos_idasientos` int(11) NOT NULL,
  `nombrePasajero` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `apellidoPasajero` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `dniPasajero` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deta`
--

CREATE TABLE IF NOT EXISTS `deta` (
  `idde` int(11) NOT NULL,
  `TipoUsuario` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Ubigeo_idPais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE IF NOT EXISTS `horario` (
  `idhorario` int(11) NOT NULL,
  `fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sedes_idSedes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pisos`
--

CREATE TABLE IF NOT EXISTS `pisos` (
  `idpisos` int(11) NOT NULL,
  `nroPisos` int(11) NOT NULL,
  `CantidadAsientos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE IF NOT EXISTS `sedes` (
  `idSedes` int(11) NOT NULL,
  `NombreSedes` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `UsuarioEmpresa_idUsuarioEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifa`
--

CREATE TABLE IF NOT EXISTS `tarifa` (
`idtarifa` int(11) NOT NULL,
  `monto` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `horario_idhorario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE IF NOT EXISTS `tarjeta` (
`idTarjeta` int(11) NOT NULL,
  `NumeroTarjeta` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Caducidad` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuario`
--

CREATE TABLE IF NOT EXISTS `tusuario` (
`idtUsuario` int(11) NOT NULL,
  `Nombres` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Apellidos` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `DireccionUsuario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `NombreUsuario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ContrasenaUsuario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Pasajero_iddet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubigeo`
--

CREATE TABLE IF NOT EXISTS `ubigeo` (
`idPais` int(11) NOT NULL,
  `nombrePais` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `departamento` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `provincia` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `distrito` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioempresa`
--

CREATE TABLE IF NOT EXISTS `usuarioempresa` (
  `idUsuarioEmpresa` int(11) NOT NULL,
  `NombreEmpresa` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NumeroCuenta` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Sedes_idSedes` int(11) NOT NULL,
  `deta_idde` int(11) NOT NULL,
  `deta_Ubigeo_idPais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariopasajero`
--

CREATE TABLE IF NOT EXISTS `usuariopasajero` (
  `idusuarioPasajero` int(11) NOT NULL,
  `deta_idde` int(11) NOT NULL,
  `deta_Ubigeo_idPais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

CREATE TABLE IF NOT EXISTS `viajes` (
`idViajes` int(11) NOT NULL,
  `viajescol` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `viajes` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `usuarioPasajero_idusuarioPasajero` int(11) NOT NULL,
  `UsuarioEmpresa_idUsuarioEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asientos`
--
ALTER TABLE `asientos`
 ADD PRIMARY KEY (`idasientos`), ADD KEY `fk_asientos_Buses1_idx` (`Buses_idBuses`);

--
-- Indices de la tabla `buses`
--
ALTER TABLE `buses`
 ADD PRIMARY KEY (`idBuses`), ADD KEY `fk_Buses_tarifa1_idx` (`tarifa_idtarifa`), ADD KEY `fk_Buses_pisos1_idx` (`pisos_idpisos`);

--
-- Indices de la tabla `chofer`
--
ALTER TABLE `chofer`
 ADD PRIMARY KEY (`idchofer`), ADD KEY `fk_chofer_Buses1_idx` (`idBuses`);

--
-- Indices de la tabla `comprapasajes`
--
ALTER TABLE `comprapasajes`
 ADD PRIMARY KEY (`idcompraPasajes`), ADD KEY `fk_compraPasajes_viajes1_idx` (`viajes_idViajes`), ADD KEY `fk_compraPasajes_Tarjeta1_idx` (`Tarjeta_idTarjeta`);

--
-- Indices de la tabla `comprapasajes_has_buses`
--
ALTER TABLE `comprapasajes_has_buses`
 ADD PRIMARY KEY (`compraPasajes_idcompraPasajes`,`asientos_idasientos`), ADD KEY `fk_compraPasajes_has_Buses_compraPasajes1_idx` (`compraPasajes_idcompraPasajes`), ADD KEY `fk_compraPasajes_has_Buses_asientos1_idx` (`asientos_idasientos`);

--
-- Indices de la tabla `deta`
--
ALTER TABLE `deta`
 ADD PRIMARY KEY (`idde`,`Ubigeo_idPais`), ADD KEY `fk_deat_Ubigeo1_idx` (`Ubigeo_idPais`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
 ADD PRIMARY KEY (`idhorario`), ADD KEY `fk_horario_Sedes1_idx` (`Sedes_idSedes`);

--
-- Indices de la tabla `pisos`
--
ALTER TABLE `pisos`
 ADD PRIMARY KEY (`idpisos`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
 ADD PRIMARY KEY (`idSedes`), ADD KEY `fk_Sedes_UsuarioEmpresa1_idx` (`UsuarioEmpresa_idUsuarioEmpresa`);

--
-- Indices de la tabla `tarifa`
--
ALTER TABLE `tarifa`
 ADD PRIMARY KEY (`idtarifa`), ADD KEY `fk_tarifa_horario1_idx` (`horario_idhorario`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
 ADD PRIMARY KEY (`idTarjeta`);

--
-- Indices de la tabla `tusuario`
--
ALTER TABLE `tusuario`
 ADD PRIMARY KEY (`idtUsuario`), ADD KEY `fk_tusuario_Pasajero1_idx` (`Pasajero_iddet`);

--
-- Indices de la tabla `ubigeo`
--
ALTER TABLE `ubigeo`
 ADD PRIMARY KEY (`idPais`);

--
-- Indices de la tabla `usuarioempresa`
--
ALTER TABLE `usuarioempresa`
 ADD PRIMARY KEY (`idUsuarioEmpresa`), ADD KEY `fk_UsuarioEmpresa_deta1_idx` (`deta_idde`,`deta_Ubigeo_idPais`);

--
-- Indices de la tabla `usuariopasajero`
--
ALTER TABLE `usuariopasajero`
 ADD PRIMARY KEY (`idusuarioPasajero`), ADD KEY `fk_usuarioPasajero_deta1_idx` (`deta_idde`,`deta_Ubigeo_idPais`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
 ADD PRIMARY KEY (`idViajes`), ADD KEY `fk_viajes_usuarioPasajero1_idx` (`usuarioPasajero_idusuarioPasajero`), ADD KEY `fk_viajes_UsuarioEmpresa1_idx` (`UsuarioEmpresa_idUsuarioEmpresa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `buses`
--
ALTER TABLE `buses`
MODIFY `idBuses` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tarifa`
--
ALTER TABLE `tarifa`
MODIFY `idtarifa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
MODIFY `idTarjeta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tusuario`
--
ALTER TABLE `tusuario`
MODIFY `idtUsuario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ubigeo`
--
ALTER TABLE `ubigeo`
MODIFY `idPais` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `viajes`
--
ALTER TABLE `viajes`
MODIFY `idViajes` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asientos`
--
ALTER TABLE `asientos`
ADD CONSTRAINT `fk_asientos_Buses1` FOREIGN KEY (`Buses_idBuses`) REFERENCES `buses` (`idBuses`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `buses`
--
ALTER TABLE `buses`
ADD CONSTRAINT `fk_Buses_pisos1` FOREIGN KEY (`pisos_idpisos`) REFERENCES `pisos` (`idpisos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Buses_tarifa1` FOREIGN KEY (`tarifa_idtarifa`) REFERENCES `tarifa` (`idtarifa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `chofer`
--
ALTER TABLE `chofer`
ADD CONSTRAINT `fk_chofer_Buses1` FOREIGN KEY (`idBuses`) REFERENCES `buses` (`idBuses`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comprapasajes`
--
ALTER TABLE `comprapasajes`
ADD CONSTRAINT `fk_compraPasajes_Tarjeta1` FOREIGN KEY (`Tarjeta_idTarjeta`) REFERENCES `tarjeta` (`idTarjeta`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_compraPasajes_viajes1` FOREIGN KEY (`viajes_idViajes`) REFERENCES `viajes` (`idViajes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comprapasajes_has_buses`
--
ALTER TABLE `comprapasajes_has_buses`
ADD CONSTRAINT `fk_compraPasajes_has_Buses_asientos1` FOREIGN KEY (`asientos_idasientos`) REFERENCES `asientos` (`idasientos`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_compraPasajes_has_Buses_compraPasajes1` FOREIGN KEY (`compraPasajes_idcompraPasajes`) REFERENCES `comprapasajes` (`idcompraPasajes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `deta`
--
ALTER TABLE `deta`
ADD CONSTRAINT `fk_deat_Ubigeo1` FOREIGN KEY (`Ubigeo_idPais`) REFERENCES `ubigeo` (`idPais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
ADD CONSTRAINT `fk_horario_Sedes1` FOREIGN KEY (`Sedes_idSedes`) REFERENCES `sedes` (`idSedes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sedes`
--
ALTER TABLE `sedes`
ADD CONSTRAINT `fk_Sedes_UsuarioEmpresa1` FOREIGN KEY (`UsuarioEmpresa_idUsuarioEmpresa`) REFERENCES `usuarioempresa` (`idUsuarioEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarifa`
--
ALTER TABLE `tarifa`
ADD CONSTRAINT `fk_tarifa_horario1` FOREIGN KEY (`horario_idhorario`) REFERENCES `horario` (`idhorario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tusuario`
--
ALTER TABLE `tusuario`
ADD CONSTRAINT `fk_tusuario_Pasajero1` FOREIGN KEY (`Pasajero_iddet`) REFERENCES `deta` (`idde`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarioempresa`
--
ALTER TABLE `usuarioempresa`
ADD CONSTRAINT `fk_UsuarioEmpresa_deta1` FOREIGN KEY (`deta_idde`, `deta_Ubigeo_idPais`) REFERENCES `deta` (`idde`, `Ubigeo_idPais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuariopasajero`
--
ALTER TABLE `usuariopasajero`
ADD CONSTRAINT `fk_usuarioPasajero_deta1` FOREIGN KEY (`deta_idde`, `deta_Ubigeo_idPais`) REFERENCES `deta` (`idde`, `Ubigeo_idPais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `viajes`
--
ALTER TABLE `viajes`
ADD CONSTRAINT `fk_viajes_UsuarioEmpresa1` FOREIGN KEY (`UsuarioEmpresa_idUsuarioEmpresa`) REFERENCES `usuarioempresa` (`idUsuarioEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_viajes_usuarioPasajero1` FOREIGN KEY (`usuarioPasajero_idusuarioPasajero`) REFERENCES `usuariopasajero` (`idusuarioPasajero`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
