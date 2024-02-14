-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql111.infinityfree.com
-- Tiempo de generación: 14-02-2024 a las 11:12:12
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `if0_35980937_bd_reading_book`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fk_id_estado` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`, `fk_id_estado`) VALUES
(28, 'Ciencia ficcion', 1),
(29, 'Terror', 1),
(30, 'Suspenso', 1),
(31, 'Accion', 1),
(32, 'Drama', 1),
(33, 'Amor', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disenio`
--

CREATE TABLE `disenio` (
  `id_disenio` int(11) NOT NULL,
  `fondo_disenio` int(11) NOT NULL,
  `color_disenio` int(11) NOT NULL,
  `imagen_disenio` varchar(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tema` int(11) DEFAULT NULL,
  `fondo` int(11) DEFAULT NULL,
  `imagen` varchar(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_id_rol` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `disenio`
--

INSERT INTO `disenio` (`id_disenio`, `fondo_disenio`, `color_disenio`, `imagen_disenio`, `tema`, `fondo`, `imagen`, `fk_id_rol`) VALUES
(1, 0, 1, 'upload/202402141003110001003950656732Ainz.jpg', 2, 2, NULL, 1),
(6, 0, 1, NULL, NULL, NULL, NULL, 0),
(5, 0, 1, NULL, NULL, NULL, NULL, 0),
(10, 4, 1, 'upload/2024021410361300080233192182Apocalipsiss.jpg', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `nombre_empleado` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `apellido_empleado` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_empleado` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `correo_empleado` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `fk_id_rol` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `fk_id_usuario` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`nombre_empleado`, `apellido_empleado`, `telefono_empleado`, `correo_empleado`, `fk_id_rol`, `id_estado`, `fk_id_usuario`) VALUES
('David', 'Cano', '3104133271', 'jesusdavid.canoramirez1@gmail.com', 1, 1, 1003950656),
('Juanchi', 'Pana', '3101234567', 'jesus-42-1@hotmail.com', 0, 0, 1234567891),
('Juanda', 'Camello', '1234567897', 'Jesusdavid.canoramirez@gmail.com', 3, 1, 1234567893),
('Juan', 'Ballen', '3202342525', 'Pru@gmail.com', 3, 1, 80233192);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(10) NOT NULL,
  `estado` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `estado`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_estado`
--

CREATE TABLE `inventario_estado` (
  `id_estado_inventario` int(10) NOT NULL,
  `estado_inventario` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `inventario_estado`
--

INSERT INTO `inventario_estado` (`id_estado_inventario`, `estado_inventario`) VALUES
(1, 'Entrada'),
(2, 'Salida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `fk_id_usuario` int(11) NOT NULL,
  `fk_id_rol` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`fk_id_usuario`, `fk_id_rol`) VALUES
(1003950656, 1),
(1234567891, 2),
(1234567893, 3),
(80233192, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(10) NOT NULL,
  `codigo_producto` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `nombre_producto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio_producto` float NOT NULL,
  `fk_id_categoria` int(10) NOT NULL,
  `descripcion_producto` varchar(5000) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen_producto` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fk_id_estado` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `codigo_producto`, `nombre_producto`, `precio_producto`, `fk_id_categoria`, `descripcion_producto`, `imagen_producto`, `fk_id_estado`) VALUES
(25, '01', 'Diario del fin del mundo', 10000, 30, 'La inusual vida de Carmen, su adicción a las drogas, su estadía en una secta religiosa, su nomadismo como fotógrafa de paisajes desérticos, sus secretos trabajos como modelo de películas porno, serán tanto para Daniel como para Mario muy difíciles de asimilar.', 'productos/2024021410141900068214265ccd8cb7214f7.575258372024021406233100059207665cc4e5317b7f1.53581441Diario.png', 1),
(26, '02', 'El libro de las revelaciones mario', 50000, 30, 'La inconformidad ante el presente y la curiosidad por esa idea ajena llamada futuro señalan el camino del autor, quien teje aquí una red de ensayos, investigaciones y reflexiones para atajar, desde la no ficción, preguntas que nos enfrentan a la fragilidad de ser humanos.', 'productos/2024021410152900046894465ccd9112bd638.398362202024021406221300041697165cc4e051a6795.85466545Libro.jpg', 1),
(27, '03', 'Cronicas de una muerte anunciada', 30000, 32, 'Crónica de una muerte anunciada relata la historia del asesinato de Santiago Nasar, un joven de 21 años, con ascendencia árabe y católico, quien gobernaba la hacienda de su difunto padre y estaba comprometido con Flora Miguel.', 'productos/2024021410165100029335465ccd963dc0373.737408682024021406201500030025265cc4d8fd7e471.91511738cronica.jpg', 1),
(28, '04', 'Harry potther segunda parte', 30000, 30, 'Harry Potter se ha quedado huérfano y vive en casa de sus abominables tíos y del insoportable primo Dudley. Se siente muy triste y solo, hasta que un buen día recibe una carta que cambiará su vida para siempre.', 'productos/2024021410173100021912865ccd98b9957e8.335908242024021406181300087077965cc4d152f7b95.196645912024021310455200043927365cb3a50c34b99.99892899haaaa.jpg', 1),
(29, '05', 'George orwell	', 50000, 31, 'Londres, 1984: Winston Smith decide rebelarse ante un gobierno totalitario que controla cada uno de los movimientos de sus ciudadanos y castiga incluso a aquellos que delinquen con el pensamiento. Consciente de las terribles consecuencias que puede acarrear la disidencia,', 'productos/2024021410180700067461065ccd9afc1ad99.176121042024021406162000014983265cc4ca496f556.291269782024021310362800057213965cb381cca6e38.23490779186.jpg', 1),
(30, '06', 'La isla misteriosa', 52000, 30, 'Tras evadirse en globo de la Guerra de Secesión, cinco americanos, reunidos en torno al ingeniero Cyrus Smith, naufragan logrando llegar a una isla desierta. Los cinco protagonistas cuentan únicamente con su habilidad para sobrevivir.', 'productos/2024021410190200048541765ccd9e6f23473.529731082024021406142500042196365cc4c310fe7d9.76055457Isla.jpg', 1),
(31, '07', 'Multiverso parte dos', 15000, 28, 'Alex Loira, un chico italiano de dieciséis años, cae al suelo desmayado en medio de un partido de baloncesto. En ese mismo momento, Jenny Graver, una chica australiana de la misma edad, también se desvanece en su casa.', 'productos/2024021410195200018797065ccda181e4213.253004632024021406133600044902265cc4c007552d2.26805677Multi1.jpg', 1),
(32, '08', 'Multiverso primera parte	', 65550, 28, 'Alex Loira, un chico italiano de dieciséis años, cae al suelo desmayado en medio de un partido de baloncesto. En ese mismo momento, Jenny Graver, una chica australiana de la misma edad, también se desvanece en su casa.', 'productos/2024021410202400076371665ccda3803f0c2.552990482024021406124100082320665cc4bc94b4425.364659202024021310384100094564565cb38a1651664.69320296Multi.jpg', 1),
(33, '09', 'El fugitivo', 100000, 29, 'A mediados del siglo XXI, un concurso televisivo, cuyo principal atractivo es la muerte de los participantes, bate récords de audiencia. Ben Richards, padre de una niña enferma y sumido en la más profunda miseria, decide concursar atraído por los extraordinarios premios.', 'productos/2024021410221300030041365ccdaa5c36307.087439692024021406113400054454865cc4b8698a769.11138746fuji.jpg', 1),
(34, '10', 'La cupula ', 40000, 29, 'Claudette Sanders disfruta de su clase de vuelo y Dale Barbara, Barbie para los amigos, hace autostop en las afueras. Ninguno de los dos llegará a su destino. De repente, una barrera invisible ha caído sobre la ciudad como una burbuja cristalina e inquebrantable.', 'productos/2024021410224900068342265ccdac95b6428.986239322024021406102600079583565cc4b42041473.71668817cupula.jpg', 1),
(35, '11', 'It stephen king', 50000, 29, 'Varios niños de una pequeña ciudad del estado de Maine se alían para combatir a una entidad diabólica que adopta la forma de un payaso y desde hace mucho tiempo emerge cada 27 años para saciarse de sangre infantil.', 'productos/2024021410232200081576065ccdaea3f5eb7.847813872024021406093900077016565cc4b135e23d2.18647352IT.jpg', 1),
(36, '12', 'Satanas autor mario mendoza', 30000, 32, 'Satanas autor mario mendozacometer un cruel asesinato. Con una prosa que cautiva desde el comienzo, Mario Mendoza sumerge al lector en la ambivalente vida de un individuo que busca liberarse de sus obsesiones.', 'productos/2024021410235700052974665ccdb0dcb9148.852699212024021405315500077437065cc423b0422b0.895343322024021307082700036242265cb075b3e67e7.29193326satanas.jpg', 1),
(37, '13', 'Relato de un asesino', 20000, 30, 'Trata de reconstruir su vida a través de sus memorias para llegar a entender qué lo llevó a cometer un cruel asesinato. Con una prosa que cautiva desde el comienzo, Mario Mendoza sumerge al lector en la ambivalente vida de un individuo que busca liberarse de sus obsesiones.', 'productos/2024021410251800029156965ccdb5e134752.475321272024021406082600088686465cc4aca88ed28.53934818Relato.jpg', 1),
(38, '14', 'Rayuela', 10000, 32, 'El amor turbulento de Oliveira y La Maga, los amigos del Club de la Serpiente, las caminatas por Paría en busca del cielo y el infierno tienen su reverso en la aventura simétrica de Oliveira, Talira y Traveler en un Buenos Aires teñido por el recuerdo.', 'productos/2024021410255600094689665ccdb8455a877.966840522024021406074500044587665cc4aa1422c50.76607498Rayuela.jpg', 1),
(39, '15', 'De la tierra a la luna', 10000, 28, 'En el Gun Club de Baltimore, tres científicos aficionados preparan el mayor salto intentado nunca por los hombres, sirviéndose de un proyectil, que contiene una cabina para los decimonónicos astronautas, y un gigantesco cañón para dispararlo más allá de la atmósfera.', 'productos/2024021410264200067090065ccdbb2343308.696158312024021406070300097622465cc4a7772dd06.60235977tierra.jpg', 1),
(40, '16', 'Viaje al centro de la tierra', 110000, 31, 'El joven Axel y su tío, el profesor Otto, emprenden un viaje fantástico al interior de la Tierra. Y todo ello a partir del descubrimiento de unos signos misteriosos hallados entre las páginas de un libro antiguo. Si quieres la guía didáctica de este libro, la puedes pedir a la editorial.', 'productos/2024021410271700072232565ccdbd5cd7328.004233562024021406062200049317065cc4a4e16e808.87643499Viaje.jpg', 1),
(41, '17', 'El retrato de dorian grey', 30000, 32, 'Dorian Gray es un joven hermoso y un artista decide retratarlo con el fin de inmortalizar su imagen. Al hacerse consciente de su belleza, el joven Dorian desea conservarla para siempre, por lo que es el retrato el que sufre el paso del tiempo.', 'productos/2024021410274300030931165ccdbef9abd11.136106082024021406053200075513065cc4a1c26db48.45438012Retrato.jpg', 1),
(42, '18', 'El visitante autor stephen king', 50000, 30, 'Un niño de once años ha sido brutalmente asesinado. Todas las pruebas apuntan a uno de los ciudadanos más queridos de Flint City: Terry Maitland, entrenador en la liga infantil, profesor de literatura, marido ejemplar y padre de dos niñas. El detective Ralph Anderson ordena su detención.', 'productos/2024021410281100098285565ccdc0b60c224.496891782024021405353400036010165cc4316ac32c1.50653649visitante.jpg', 1),
(43, '19', 'Delirio autora laura restrepo', 20000, 33, 'En Delirio, Restrepo hace hincapié en el pacto de silencio que muchos colombianos firmaron frente a Pablo Escobar a cambio del dinero del narcotráfico. Este pacto, tácito y silencioso, es el telón de fondo que usa Restrepo para dibujar a la sociedad colombiana de mediados de 1980.', 'productos/2024021410285000093156565ccdc322852b5.290956692024021405343900098025665cc42df4e5332.47177180delirio.jpg', 1),
(44, '20', 'Paranormal colombia autor mario mendoza', 10000, 29, 'Diez historias colombianas sobre el vidente que salvó al mejor amigo de un presidente, pero que después se quedó solo sobre el preso travestido que habla con extraterrestres sobre la mujer que fue poseída por el espíritu de Manuelita Sáenz y vio a Simón Bolívar a los ojos.', 'productos/2024021410292100079652665ccdc51297ab6.757392302024021405330000099478065cc427c3e5da8.148607192024021307111500092554465cb0803776be5.50146960paranormal.jpg', 1),
(45, '21', 'Akelarre autor mario mendonza', 40000, 32, 'Un imitador de Jack el Destripador está inmerso en una auténtica orgía de sangre y muerte. Un émulo de Jack el Destripador asesina prostitutas en el barrio Santa Fe y la firma de sus crímenes es una auténtica orgía de sangre.', 'productos/2024021410301200021898965ccdc84c116a4.345901622024021405302600018896465cc41e2570ad4.625878522024021307064600085695265cb06f6907fe8.06977932Akelarre.jpg', 1),
(46, '22', 'Apocalipsis autor mario mendoza ', 10000, 30, 'Una apasionante historia se desata cuando descubre que, en un oscuro y alejado centro para enfermos mentales, vive un hermano suyo del que no tenía noticia, un personaje luminoso que le cambiará la vida para siempre.', 'productos/2024021410340300024870865ccdd6b2f7948.56134250Apocalipsiss.jpg', 1),
(47, '23', 'Scorpio city autor mario mendoza', 40000, 32, 'Un inspector, crímenes, religiosos medievales camuflados en busca del poder, vagabundos y nómadas prehistóricos que viven de los deshechos, y al final las cloacas de la ciudad como lo más íntimo, como el inconsciente donde fluyen y habitan las materias prohibidas de la ciudad.', 'productos/2024021410311400048748065ccdcc23e5f37.842935022024021405270100075209065cc4115d4ba30.554538742024021306311800012211065cafea60baa97.01503930Scorpio.jpg', 1),
(48, '24', 'Harry potther autor j k rowling', 50000, 28, 'En este libro acontece el torneo de los tres magos, una competencia entre tres escuelas de hechicería que logra buscar al mejor de ellas. Por un hecho inesperado, Hogwarts tiene dos campeones para competir, lo cual pone a Harry en medio toda la crítica de sus compañeros, incluso del propio Ron.', 'productos/2024021410314900071459665ccdce51fc700.026840252024021405225700045545565cc402123b981.374663702024021310421700076744265cb3979edfbf6.25064899Harry.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenia`
--

CREATE TABLE `resenia` (
  `id_resenia` int(11) NOT NULL,
  `fk_id_usuario` int(11) NOT NULL,
  `fk_id_producto` int(11) NOT NULL,
  `texto_resenia` varchar(5000) COLLATE utf8_spanish_ci NOT NULL,
  `estrellas_resenia` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `resenia`
--

INSERT INTO `resenia` (`id_resenia`, `fk_id_usuario`, `fk_id_producto`, `texto_resenia`, `estrellas_resenia`) VALUES
(1, 80233192, 48, 'ME PARECE UNA EXCELENTE OBRA, LA CUAL NO SE COMPARA EN NADA CON LOS LIBROS ANTERIORES.', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(10) NOT NULL,
  `rol` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `rol`) VALUES
(1, 'Superadmin'),
(2, 'Administrador'),
(3, 'Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `contrasenia_usuario` varchar(200) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `codigo_usuario` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fk_id_estado` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fk_id_rol` int(11) NOT NULL,
  `fk_id_disenio` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `contrasenia_usuario`, `codigo_usuario`, `fk_id_estado`, `fk_id_rol`, `fk_id_disenio`) VALUES
('1003950656', '9450476b384b32d8ad8b758e76c98a69', NULL, '1', 1, 1),
('1234567891', '9e34a6abbe04da03a9cb2c75883f0765', NULL, '1', 0, 5),
('1234567893', '834d1cb63a03acfe3d4ec81e290258b3', NULL, '1', 3, 6),
('80233192', 'e10adc3949ba59abbe56e057f20f883e', NULL, '1', 3, 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `disenio`
--
ALTER TABLE `disenio`
  ADD PRIMARY KEY (`id_disenio`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD UNIQUE KEY `fk_id_usuario` (`fk_id_usuario`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `id_producto` (`fk_id_producto`);

--
-- Indices de la tabla `inventario_estado`
--
ALTER TABLE `inventario_estado`
  ADD PRIMARY KEY (`id_estado_inventario`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`fk_id_usuario`),
  ADD KEY `FKpermisos42274` (`fk_id_rol`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `FKproducto766931` (`fk_id_estado`);

--
-- Indices de la tabla `resenia`
--
ALTER TABLE `resenia`
  ADD PRIMARY KEY (`id_resenia`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `FKusuario150497` (`fk_id_estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `disenio`
--
ALTER TABLE `disenio`
  MODIFY `id_disenio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `inventario_estado`
--
ALTER TABLE `inventario_estado`
  MODIFY `id_estado_inventario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `resenia`
--
ALTER TABLE `resenia`
  MODIFY `id_resenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
