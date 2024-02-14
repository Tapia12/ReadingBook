-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2024 at 02:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_rec_arias`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL,
  `fk_id_estado` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`, `fk_id_estado`) VALUES
(1, 'Plasticos', 1),
(2, 'Hierro', 1),
(3, 'Plegadiza', 1),
(4, 'Cartón', 1),
(5, 'Aluminio ', 1),
(6, 'Cobre', 1),
(7, 'Poliestiren', 1),
(8, 'Poliestireno', 1),
(9, 'Pvc\r\n', 1),
(10, 'Papel', 1),
(26, 'select * from categoria', 1),
(25, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `disenio`
--

CREATE TABLE `disenio` (
  `id_disenio` int(11) NOT NULL,
  `fondo_disenio` int(11) NOT NULL,
  `color_disenio` int(11) NOT NULL,
  `imagen_disenio` varchar(5000) DEFAULT NULL,
  `tema` int(11) DEFAULT NULL,
  `fondo` int(11) DEFAULT NULL,
  `imagen` varchar(5000) DEFAULT NULL,
  `fk_id_rol` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `disenio`
--

INSERT INTO `disenio` (`id_disenio`, `fondo_disenio`, `color_disenio`, `imagen_disenio`, `tema`, `fondo`, `imagen`, `fk_id_rol`) VALUES
(1, 1, 1, 'upload/202402132228050001003950656568c762be66a02f8b37deda29353219533981316d3951c91ec36d78ce30164de527.png', 2, 2, NULL, 1),
(5, 0, 1, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `nombre_empleado` varchar(500) NOT NULL,
  `apellido_empleado` varchar(500) NOT NULL,
  `telefono_empleado` varchar(10) NOT NULL,
  `correo_empleado` varchar(500) NOT NULL,
  `fk_id_rol` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `fk_id_usuario` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`nombre_empleado`, `apellido_empleado`, `telefono_empleado`, `correo_empleado`, `fk_id_rol`, `id_estado`, `fk_id_usuario`) VALUES
('Juanito', 'Alcachofa', '1234567890', 'jesus-42-1@hotmail.com', 1, 1, 1003950656),
('Juanchi', 'Pana', '3101234567', 'jesus-42-1@hotmail.com', 0, 0, 1234567891);

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(10) NOT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`id_estado`, `estado`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(10) NOT NULL,
  `documento_usuario` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fk_id_producto` int(10) NOT NULL,
  `cantidad_inventario` int(11) DEFAULT NULL,
  `id_categoria` int(10) NOT NULL,
  `fecha_inventario` datetime NOT NULL,
  `fk_id_usuario` int(11) NOT NULL,
  `fk_id_estado_inventario` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `documento_usuario`, `fk_id_producto`, `cantidad_inventario`, `id_categoria`, `fecha_inventario`, `fk_id_usuario`, `fk_id_estado_inventario`) VALUES
(1, '1003950656', 2, 100, 1, '2015-02-11 00:00:00', 1003950656, 1),
(2, '123', 1, 100, 1, '2018-01-15 00:00:00', 1003950656, 1),
(3, '123', 3, 250, 2, '2019-06-26 00:00:00', 1003950656, 1),
(4, '444', 4, 107, 3, '2017-10-10 00:00:00', 1003950656, 1),
(5, '123', 5, 150, 4, '2018-01-15 00:00:00', 1003950656, 1),
(6, '123', 1, 87, 1, '2015-05-04 00:00:00', 1003950656, 1),
(7, '123', 4, 985, 2, '2018-01-15 00:00:00', 1003950656, 1),
(9, '1010025721', 1, 200, 4, '2019-09-10 15:22:17', 1003950656, 1),
(10, '1010025721', 1, 800, 4, '2019-09-10 15:23:04', 1003950656, 1),
(11, '1010025721', 1, 1000, 4, '2019-09-10 15:23:27', 1003950656, 2),
(12, '1010025721', 14, 600, 13, '2019-09-10 15:28:14', 1003950656, 1),
(13, '123', 2, 0, 1, '2019-10-08 20:17:48', 1003950656, 1),
(14, '123', 6, 345, 5, '2024-02-13 03:42:19', 1003950656, 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventario_estado`
--

CREATE TABLE `inventario_estado` (
  `id_estado_inventario` int(10) NOT NULL,
  `estado_inventario` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `inventario_estado`
--

INSERT INTO `inventario_estado` (`id_estado_inventario`, `estado_inventario`) VALUES
(1, 'Entrada'),
(2, 'Salida');

-- --------------------------------------------------------

--
-- Table structure for table `permiso`
--

CREATE TABLE `permiso` (
  `fk_id_usuario` int(11) NOT NULL,
  `usuariodocumento` varchar(10) NOT NULL,
  `fk_id_rol` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `permiso`
--

INSERT INTO `permiso` (`fk_id_usuario`, `usuariodocumento`, `fk_id_rol`) VALUES
(1003950656, '1003950656', 1),
(1234567891, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(10) NOT NULL,
  `codigo_producto` varchar(10) DEFAULT NULL,
  `nombre_producto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio_producto` float NOT NULL,
  `fk_id_categoria` int(10) NOT NULL,
  `descripcion_producto` varchar(5000) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen_producto` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fk_id_estado` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id_producto`, `codigo_producto`, `nombre_producto`, `precio_producto`, `fk_id_categoria`, `descripcion_producto`, `imagen_producto`, `fk_id_estado`) VALUES
(1, '200', 'Cajas', 2, 4, 'Cajas de 8x9', 'productos/2024021304405800018068165cae4ca5d1330.63841377Caja.png', 1),
(2, '100', 'Botellas', 2, 1, 'Botellas de 1.5 litros ', '', 2),
(3, '300', 'Plegadiza', 0, 3, 'Plegadiza de 7x8', '', 1),
(4, '400', 'Poliestireno', 0, 8, 'Poliestireno comun', '', 1),
(5, '500', 'Pvc', 0, 9, 'Tubos pvc', '', 1),
(6, '600', 'Aluminio', 5, 5, 'Bolsas de aluminio 5x2', '', 1),
(7, '700', 'Hierro', 1.5, 2, 'Barras de hierro 15cm', 'upload/02164350IMG-20190730-WA0014.jpeg', 1),
(8, '800', 'Cobre', 0, 6, 'Cable de cobre 500mts', 'upload/02155245450_1000.jpg', 1),
(14, '159', 'Periodico', 5, 6, 'Narra la venganza de los hermanos Vicaro contra Santiago Nasar en defensa del honor familiar. ¿Puede una novela cuyo desenlace es develado al inicio atrapar al lector? EL libro Crónica de una muerte anunciada de Gabriel García Márquez tiene la respuesta y es un rotundo sí. Considerada como la obra más realista del escritor colombiano, García Márquez toma un hecho real -un asesinato- cometido en 1951 en un pueblo del Caribe y lo narra a modo de crónica novelada, hilando testimonios, cartas e informes desde múltiples perspectivas. El libro Crónica de una muerte anunciada salió a la luz en 1981 y es considerada una de las novelas ineludibles de la literatura contemporánea hispanoamericana del autor Gabriel García Márquez. En ALIBRATE puedes encontrar todas las reseñas e información sobre el libro Crónicas de una muerte anunciada. Descubre los personajes y frases más populares de esta fascinante novela de la literatura contemporánea.', 'productos/2024021314093400091642065cb6a0e5f5ed4.398394831dc81a2a892adf83eeb38622eb9f9234.jpg', 1),
(15, '123', 'botella', 45, 5, '25465456', 'productos/202010301844370004285185f9c97556b6dc0.05545888botella.png', 1),
(16, '444', 'tubo ', 34, 9, 'tubos de pvc 12 cm', 'productos/22221579descarga.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `resenia`
--

CREATE TABLE `resenia` (
  `id_resenia` int(11) NOT NULL,
  `fk_id_usuario` int(11) NOT NULL,
  `fk_id_producto` int(11) NOT NULL,
  `texto_resenia` varchar(5000) NOT NULL,
  `estrellas_resenia` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `resenia`
--

INSERT INTO `resenia` (`id_resenia`, `fk_id_usuario`, `fk_id_producto`, `texto_resenia`, `estrellas_resenia`) VALUES
(1, 1003950656, 14, 'Excelente. Nunca había leído algo más brutal', 5),
(2, 1003950656, 14, 'Tengo sueño', 4),
(3, 1003950656, 14, 'ASDASDASDASDASDASD', 0),
(4, 1003950656, 14, 'ASDHJKASHJKDHKJASHJDHJKASHDKJA', 0),
(5, 1003950656, 14, 'ASKJDHJKASHJDKHASJKHDJKAHSJKHDJKAHSKJ', 0),
(6, 1003950656, 14, 'ASDASDS', 0),
(7, 1234567891, 14, 'HOLA', 0),
(8, 0, 14, 'QUE ONDAAAAAAAAAAAAA\r\n', 0),
(9, 1003950656, 14, 'DSALKJSDAKLDJJJJJJJJJJJJJJJJJJJJJJJJJJJJJAJSDHJDASHJKADSHKJASDHJKADSHJKADSHJKADSHJKASDHJKAHDSJKHADSJKHADSJKHADSJKHASDJKHADSJKHASDJKHJAKDSHJKDASHJSADHJDSAHJASDHJDSAHJKDSAHJDSAHJDASHJKADSHJKADSHJKDASHJKDASHJKDASHJDASHJDASHJADSHJDAHJKASDHJADHDASJKHJKDHDSAKJHDSAJKHDSAKJHDSAHDSAHJDASHJKADSHJDASHDASJKHADSJKHADSJKHADSJHADSHJADSHJDSAHJASDHJKDSAHDASJKHADSJKHADSJKHADSJHADSJHAJDSHJKADSHJKASDHASDJHASDJHDASJKHADS', 0),
(10, 1003950656, 14, 'IJUASHDJAHSJIDHJKASHJKDAHJKHSDJKHASKJHDJAHSJDHKJASHDJKHASJKDHASHJHDJKAS', 4),
(11, 1003950656, 14, 'ASKJDHIJASHIJUDQWYUIEYUIQWYUIE', 2),
(12, 1003950656, 14, 'TENGO SUEñO', 5);

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(10) NOT NULL,
  `rol` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id_rol`, `rol`) VALUES
(1, 'Superadmin'),
(2, 'Administrador'),
(3, 'Empleado');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` varchar(10) NOT NULL,
  `contrasenia_usuario` varchar(200) DEFAULT NULL,
  `codigo_usuario` varchar(255) DEFAULT NULL,
  `fk_id_estado` varchar(100) NOT NULL,
  `fk_id_rol` int(11) NOT NULL,
  `fk_id_disenio` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `contrasenia_usuario`, `codigo_usuario`, `fk_id_estado`, `fk_id_rol`, `fk_id_disenio`) VALUES
('1003950656', '9450476b384b32d8ad8b758e76c98a69', NULL, '1', 1, 1),
('1234567891', '9e34a6abbe04da03a9cb2c75883f0765', NULL, '1', 0, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `disenio`
--
ALTER TABLE `disenio`
  ADD PRIMARY KEY (`id_disenio`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD UNIQUE KEY `fk_id_usuario` (`fk_id_usuario`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indexes for table `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `id_producto` (`fk_id_producto`);

--
-- Indexes for table `inventario_estado`
--
ALTER TABLE `inventario_estado`
  ADD PRIMARY KEY (`id_estado_inventario`);

--
-- Indexes for table `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`usuariodocumento`,`fk_id_rol`),
  ADD KEY `FKpermisos42274` (`fk_id_rol`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `FKproducto766931` (`fk_id_estado`);

--
-- Indexes for table `resenia`
--
ALTER TABLE `resenia`
  ADD PRIMARY KEY (`id_resenia`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `FKusuario150497` (`fk_id_estado`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `disenio`
--
ALTER TABLE `disenio`
  MODIFY `id_disenio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `inventario_estado`
--
ALTER TABLE `inventario_estado`
  MODIFY `id_estado_inventario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `resenia`
--
ALTER TABLE `resenia`
  MODIFY `id_resenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
