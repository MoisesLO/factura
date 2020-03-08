-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-03-2020 a las 03:58:12
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `factura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_const_docs`
--

CREATE TABLE `config_const_docs` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `subtipo` varchar(100) DEFAULT NULL,
  `estado` varchar(15) DEFAULT '1',
  `nombre` varchar(100) DEFAULT NULL,
  `abrevia` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `config_const_docs`
--

INSERT INTO `config_const_docs` (`id`, `tipo`, `subtipo`, `estado`, `nombre`, `abrevia`) VALUES
(1, 'factura', 'factura', '1', 'Factura Electronica', 'FF'),
(2, 'factura', 'credito', '1', 'Nota de Credito Electronica ', 'FC'),
(3, 'factura', 'debito', '1', 'Nota de Debito Electronica', 'FD'),
(4, 'boleta', 'boleta', '1', 'Boleta Electronica', 'BB'),
(5, 'boleta', 'credito', '1', 'Nota de Credito Electronica ', 'BC'),
(6, 'boleta', 'debito', '1', 'Nota de Debito Electronica', 'BD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_docs_tipos`
--

CREATE TABLE `config_docs_tipos` (
  `id` int(11) NOT NULL,
  `config_const_doc_id` int(5) DEFAULT NULL,
  `serie` varchar(12) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `numero` varchar(11) DEFAULT '0',
  `defecto` int(2) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `config_docs_tipos`
--

INSERT INTO `config_docs_tipos` (`id`, `config_const_doc_id`, `serie`, `empresa_id`, `numero`, `defecto`) VALUES
(1, 1, 'F001', 13, '10', 1),
(2, 4, 'B001', 13, '1', 1),
(3, 1, 'F002', 13, '0', 0),
(4, 1, 'F003', 13, '0', 0),
(5, 4, 'B002', 13, '0', 0),
(6, 4, 'B003', 13, '0', 0),
(7, 2, 'FN01', 13, '1', 1),
(8, 2, 'FN02', 13, '0', 0),
(9, 2, 'FN03', 13, '0', 0),
(10, 5, 'BN01', 13, '0', 1),
(11, 5, 'BN02', 13, '0', 0),
(12, 5, 'BN03', 13, '0', 0),
(13, 3, 'FD01', 13, '9', 1),
(14, 3, 'FD02', 13, '0', 0),
(15, 3, 'FD03', 13, '0', 0),
(16, 6, 'BD01', 13, '0', 1),
(17, 6, 'BD02', 13, '0', 0),
(18, 6, 'BD03', 13, '0', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docs`
--

CREATE TABLE `docs` (
  `id` int(11) NOT NULL,
  `ruc` varchar(12) DEFAULT NULL,
  `razon` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `serie` varchar(8) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `tipo` varchar(10) DEFAULT '',
  `numero` varchar(12) DEFAULT '',
  `total` decimal(12,2) NOT NULL,
  `estado` int(1) DEFAULT 1,
  `sunat` varchar(8) DEFAULT NULL,
  `cliente_id` varchar(20) DEFAULT NULL,
  `venta_interna` varchar(4) DEFAULT NULL,
  `total_gravadas` decimal(10,2) DEFAULT NULL,
  `total_igv` decimal(10,2) DEFAULT NULL,
  `total_total` decimal(10,2) DEFAULT NULL,
  `referencia_numero` varchar(12) DEFAULT NULL,
  `referencia_serie` varchar(20) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `docs`
--

INSERT INTO `docs` (`id`, `ruc`, `razon`, `direccion`, `serie`, `fecha_emision`, `tipo`, `numero`, `total`, `estado`, `sunat`, `cliente_id`, `venta_interna`, `total_gravadas`, `total_igv`, `total_total`, `referencia_numero`, `referencia_serie`, `usuario_id`) VALUES
(27, '10425162531', 'Surmotriz SRL', 'Leguia 284', 'F001', '2020-02-07', 'factura', '', '0.00', 1, NULL, NULL, '1', '526.57', '115.59', '642.16', NULL, NULL, NULL),
(28, '10425162531', 'surmotriz', 'legia', 'F002', '2020-02-09', 'factura', '2', '0.00', 1, NULL, NULL, '1', '526.57', '115.59', '642.16', NULL, NULL, NULL),
(29, '425162531', 'surmotriz', 'legia', 'F001', '2020-02-09', 'factura', '2', '0.00', 1, '0', NULL, '1', '526.57', '115.59', '642.16', NULL, NULL, NULL),
(30, '10425162531', 'surmo', 'legia', 'F001', '2020-02-09', 'factura', '3', '0.00', 1, '0', NULL, '1', '475.90', '104.47', '580.37', NULL, NULL, NULL),
(31, '10425162531', 'Surmotriz S.R.L.', 'Av. Leguia 580', 'B001', '2020-02-16', 'boleta', '1', '0.00', 1, '0', NULL, '1', '1406.62', '308.77', '1715.39', NULL, NULL, NULL),
(32, '10425162531', 'surmo', 'legia', 'FD01', '2020-02-23', 'debito', '1', '0.00', 1, '0', NULL, '1', '1529.04', '335.65', '1864.69', NULL, NULL, NULL),
(33, '10425162532', 'Surmotriz SRL', 'Leguia 284', 'FN01', '2020-02-24', 'credito', '1', '0.00', 1, '0', NULL, '1', '526.57', '115.59', '642.16', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docs_items`
--

CREATE TABLE `docs_items` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_con_igv` decimal(10,2) DEFAULT NULL,
  `precio_sin_igv` decimal(10,2) DEFAULT NULL,
  `igv` decimal(10,2) DEFAULT NULL,
  `tipo_igv` varchar(10) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `unidad` varchar(10) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `docs_items`
--

INSERT INTO `docs_items` (`id`, `nombre`, `producto_id`, `cantidad`, `precio_con_igv`, `precio_sin_igv`, `igv`, `tipo_igv`, `descuento`, `subtotal`, `total`, `unidad`, `doc_id`) VALUES
(19, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 25),
(20, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 26),
(21, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 27),
(22, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 0),
(23, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 28),
(24, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 29),
(25, 'Dejah Barrows', 115, 1, '580.37', '475.90', '104.47', '1', '0.00', '475.90', '580.37', NULL, 30),
(26, 'Jewell Carroll', 46, 2, '642.16', '526.57', '231.18', '1', '0.00', '1053.14', '1284.32', NULL, 31),
(27, 'Conner Carroll', 171, 1, '431.07', '353.48', '77.59', '0', '0.00', '353.48', '431.07', NULL, 31),
(28, 'Jewell Carroll', 46, 2, '642.16', '526.57', '231.18', '0', '0.00', '1053.14', '1284.32', NULL, 32),
(29, 'Dejah Barrows', 115, 1, '580.37', '475.90', '104.47', '0', '0.00', '475.90', '580.37', NULL, 32),
(30, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 33),
(31, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 0),
(32, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 0),
(33, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 0),
(34, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 0),
(35, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 0),
(36, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 0),
(37, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 0),
(38, 'Jewell Carroll', 46, 1, '642.16', '526.57', '115.59', '1', '0.00', '526.57', '642.16', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) UNSIGNED NOT NULL,
  `ruc` varchar(11) NOT NULL DEFAULT '',
  `razon` varchar(255) NOT NULL DEFAULT '',
  `telefonos` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `ruc`, `razon`, `telefonos`) VALUES
(13, '10425162531', 'surmotriz', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) UNSIGNED NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `unidad_cantidad` varchar(15) DEFAULT NULL,
  `unidad_medida` varchar(15) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_con_igv` decimal(10,2) DEFAULT NULL,
  `precio_sin_igv` decimal(10,2) DEFAULT NULL,
  `igv` decimal(10,2) DEFAULT NULL,
  `tipo_igv` varchar(15) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `descripcion`, `unidad_cantidad`, `unidad_medida`, `cantidad`, `precio_con_igv`, `precio_sin_igv`, `igv`, `tipo_igv`, `descuento`, `subtotal`, `total`) VALUES
(1, 'XS54QFR41Q', 'Miss Dandre Lueilwitz PhD', NULL, NULL, NULL, 93, '641.38', '525.93', '115.45', '2', '0.00', '525.93', '641.38'),
(2, 'D3DP74V3VR', 'Kadin Mueller', NULL, NULL, NULL, 98, '409.13', '335.49', '73.64', '1', '0.00', '335.49', '409.13'),
(3, '6GQ52S0ZR9', 'Mr. Tyrese Rolfson III', NULL, NULL, NULL, 7, '565.22', '463.48', '101.74', '3', '0.00', '463.48', '565.22'),
(4, 'CVP08X879F', 'Trent Huels III', NULL, NULL, NULL, 67, '246.12', '201.82', '44.30', '3', '0.00', '201.82', '246.12'),
(5, '61DYVV9GB7', 'Zachery Beer', NULL, NULL, NULL, 47, '742.98', '609.24', '133.74', '3', '0.00', '609.24', '742.98'),
(6, '86HE0MVMQ1', 'Dr. Derick Ratke DDS', NULL, NULL, NULL, 51, '953.90', '782.20', '171.70', '3', '0.00', '782.20', '953.90'),
(7, '7Z0O1FYEY9', 'Prof. Gillian Schuppe', NULL, NULL, NULL, 36, '560.86', '459.91', '100.95', '3', '0.00', '459.91', '560.86'),
(8, 'SG2N6CO8UZ', 'Tina Lubowitz Sr.', NULL, NULL, NULL, 89, '290.25', '238.01', '52.25', '1', '0.00', '238.01', '290.25'),
(9, 'GO044LEIYC', 'Humberto McGlynn', NULL, NULL, NULL, 40, '155.84', '127.79', '28.05', '2', '0.00', '127.79', '155.84'),
(10, '2BH67WAXNJ', 'Doug Boehm', NULL, NULL, NULL, 41, '936.31', '767.77', '168.54', '2', '0.00', '767.77', '936.31'),
(11, 'S2OP7DTYGJ', 'Julia King', NULL, NULL, NULL, 61, '234.53', '192.31', '42.22', '1', '0.00', '192.31', '234.53'),
(12, 'A38VPRBKKR', 'Dr. Vladimir Connelly', NULL, NULL, NULL, 2, '862.32', '707.10', '155.22', '2', '0.00', '707.10', '862.32'),
(13, 'EF1PZOM204', 'Ms. Rachelle Kreiger MD', NULL, NULL, NULL, 71, '926.45', '759.69', '166.76', '3', '0.00', '759.69', '926.45'),
(14, '0NPXMWMY8G', 'Alanis Terry MD', NULL, NULL, NULL, 98, '298.11', '244.45', '53.66', '2', '0.00', '244.45', '298.11'),
(15, 'PQE510HNRQ', 'Jevon Abernathy', NULL, NULL, NULL, 85, '166.41', '136.46', '29.95', '3', '0.00', '136.46', '166.41'),
(16, 'BJ34990KCJ', 'Tad Lind', NULL, NULL, NULL, 41, '240.39', '197.12', '43.27', '2', '0.00', '197.12', '240.39'),
(17, 'WSBWUPGTEM', 'Tyshawn Rodriguez', NULL, NULL, NULL, 34, '310.20', '254.36', '55.84', '3', '0.00', '254.36', '310.20'),
(18, 'GKPJ04GL6Y', 'Joaquin Muller PhD', NULL, NULL, NULL, 62, '705.88', '578.82', '127.06', '1', '0.00', '578.82', '705.88'),
(19, 'XQRVVDIBUO', 'Alejandrin Glover IV', NULL, NULL, NULL, 44, '210.57', '172.67', '37.90', '2', '0.00', '172.67', '210.57'),
(20, 'CKMHW19ZX9', 'Mrs. Jazmin Brown III', NULL, NULL, NULL, 21, '490.32', '402.06', '88.26', '2', '0.00', '402.06', '490.32'),
(21, '6S15E57KD8', 'Flo Koepp DVM', NULL, NULL, NULL, 25, '96.85', '79.42', '17.43', '2', '0.00', '79.42', '96.85'),
(22, 'LI7AD06KEQ', 'Lafayette Weber DDS', NULL, NULL, NULL, 79, '510.71', '418.78', '91.93', '1', '0.00', '418.78', '510.71'),
(23, '0X4H8AC6D3', 'Prof. Alayna Reilly Jr.', NULL, NULL, NULL, 55, '618.70', '507.33', '111.37', '3', '0.00', '507.33', '618.70'),
(24, '4A37GI02FW', 'Dr. Eric White III', NULL, NULL, NULL, 51, '510.33', '418.47', '91.86', '3', '0.00', '418.47', '510.33'),
(25, '26W2DFYQ48', 'Mrs. Ivory Hahn I', NULL, NULL, NULL, 30, '975.37', '799.80', '175.57', '3', '0.00', '799.80', '975.37'),
(26, 'H39N2IV8DV', 'Abdul Kovacek', NULL, NULL, NULL, 64, '594.38', '487.39', '106.99', '1', '0.00', '487.39', '594.38'),
(27, 'SAPIUP57K0', 'Garnett Cummerata', NULL, NULL, NULL, 58, '929.53', '762.21', '167.32', '1', '0.00', '762.21', '929.53'),
(28, '7418TZ2FMB', 'Dr. Allison Kozey', NULL, NULL, NULL, 9, '89.01', '72.99', '16.02', '1', '0.00', '72.99', '89.01'),
(29, 'MV3QW6TNJY', 'Cletus Hintz', NULL, NULL, NULL, 82, '537.76', '440.96', '96.80', '1', '0.00', '440.96', '537.76'),
(30, 'I104PFGMB6', 'Ms. Kariane Morar IV', NULL, NULL, NULL, 13, '444.73', '364.68', '80.05', '2', '0.00', '364.68', '444.73'),
(31, 'G840J2189T', 'Mohamed Willms', NULL, NULL, NULL, 63, '549.58', '450.66', '98.92', '2', '0.00', '450.66', '549.58'),
(32, 'IC35N33TRA', 'Dock Fadel I', NULL, NULL, NULL, 37, '414.23', '339.67', '74.56', '1', '0.00', '339.67', '414.23'),
(33, 'DBIAFG7VWE', 'Dr. Arvel Predovic', NULL, NULL, NULL, 94, '836.36', '685.82', '150.54', '3', '0.00', '685.82', '836.36'),
(34, 'Q45VJ20Q3F', 'Destin Glover', NULL, NULL, NULL, 31, '999.07', '819.24', '179.83', '1', '0.00', '819.24', '999.07'),
(35, 'IDGHE0U4XO', 'Gabriella Quitzon', NULL, NULL, NULL, 40, '466.28', '382.35', '83.93', '1', '0.00', '382.35', '466.28'),
(36, 'ZP6L3M26ZU', 'Prof. Lois Littel', NULL, NULL, NULL, 1, '711.06', '583.07', '127.99', '2', '0.00', '583.07', '711.06'),
(37, 'SE7C6HL716', 'Prof. Hollis Will', NULL, NULL, NULL, 16, '460.15', '377.32', '82.83', '1', '0.00', '377.32', '460.15'),
(38, 'ELQACEL9OR', 'Dr. Vincent Schmidt DVM', NULL, NULL, NULL, 44, '445.80', '365.56', '80.24', '3', '0.00', '365.56', '445.80'),
(39, 'B2DBDKE4TJ', 'Helen Goldner', NULL, NULL, NULL, 69, '900.03', '738.02', '162.01', '2', '0.00', '738.02', '900.03'),
(40, 'E3VVUGR3QR', 'Dr. Alexandro Koss IV', NULL, NULL, NULL, 46, '225.77', '185.13', '40.64', '1', '0.00', '185.13', '225.77'),
(41, 'B4EW8PCHHU', 'Myrl Bauch', NULL, NULL, NULL, 96, '198.10', '162.44', '35.66', '1', '0.00', '162.44', '198.10'),
(42, 'Q54T0YTYML', 'Prof. Iliana Kozey', NULL, NULL, NULL, 45, '703.69', '577.03', '126.66', '1', '0.00', '577.03', '703.69'),
(43, 'HAPL8TMY8A', 'Dr. Emmalee Gaylord', NULL, NULL, NULL, 65, '725.92', '595.25', '130.67', '2', '0.00', '595.25', '725.92'),
(44, 'K1Y2AJERJI', 'Morton Schroeder III', NULL, NULL, NULL, 100, '115.36', '94.60', '20.76', '3', '0.00', '94.60', '115.36'),
(45, 'AOXOA9JVAQ', 'Jamir Fisher', NULL, NULL, NULL, 16, '57.08', '46.81', '10.27', '2', '0.00', '46.81', '57.08'),
(46, 'DPJ25XNAYH', 'Jewell Carroll', NULL, NULL, NULL, 24, '642.16', '526.57', '115.59', '2', '0.00', '526.57', '642.16'),
(47, 'U1Y33O283P', 'Constance Ward', NULL, NULL, NULL, 84, '243.48', '199.65', '43.83', '3', '0.00', '199.65', '243.48'),
(48, 'R2KBJI5SYL', 'Bella Kshlerin', NULL, NULL, NULL, 45, '469.70', '385.15', '84.55', '2', '0.00', '385.15', '469.70'),
(49, 'XQCXZ7GTML', 'Lina Greenfelder', NULL, NULL, NULL, 98, '371.00', '304.22', '66.78', '3', '0.00', '304.22', '371.00'),
(50, '154MFPYIM8', 'Noelia Pagac DDS', NULL, NULL, NULL, 18, '635.54', '521.14', '114.40', '2', '0.00', '521.14', '635.54'),
(51, 'GSQTGHTW19', 'Maggie Jones II', NULL, NULL, NULL, 58, '761.84', '624.71', '137.13', '2', '0.00', '624.71', '761.84'),
(52, 'XUZWPLBQFV', 'Cassandre Rogahn PhD', NULL, NULL, NULL, 42, '660.82', '541.87', '118.95', '1', '0.00', '541.87', '660.82'),
(53, '0G4QFDX7S4', 'Prof. Frederique Bartoletti Sr.', NULL, NULL, NULL, 33, '687.67', '563.89', '123.78', '1', '0.00', '563.89', '687.67'),
(54, 'J8L7TBAS8P', 'Vladimir Kemmer', NULL, NULL, NULL, 63, '602.28', '493.87', '108.41', '2', '0.00', '493.87', '602.28'),
(55, 'JISLRTC8VX', 'Nicole Rodriguez', NULL, NULL, NULL, 28, '546.11', '447.81', '98.30', '2', '0.00', '447.81', '546.11'),
(56, 'KSW73PQNLP', 'Libbie Franecki', NULL, NULL, NULL, 94, '750.36', '615.30', '135.06', '3', '0.00', '615.30', '750.36'),
(57, 'JPL17M0HL2', 'Mr. Arno Hartmann', NULL, NULL, NULL, 21, '590.15', '483.92', '106.23', '1', '0.00', '483.92', '590.15'),
(58, 'V23N2IF9KX', 'Miss Velma Kerluke I', NULL, NULL, NULL, 34, '841.68', '690.18', '151.50', '3', '0.00', '690.18', '841.68'),
(59, 'VZH5GFQ3UH', 'Jerrell Tillman DDS', NULL, NULL, NULL, 43, '697.66', '572.08', '125.58', '3', '0.00', '572.08', '697.66'),
(60, 'ITU5T4BPTB', 'Mrs. May Rowe', NULL, NULL, NULL, 85, '322.44', '264.40', '58.04', '2', '0.00', '264.40', '322.44'),
(61, 'K8R1Z3EBIU', 'Miss Angie Adams DDS', NULL, NULL, NULL, 73, '553.63', '453.98', '99.65', '3', '0.00', '453.98', '553.63'),
(62, '2Q8RHCOQGY', 'Mrs. Araceli Marquardt', NULL, NULL, NULL, 78, '872.98', '715.84', '157.14', '3', '0.00', '715.84', '872.98'),
(63, '7K6DA4DTAG', 'Mrs. Elinor Feeney II', NULL, NULL, NULL, 62, '139.61', '114.48', '25.13', '2', '0.00', '114.48', '139.61'),
(64, 'WA8RWNYFF7', 'Miss Savanna Ryan', NULL, NULL, NULL, 51, '697.92', '572.29', '125.63', '3', '0.00', '572.29', '697.92'),
(65, 'KTWS8QBRDJ', 'Shanel Marquardt', NULL, NULL, NULL, 25, '229.44', '188.14', '41.30', '2', '0.00', '188.14', '229.44'),
(66, 'EDOURV8ER8', 'Adrien Goodwin I', NULL, NULL, NULL, 18, '403.23', '330.65', '72.58', '2', '0.00', '330.65', '403.23'),
(67, 'SEDH287HS8', 'Gaylord Ratke', NULL, NULL, NULL, 68, '418.05', '342.80', '75.25', '2', '0.00', '342.80', '418.05'),
(68, 'NLIFHS7J9I', 'Rick McCullough', NULL, NULL, NULL, 49, '915.32', '750.56', '164.76', '1', '0.00', '750.56', '915.32'),
(69, '3HP8P4IWWG', 'Jamarcus Torphy', NULL, NULL, NULL, 57, '373.73', '306.46', '67.27', '2', '0.00', '306.46', '373.73'),
(70, 'MP4OBVQPPD', 'Raymundo Padberg V', NULL, NULL, NULL, 32, '154.71', '126.86', '27.85', '2', '0.00', '126.86', '154.71'),
(71, 'S0VQ7GCZ1I', 'Dr. Lavinia Thompson', NULL, NULL, NULL, 96, '71.72', '58.81', '12.91', '3', '0.00', '58.81', '71.72'),
(72, 'CYKGJ49NJO', 'Zaria Kiehn', NULL, NULL, NULL, 74, '786.61', '645.02', '141.59', '3', '0.00', '645.02', '786.61'),
(73, 'GLJ6M1VLPL', 'Zetta Shields', NULL, NULL, NULL, 38, '883.11', '724.15', '158.96', '1', '0.00', '724.15', '883.11'),
(74, '9MEKUUE2MO', 'Elwin Armstrong', NULL, NULL, NULL, 46, '182.11', '149.33', '32.78', '1', '0.00', '149.33', '182.11'),
(75, 'X3I8F2F2V7', 'Simone Hirthe', NULL, NULL, NULL, 39, '662.34', '543.12', '119.22', '3', '0.00', '543.12', '662.34'),
(76, 'K9SBTGIVGG', 'Zetta Greenholt', NULL, NULL, NULL, 49, '894.19', '733.24', '160.95', '3', '0.00', '733.24', '894.19'),
(77, 'F134KNEND0', 'Freeman Ryan', NULL, NULL, NULL, 32, '47.41', '38.88', '8.53', '3', '0.00', '38.88', '47.41'),
(78, 'LXDNRB4883', 'Cara Lueilwitz', NULL, NULL, NULL, 39, '842.11', '690.53', '151.58', '2', '0.00', '690.53', '842.11'),
(79, 'WRY3UDSJD2', 'Joe Lesch', NULL, NULL, NULL, 77, '405.30', '332.35', '72.95', '3', '0.00', '332.35', '405.30'),
(80, 'EXDNLG7VTP', 'Brigitte Tremblay', NULL, NULL, NULL, 79, '751.66', '616.36', '135.30', '1', '0.00', '616.36', '751.66'),
(81, 'NL1ZZCLSOG', 'Shakira McCullough', NULL, NULL, NULL, 76, '931.21', '763.59', '167.62', '3', '0.00', '763.59', '931.21'),
(82, 'LAOEBCUTNL', 'Prof. Braulio Dare', NULL, NULL, NULL, 43, '25.04', '20.53', '4.51', '1', '0.00', '20.53', '25.04'),
(83, '4FM056Q3LX', 'Dr. Ozella Adams', NULL, NULL, NULL, 88, '47.25', '38.75', '8.51', '1', '0.00', '38.75', '47.25'),
(84, 'YHESPSVY8L', 'Mr. Deven Kozey', NULL, NULL, NULL, 33, '530.27', '434.82', '95.45', '3', '0.00', '434.82', '530.27'),
(85, 'V4ZLCM7LZF', 'Heath Collier', NULL, NULL, NULL, 71, '840.25', '689.01', '151.25', '1', '0.00', '689.01', '840.25'),
(86, '639RV7VO1M', 'Rhianna Kertzmann', NULL, NULL, NULL, 97, '955.25', '783.31', '171.95', '1', '0.00', '783.31', '955.25'),
(87, 'Z4WFZHGFDO', 'Olin Borer', NULL, NULL, NULL, 63, '418.14', '342.87', '75.27', '1', '0.00', '342.87', '418.14'),
(88, 'RTZ4O4V90Z', 'Domenica Keeling', NULL, NULL, NULL, 100, '161.41', '132.36', '29.05', '1', '0.00', '132.36', '161.41'),
(89, 'ZSA7JH2R61', 'Griffin Bednar', NULL, NULL, NULL, 99, '303.22', '248.64', '54.58', '3', '0.00', '248.64', '303.22'),
(90, '7ZU6Q5C9QY', 'Mr. Ceasar Hartmann Jr.', NULL, NULL, NULL, 21, '785.85', '644.40', '141.45', '3', '0.00', '644.40', '785.85'),
(91, 'SSMVFURJ27', 'Dewayne Mayert II', NULL, NULL, NULL, 45, '932.50', '764.65', '167.85', '3', '0.00', '764.65', '932.50'),
(92, '2Q5SS8T1SS', 'Dr. Cullen Waelchi', NULL, NULL, NULL, 91, '255.77', '209.73', '46.04', '3', '0.00', '209.73', '255.77'),
(93, 'JEVOA8RJ8E', 'Dr. Laurence Walter II', NULL, NULL, NULL, 46, '520.53', '426.83', '93.70', '1', '0.00', '426.83', '520.53'),
(94, 'D2F5H4QAHF', 'Johnnie Corkery', NULL, NULL, NULL, 42, '806.07', '660.98', '145.09', '1', '0.00', '660.98', '806.07'),
(95, '03XF96DIEA', 'Lambert Murazik', NULL, NULL, NULL, 65, '893.96', '733.05', '160.91', '2', '0.00', '733.05', '893.96'),
(96, '05Z2SXRW1W', 'Herbert Runte', NULL, NULL, NULL, 32, '820.39', '672.72', '147.67', '2', '0.00', '672.72', '820.39'),
(97, 'O0U2QRMID4', 'Dr. Danielle Kemmer I', NULL, NULL, NULL, 76, '524.79', '430.33', '94.46', '1', '0.00', '430.33', '524.79'),
(98, 'L6FW17VOV2', 'Lyla Labadie', NULL, NULL, NULL, 32, '469.77', '385.21', '84.56', '2', '0.00', '385.21', '469.77'),
(99, 'UEH425UN5X', 'Miss Maryse Kovacek', NULL, NULL, NULL, 63, '386.88', '317.24', '69.64', '2', '0.00', '317.24', '386.88'),
(100, 'ELGAS29LJT', 'Prof. Gust Herzog', NULL, NULL, NULL, 79, '510.58', '418.68', '91.90', '3', '0.00', '418.68', '510.58'),
(101, '76K83C03QY', 'Elijah Torp', NULL, NULL, NULL, 72, '265.87', '218.01', '47.86', '3', '0.00', '218.01', '265.87'),
(102, '43BQGOGOB7', 'Gladyce Lesch III', NULL, NULL, NULL, 90, '867.26', '711.15', '156.11', '2', '0.00', '711.15', '867.26'),
(103, 'MZKKR2XZMX', 'Arjun Von', NULL, NULL, NULL, 28, '918.45', '753.13', '165.32', '1', '0.00', '753.13', '918.45'),
(104, 'NE02YFI1OH', 'Mrs. Lilla Heaney', NULL, NULL, NULL, 72, '926.95', '760.10', '166.85', '2', '0.00', '760.10', '926.95'),
(105, 'VI5VKIBIAO', 'Mr. Lorenz Thompson DVM', NULL, NULL, NULL, 15, '937.63', '768.86', '168.77', '1', '0.00', '768.86', '937.63'),
(106, 'Q827GRL83J', 'Aidan Cronin', NULL, NULL, NULL, 45, '711.00', '583.02', '127.98', '3', '0.00', '583.02', '711.00'),
(107, '932PDHXDK1', 'Mr. Monroe Kunde', NULL, NULL, NULL, 76, '668.53', '548.19', '120.34', '1', '0.00', '548.19', '668.53'),
(108, '3W117A7LLR', 'Jessika Schimmel PhD', NULL, NULL, NULL, 40, '771.53', '632.65', '138.88', '3', '0.00', '632.65', '771.53'),
(109, 'K2YSWBL2ZR', 'Mr. Nicklaus Kuphal II', NULL, NULL, NULL, 5, '590.96', '484.59', '106.37', '2', '0.00', '484.59', '590.96'),
(110, '1YA8724PRJ', 'Ms. Jazmin Jacobi', NULL, NULL, NULL, 87, '544.33', '446.35', '97.98', '2', '0.00', '446.35', '544.33'),
(111, 'UUYOR2D3H6', 'Dr. Marielle Rohan', NULL, NULL, NULL, 59, '488.37', '400.46', '87.91', '1', '0.00', '400.46', '488.37'),
(112, 'OFXL9VP762', 'Newton Goyette', NULL, NULL, NULL, 66, '378.63', '310.48', '68.15', '2', '0.00', '310.48', '378.63'),
(113, 'I630KJAZRN', 'Makenna Crist', NULL, NULL, NULL, 89, '873.20', '716.02', '157.18', '3', '0.00', '716.02', '873.20'),
(114, 'H80Q8V9XW7', 'Dr. Talon Pacocha', NULL, NULL, NULL, 59, '962.08', '788.91', '173.17', '1', '0.00', '788.91', '962.08'),
(115, 'K05QFPJ5FF', 'Dejah Barrows', NULL, NULL, NULL, 26, '580.37', '475.90', '104.47', '2', '0.00', '475.90', '580.37'),
(116, 'WN92MMUKAF', 'Dr. Robert Cruickshank IV', NULL, NULL, NULL, 11, '721.68', '591.78', '129.90', '1', '0.00', '591.78', '721.68'),
(117, 'NSPYP4DU2I', 'Mrs. Palma Bradtke', NULL, NULL, NULL, 29, '905.83', '742.78', '163.05', '1', '0.00', '742.78', '905.83'),
(118, '5ID6VZ3Y6J', 'Jaunita Howe', NULL, NULL, NULL, 3, '4.55', '3.73', '0.82', '3', '0.00', '3.73', '4.55'),
(119, 'TS46ONCLVY', 'Alycia Johnson', NULL, NULL, NULL, 31, '546.67', '448.27', '98.40', '2', '0.00', '448.27', '546.67'),
(120, 'WS19VWXWD7', 'Dr. Gerda Abernathy', NULL, NULL, NULL, 52, '157.87', '129.45', '28.42', '2', '0.00', '129.45', '157.87'),
(121, '28PW1A46UC', 'Prof. Lourdes Bednar II', NULL, NULL, NULL, 87, '440.29', '361.04', '79.25', '2', '0.00', '361.04', '440.29'),
(122, 'S6XAWNG1KS', 'Peyton Carroll', NULL, NULL, NULL, 22, '139.48', '114.37', '25.11', '1', '0.00', '114.37', '139.48'),
(123, 'F0AZNHFLTX', 'Benjamin Yost', NULL, NULL, NULL, 24, '42.38', '34.75', '7.63', '1', '0.00', '34.75', '42.38'),
(124, '7FM62AEOY3', 'Guido Leuschke', NULL, NULL, NULL, 59, '676.34', '554.60', '121.74', '1', '0.00', '554.60', '676.34'),
(125, 'DHM2SB716Q', 'Rita Klein', NULL, NULL, NULL, 14, '491.75', '403.24', '88.52', '2', '0.00', '403.24', '491.75'),
(126, 'VFV5YZKFUD', 'Prof. Isaac Satterfield IV', NULL, NULL, NULL, 41, '165.46', '135.68', '29.78', '2', '0.00', '135.68', '165.46'),
(127, 'E66F4XX16T', 'Nick Yost', NULL, NULL, NULL, 49, '550.86', '451.71', '99.15', '1', '0.00', '451.71', '550.86'),
(128, '5O6DVTJNTW', 'Wilhelmine Okuneva Jr.', NULL, NULL, NULL, 73, '924.91', '758.43', '166.48', '1', '0.00', '758.43', '924.91'),
(129, '7SYFRX97LD', 'Weston Padberg', NULL, NULL, NULL, 85, '68.59', '56.24', '12.35', '3', '0.00', '56.24', '68.59'),
(130, '6APJEVL9F9', 'Jeffery Donnelly', NULL, NULL, NULL, 60, '502.36', '411.94', '90.42', '2', '0.00', '411.94', '502.36'),
(131, 'VDZ2T2CPAR', 'Serena Reilly', NULL, NULL, NULL, 18, '617.50', '506.35', '111.15', '3', '0.00', '506.35', '617.50'),
(132, 'GHZ096PEC6', 'Ms. Mckayla Schulist Sr.', NULL, NULL, NULL, 43, '347.28', '284.77', '62.51', '2', '0.00', '284.77', '347.28'),
(133, 'FSY2LHSX7B', 'Fabian Jast Sr.', NULL, NULL, NULL, 81, '744.37', '610.38', '133.99', '3', '0.00', '610.38', '744.37'),
(134, 'YDKTZ676TM', 'Daryl Cassin', NULL, NULL, NULL, 53, '943.75', '773.88', '169.88', '2', '0.00', '773.88', '943.75'),
(135, '33P4CNY8W0', 'Camron Langworth', NULL, NULL, NULL, 63, '883.96', '724.85', '159.11', '1', '0.00', '724.85', '883.96'),
(136, '37K9UEX7DU', 'Micheal Raynor', NULL, NULL, NULL, 37, '158.95', '130.34', '28.61', '2', '0.00', '130.34', '158.95'),
(137, '0290C2AJ0C', 'Dr. Casper Kling', NULL, NULL, NULL, 10, '969.18', '794.73', '174.45', '2', '0.00', '794.73', '969.18'),
(138, 'SR6DMQOPZ0', 'Alisa Cole', NULL, NULL, NULL, 18, '396.52', '325.15', '71.37', '2', '0.00', '325.15', '396.52'),
(139, 'L6IAP8TOX3', 'Miss Josianne Hirthe IV', NULL, NULL, NULL, 65, '531.28', '435.65', '95.63', '1', '0.00', '435.65', '531.28'),
(140, 'FFFZFZYS43', 'Dr. Cordell Leannon MD', NULL, NULL, NULL, 97, '189.40', '155.31', '34.09', '1', '0.00', '155.31', '189.40'),
(141, '08WREL9XOQ', 'Prof. Karine Hand', NULL, NULL, NULL, 46, '46.90', '38.46', '8.44', '2', '0.00', '38.46', '46.90'),
(142, 'YZ384O8MY1', 'Prof. Rita Gusikowski', NULL, NULL, NULL, 59, '804.30', '659.53', '144.77', '3', '0.00', '659.53', '804.30'),
(143, '5YHI2ZZA5D', 'Gregory Stoltenberg', NULL, NULL, NULL, 13, '804.66', '659.82', '144.84', '1', '0.00', '659.82', '804.66'),
(144, 'SG544NOC74', 'Irma Wunsch', NULL, NULL, NULL, 72, '7.27', '5.96', '1.31', '3', '0.00', '5.96', '7.27'),
(145, 'ZG8OA1MW25', 'Solon Koch III', NULL, NULL, NULL, 41, '965.54', '791.74', '173.80', '2', '0.00', '791.74', '965.54'),
(146, 'UJ24PA12UR', 'Marshall Rutherford', NULL, NULL, NULL, 14, '96.76', '79.34', '17.42', '2', '0.00', '79.34', '96.76'),
(147, 'F1D9G6XP55', 'Rhea Turcotte', NULL, NULL, NULL, 93, '354.88', '291.00', '63.88', '2', '0.00', '291.00', '354.88'),
(148, '4LYL5ZARSG', 'Oswald Hirthe', NULL, NULL, NULL, 90, '2.76', '2.26', '0.50', '1', '0.00', '2.26', '2.76'),
(149, 'HL5AB0NDS9', 'Nestor Schneider', NULL, NULL, NULL, 20, '314.99', '258.29', '56.70', '1', '0.00', '258.29', '314.99'),
(150, '90M7GG1JD1', 'Gilda Von', NULL, NULL, NULL, 40, '808.14', '662.67', '145.47', '1', '0.00', '662.67', '808.14'),
(151, 'CSWIS9THHH', 'Susanna White', NULL, NULL, NULL, 15, '648.99', '532.17', '116.82', '3', '0.00', '532.17', '648.99'),
(152, 'JS0IFH7N8E', 'Oscar Pfannerstill', NULL, NULL, NULL, 55, '980.14', '803.71', '176.43', '2', '0.00', '803.71', '980.14'),
(153, 'QC85QDVLIH', 'Kaci Greenholt', NULL, NULL, NULL, 21, '175.69', '144.07', '31.62', '2', '0.00', '144.07', '175.69'),
(154, 'TVJ1OOKZVY', 'Prof. Aniya Walsh Sr.', NULL, NULL, NULL, 7, '744.88', '610.80', '134.08', '3', '0.00', '610.80', '744.88'),
(155, 'E6ZR9C5XL8', 'Chester Veum', NULL, NULL, NULL, 58, '489.17', '401.12', '88.05', '2', '0.00', '401.12', '489.17'),
(156, '42MR7S6MWW', 'Armand Kuvalis MD', NULL, NULL, NULL, 1, '568.57', '466.23', '102.34', '3', '0.00', '466.23', '568.57'),
(157, 'LLB3F0DF16', 'Bertram Smitham', NULL, NULL, NULL, 34, '148.15', '121.48', '26.67', '3', '0.00', '121.48', '148.15'),
(158, '0TTSAVBZYD', 'Alaina Stark', NULL, NULL, NULL, 3, '602.04', '493.67', '108.37', '1', '0.00', '493.67', '602.04'),
(159, 'VKVSXBQK31', 'Ms. Linnie Gerhold', NULL, NULL, NULL, 21, '406.03', '332.94', '73.09', '3', '0.00', '332.94', '406.03'),
(160, '4ERUKSGFQG', 'Keagan Trantow Jr.', NULL, NULL, NULL, 6, '614.49', '503.88', '110.61', '3', '0.00', '503.88', '614.49'),
(161, '7RTL55YXNQ', 'Kareem Volkman', NULL, NULL, NULL, 96, '139.25', '114.19', '25.07', '2', '0.00', '114.19', '139.25'),
(162, 'AGW2NE7UUO', 'Ms. Pink Heller PhD', NULL, NULL, NULL, 1, '237.98', '195.14', '42.84', '1', '0.00', '195.14', '237.98'),
(163, '2V6LX3ORFY', 'Freddy Monahan', NULL, NULL, NULL, 70, '133.18', '109.21', '23.97', '2', '0.00', '109.21', '133.18'),
(164, 'HMWOYLEJXR', 'Gayle Sanford', NULL, NULL, NULL, 78, '657.95', '539.52', '118.43', '3', '0.00', '539.52', '657.95'),
(165, 'Z0MH39REDH', 'Elva Wiza III', NULL, NULL, NULL, 7, '888.97', '728.96', '160.01', '2', '0.00', '728.96', '888.97'),
(166, 'KW5BCMGMJF', 'Floy Gleichner DDS', NULL, NULL, NULL, 27, '236.66', '194.06', '42.60', '3', '0.00', '194.06', '236.66'),
(167, '96UHK4WMAS', 'Kiana Mueller', NULL, NULL, NULL, 67, '404.28', '331.51', '72.77', '2', '0.00', '331.51', '404.28'),
(168, 'I9NGWYGVS1', 'Dina Dickens', NULL, NULL, NULL, 13, '96.44', '79.08', '17.36', '2', '0.00', '79.08', '96.44'),
(169, '1PEIXGV8XB', 'Dr. Oliver Rohan', NULL, NULL, NULL, 54, '403.32', '330.72', '72.60', '1', '0.00', '330.72', '403.32'),
(170, 'PBZQEAEZSO', 'Franz Bode', NULL, NULL, NULL, 13, '169.81', '139.24', '30.57', '3', '0.00', '139.24', '169.81'),
(171, 'TPXVI6IPZN', 'Conner Carroll', NULL, NULL, NULL, 6, '431.07', '353.48', '77.59', '3', '0.00', '353.48', '431.07'),
(172, 'W6H0H111YV', 'Mariah Hand Jr.', NULL, NULL, NULL, 19, '888.80', '728.82', '159.98', '1', '0.00', '728.82', '888.80'),
(173, 'EOSVQ6TVL0', 'Aiyana Padberg', NULL, NULL, NULL, 2, '448.77', '367.99', '80.78', '2', '0.00', '367.99', '448.77'),
(174, 'M7FT7NQGU6', 'Martine Mayert', NULL, NULL, NULL, 56, '289.89', '237.71', '52.18', '3', '0.00', '237.71', '289.89'),
(175, 'MU6NY7KQ66', 'Margret Kuvalis', NULL, NULL, NULL, 77, '820.65', '672.93', '147.72', '1', '0.00', '672.93', '820.65'),
(176, '3ZFXEW2HRT', 'Mr. Gunnar Purdy', NULL, NULL, NULL, 33, '793.33', '650.53', '142.80', '1', '0.00', '650.53', '793.33'),
(177, 'D8VC4OQCBC', 'Brionna Larson IV', NULL, NULL, NULL, 69, '462.80', '379.50', '83.30', '3', '0.00', '379.50', '462.80'),
(178, 'W7Y4H158CP', 'Mr. Keyon Schneider DVM', NULL, NULL, NULL, 17, '143.99', '118.07', '25.92', '3', '0.00', '118.07', '143.99'),
(179, '4OHF015P8A', 'Tyree Swaniawski II', NULL, NULL, NULL, 37, '524.71', '430.26', '94.45', '2', '0.00', '430.26', '524.71'),
(180, '2TXFA5DST1', 'Mr. Wiley Green V', NULL, NULL, NULL, 60, '627.21', '514.31', '112.90', '2', '0.00', '514.31', '627.21'),
(181, 'LEZV1RL12X', 'Madonna Reichert DDS', NULL, NULL, NULL, 81, '289.78', '237.62', '52.16', '1', '0.00', '237.62', '289.78'),
(182, 'GW9NN881NB', 'Zachariah Dickens', NULL, NULL, NULL, 31, '326.01', '267.33', '58.68', '2', '0.00', '267.33', '326.01'),
(183, 'DQYURNH2HL', 'Thad Dickens', NULL, NULL, NULL, 17, '86.33', '70.79', '15.54', '1', '0.00', '70.79', '86.33'),
(184, '2WSC84BPIA', 'Roberto Zulauf', NULL, NULL, NULL, 14, '87.53', '71.77', '15.76', '2', '0.00', '71.77', '87.53'),
(185, '4THXKPZP3Q', 'Ilene Rutherford', NULL, NULL, NULL, 19, '123.75', '101.48', '22.28', '1', '0.00', '101.48', '123.75'),
(186, '6XUAE655YO', 'Dakota Cartwright', NULL, NULL, NULL, 83, '983.47', '806.45', '177.02', '1', '0.00', '806.45', '983.47'),
(187, 'WSKDMXEHMS', 'Nickolas Upton', NULL, NULL, NULL, 19, '574.85', '471.38', '103.47', '2', '0.00', '471.38', '574.85'),
(188, 'U5HM6FDZZQ', 'Maybelle Miller', NULL, NULL, NULL, 99, '805.87', '660.81', '145.06', '2', '0.00', '660.81', '805.87'),
(189, '1J6UTR1JY2', 'Akeem Stark', NULL, NULL, NULL, 30, '566.43', '464.47', '101.96', '3', '0.00', '464.47', '566.43'),
(190, 'WO4F6B76S3', 'Stephanie Schimmel', NULL, NULL, NULL, 1, '631.01', '517.43', '113.58', '2', '0.00', '517.43', '631.01'),
(191, 'Y1YBW5E5EJ', 'Oma Upton', NULL, NULL, NULL, 37, '143.05', '117.30', '25.75', '1', '0.00', '117.30', '143.05'),
(192, '80KJ0ZP5YM', 'Robyn Mohr', NULL, NULL, NULL, 21, '292.87', '240.15', '52.72', '2', '0.00', '240.15', '292.87'),
(193, 'FTZUHKCD4S', 'Magdalena Stroman PhD', NULL, NULL, NULL, 1, '915.68', '750.86', '164.82', '1', '0.00', '750.86', '915.68'),
(194, 'IOMIB1RK02', 'Mrs. Maggie Fadel II', NULL, NULL, NULL, 91, '737.40', '604.67', '132.73', '2', '0.00', '604.67', '737.40'),
(195, 'FOW6CNX911', 'Prof. Santos Corkery', NULL, NULL, NULL, 94, '296.37', '243.02', '53.35', '3', '0.00', '243.02', '296.37'),
(196, 'J4JUX7ROO2', 'Julius Konopelski I', NULL, NULL, NULL, 72, '562.47', '461.23', '101.24', '1', '0.00', '461.23', '562.47'),
(197, '3SFVCMZK1V', 'Dr. Beulah Pfeffer', NULL, NULL, NULL, 65, '256.37', '210.22', '46.15', '2', '0.00', '210.22', '256.37'),
(198, 'JDR6G3AZID', 'Brett Ernser', NULL, NULL, NULL, 71, '638.20', '523.32', '114.88', '2', '0.00', '523.32', '638.20'),
(199, 'I777GEVIOU', 'Caitlyn Gibson', NULL, NULL, NULL, 84, '855.90', '701.84', '154.06', '2', '0.00', '701.84', '855.90'),
(200, 'G19L048Y74', 'Isom Wolff', NULL, NULL, NULL, 10, '520.95', '427.18', '93.77', '1', '0.00', '427.18', '520.95'),
(201, 'NLGUZKDAHN', 'Hilton Hansen V', NULL, NULL, NULL, 80, '856.18', '702.07', '154.11', '3', '0.00', '702.07', '856.18'),
(202, '16BB39439B', 'Devan Prosacco', NULL, NULL, NULL, 99, '741.35', '607.91', '133.44', '2', '0.00', '607.91', '741.35'),
(203, 'GJQ4EI3T0G', 'Peyton Blanda', NULL, NULL, NULL, 24, '342.42', '280.78', '61.64', '3', '0.00', '280.78', '342.42'),
(204, 'UY8LATDW5Y', 'Kailyn Gibson', NULL, NULL, NULL, 88, '661.39', '542.34', '119.05', '1', '0.00', '542.34', '661.39'),
(205, 'IC1VJD7TQO', 'Vicente Huels Jr.', NULL, NULL, NULL, 84, '996.40', '817.05', '179.35', '2', '0.00', '817.05', '996.40'),
(206, '9NVYTWELX6', 'Hilbert Koelpin', NULL, NULL, NULL, 4, '873.19', '716.02', '157.17', '2', '0.00', '716.02', '873.19'),
(207, 'J74EW42HSR', 'Prof. Aurore Pouros IV', NULL, NULL, NULL, 98, '361.73', '296.62', '65.11', '2', '0.00', '296.62', '361.73'),
(208, 'GEKR3UU6VL', 'Mr. Morgan Quigley DVM', NULL, NULL, NULL, 1, '337.66', '276.88', '60.78', '3', '0.00', '276.88', '337.66'),
(209, 'PKD10KU46G', 'Emmalee Tillman', NULL, NULL, NULL, 70, '724.54', '594.12', '130.42', '3', '0.00', '594.12', '724.54'),
(210, '4CU9KRPJ41', 'Miss Otha Cassin', NULL, NULL, NULL, 25, '524.83', '430.36', '94.47', '1', '0.00', '430.36', '524.83'),
(211, 'SFLWG5E4DB', 'Avery Davis', NULL, NULL, NULL, 4, '605.57', '496.57', '109.00', '2', '0.00', '496.57', '605.57'),
(212, 'N9ZEX39DLE', 'Damian Okuneva', NULL, NULL, NULL, 21, '948.37', '777.66', '170.71', '3', '0.00', '777.66', '948.37'),
(213, '1PTNJV7PYV', 'Dr. Solon Grimes', NULL, NULL, NULL, 40, '619.56', '508.04', '111.52', '3', '0.00', '508.04', '619.56'),
(214, 'ZHB7MDCANO', 'Kristin Borer', NULL, NULL, NULL, 78, '558.96', '458.35', '100.61', '1', '0.00', '458.35', '558.96'),
(215, 'TF285CFJLX', 'Mr. Forest Kreiger PhD', NULL, NULL, NULL, 24, '12.24', '10.04', '2.20', '1', '0.00', '10.04', '12.24'),
(216, 'CGC3GC39AZ', 'Brock Berge', NULL, NULL, NULL, 95, '542.00', '444.44', '97.56', '3', '0.00', '444.44', '542.00'),
(217, '7XKE91PW0Y', 'Monique Murray', NULL, NULL, NULL, 76, '617.78', '506.58', '111.20', '2', '0.00', '506.58', '617.78'),
(218, 'TZ9034ZRBL', 'Lelia Swaniawski', NULL, NULL, NULL, 7, '469.89', '385.31', '84.58', '1', '0.00', '385.31', '469.89'),
(219, '6C2BMUUXOX', 'Hanna Conroy', NULL, NULL, NULL, 64, '789.07', '647.04', '142.03', '2', '0.00', '647.04', '789.07'),
(220, 'VSU6O5UT0P', 'Bret Crist', NULL, NULL, NULL, 37, '784.30', '643.13', '141.17', '2', '0.00', '643.13', '784.30'),
(221, 'DI5RAHAS6Q', 'Erick Thiel', NULL, NULL, NULL, 16, '22.88', '18.76', '4.12', '3', '0.00', '18.76', '22.88'),
(222, 'O2XW2XNRLH', 'Mr. Dedrick Ryan PhD', NULL, NULL, NULL, 17, '138.96', '113.95', '25.01', '3', '0.00', '113.95', '138.96'),
(223, 'T1G985LX4A', 'Mrs. Cassandre Koss Jr.', NULL, NULL, NULL, 57, '17.17', '14.08', '3.09', '1', '0.00', '14.08', '17.17'),
(224, 'EGLHO6ZSZN', 'Wilton Weber', NULL, NULL, NULL, 52, '677.64', '555.66', '121.98', '2', '0.00', '555.66', '677.64'),
(225, 'X87UFLYND2', 'Adah Kling', NULL, NULL, NULL, 65, '768.80', '630.42', '138.38', '3', '0.00', '630.42', '768.80'),
(226, '52PD81B10E', 'Dr. Roselyn Hill III', NULL, NULL, NULL, 99, '810.67', '664.75', '145.92', '2', '0.00', '664.75', '810.67'),
(227, '2SAMOE5S0P', 'Carey Walter', NULL, NULL, NULL, 83, '551.80', '452.48', '99.32', '1', '0.00', '452.48', '551.80'),
(228, 'J62JMOWBCG', 'Gene Deckow II', NULL, NULL, NULL, 19, '498.82', '409.03', '89.79', '2', '0.00', '409.03', '498.82'),
(229, 'TYFTGE6XP9', 'Mrs. Camylle Bashirian Jr.', NULL, NULL, NULL, 57, '735.91', '603.45', '132.46', '2', '0.00', '603.45', '735.91'),
(230, '5YT15ARWQ9', 'Melyna Harvey', NULL, NULL, NULL, 12, '832.43', '682.59', '149.84', '2', '0.00', '682.59', '832.43'),
(231, 'G9HN32UTJL', 'Amber Ziemann', NULL, NULL, NULL, 90, '743.55', '609.71', '133.84', '1', '0.00', '609.71', '743.55'),
(232, 'YUNII4826P', 'Lori Lubowitz', NULL, NULL, NULL, 83, '348.04', '285.39', '62.65', '3', '0.00', '285.39', '348.04'),
(233, 'NNUVYUKO2B', 'Orrin Gottlieb', NULL, NULL, NULL, 40, '401.35', '329.11', '72.24', '2', '0.00', '329.11', '401.35'),
(234, '244VYFUME3', 'Miss Bridgette McCullough', NULL, NULL, NULL, 28, '57.71', '47.32', '10.39', '1', '0.00', '47.32', '57.71'),
(235, 'SFNF5A8A1W', 'Dr. Florine Schiller DVM', NULL, NULL, NULL, 93, '298.39', '244.68', '53.71', '1', '0.00', '244.68', '298.39'),
(236, '3BBSCC4IDY', 'Caleigh Heaney', NULL, NULL, NULL, 75, '177.39', '145.46', '31.93', '3', '0.00', '145.46', '177.39'),
(237, 'M51H4B9MDB', 'Raymundo Kunze', NULL, NULL, NULL, 10, '936.70', '768.09', '168.61', '1', '0.00', '768.09', '936.70'),
(238, '1L9BNRJDUV', 'Minnie Eichmann Jr.', NULL, NULL, NULL, 67, '546.19', '447.88', '98.31', '3', '0.00', '447.88', '546.19'),
(239, 'BS1I2RQRD5', 'Elmira Olson', NULL, NULL, NULL, 47, '841.95', '690.40', '151.55', '3', '0.00', '690.40', '841.95'),
(240, 'JCSNQSP2XY', 'Dr. Christina Gislason I', NULL, NULL, NULL, 52, '972.25', '797.25', '175.01', '3', '0.00', '797.25', '972.25'),
(241, 'IJJ94RHYHB', 'Miss Jewel McCullough IV', NULL, NULL, NULL, 28, '67.59', '55.42', '12.17', '2', '0.00', '55.42', '67.59'),
(242, 'RTD4GL6FPT', 'Miss Elenor Stoltenberg PhD', NULL, NULL, NULL, 100, '282.12', '231.34', '50.78', '3', '0.00', '231.34', '282.12'),
(243, 'OX8UQ0VF8R', 'Houston Kerluke', NULL, NULL, NULL, 17, '272.34', '223.32', '49.02', '2', '0.00', '223.32', '272.34'),
(244, '0211SYYQ5J', 'Dr. Brown Wisoky', NULL, NULL, NULL, 39, '182.33', '149.51', '32.82', '2', '0.00', '149.51', '182.33'),
(245, 'PR601J9HUU', 'Mr. Ryley Oberbrunner III', NULL, NULL, NULL, 12, '455.58', '373.58', '82.00', '2', '0.00', '373.58', '455.58'),
(246, 'DJQ7YOBQ4C', 'Abel Raynor', NULL, NULL, NULL, 52, '970.23', '795.59', '174.64', '2', '0.00', '795.59', '970.23'),
(247, 'TTEI9BW4JX', 'Cordelia Beahan', NULL, NULL, NULL, 53, '465.37', '381.60', '83.77', '2', '0.00', '381.60', '465.37'),
(248, 'W0JNZA9PDT', 'Dr. Erick Harris I', NULL, NULL, NULL, 23, '533.88', '437.78', '96.10', '1', '0.00', '437.78', '533.88'),
(249, 'PJKRPDPJLP', 'Maeve Hartmann', NULL, NULL, NULL, 77, '315.46', '258.68', '56.78', '1', '0.00', '258.68', '315.46'),
(250, '5HGP2I26AG', 'Prof. Jane Mayert Jr.', NULL, NULL, NULL, 17, '216.90', '177.86', '39.04', '1', '0.00', '177.86', '216.90'),
(251, 'ESBKYLDW7Y', 'Mrs. Lorna Doyle MD', NULL, NULL, NULL, 52, '842.04', '690.47', '151.57', '2', '0.00', '690.47', '842.04'),
(252, 'ZHLV2J0447', 'Dr. Jamir Satterfield PhD', NULL, NULL, NULL, 63, '913.31', '748.91', '164.40', '1', '0.00', '748.91', '913.31'),
(253, 'MSK3SXZ1ZU', 'Devonte Legros', NULL, NULL, NULL, 35, '857.32', '703.00', '154.32', '3', '0.00', '703.00', '857.32'),
(254, 'O49Q4EJJRB', 'Prof. Enrique Boyer III', NULL, NULL, NULL, 19, '657.46', '539.12', '118.34', '1', '0.00', '539.12', '657.46'),
(255, '4E1O9CXYAV', 'Bobby Upton', NULL, NULL, NULL, 7, '318.28', '260.99', '57.29', '3', '0.00', '260.99', '318.28'),
(256, 'QFHSFPGQPQ', 'Laverne Walsh', NULL, NULL, NULL, 71, '224.98', '184.48', '40.50', '1', '0.00', '184.48', '224.98'),
(257, 'T5U7FOT53R', 'Antonietta Emmerich DVM', NULL, NULL, NULL, 28, '723.08', '592.93', '130.15', '2', '0.00', '592.93', '723.08'),
(258, '0UDW0YXKNE', 'Chad Reichel', NULL, NULL, NULL, 52, '408.17', '334.70', '73.47', '1', '0.00', '334.70', '408.17'),
(259, 'PRCEYZJW3M', 'Dr. Kaylie Kuhn', NULL, NULL, NULL, 21, '23.82', '19.53', '4.29', '1', '0.00', '19.53', '23.82'),
(260, 'HCCEAN20FF', 'Mrs. Leslie Lind III', NULL, NULL, NULL, 82, '472.66', '387.58', '85.08', '2', '0.00', '387.58', '472.66'),
(261, 'DQUM4GMFLD', 'Dr. Jermain Haley DDS', NULL, NULL, NULL, 1, '375.54', '307.94', '67.60', '2', '0.00', '307.94', '375.54'),
(262, 'ZMGHAC2LQ7', 'Jakayla Simonis', NULL, NULL, NULL, 40, '224.12', '183.78', '40.34', '1', '0.00', '183.78', '224.12'),
(263, 'V07U4QBN7T', 'America Kuvalis V', NULL, NULL, NULL, 90, '709.66', '581.92', '127.74', '2', '0.00', '581.92', '709.66'),
(264, 'AJNS6XWG3P', 'Nyasia Konopelski', NULL, NULL, NULL, 66, '605.70', '496.67', '109.03', '3', '0.00', '496.67', '605.70'),
(265, '41MGPGDS5W', 'Kitty Tremblay', NULL, NULL, NULL, 75, '584.68', '479.44', '105.24', '2', '0.00', '479.44', '584.68'),
(266, '6Z4NJWH6WM', 'Joelle Mosciski', NULL, NULL, NULL, 80, '676.42', '554.66', '121.76', '3', '0.00', '554.66', '676.42'),
(267, 'E5MPVF0SF5', 'Mattie Barrows', NULL, NULL, NULL, 32, '412.61', '338.34', '74.27', '1', '0.00', '338.34', '412.61'),
(268, 'ZXEJ9WYX1P', 'Ms. Twila Sanford Sr.', NULL, NULL, NULL, 89, '221.37', '181.52', '39.85', '2', '0.00', '181.52', '221.37'),
(269, 'E0BGF2XWYA', 'Mr. Triston Jast', NULL, NULL, NULL, 60, '712.77', '584.47', '128.30', '2', '0.00', '584.47', '712.77'),
(270, 'MDPFBKN9FN', 'Miss Summer Ratke I', NULL, NULL, NULL, 45, '627.21', '514.31', '112.90', '2', '0.00', '514.31', '627.21'),
(271, 'DSOT1TK982', 'Elizabeth Treutel', NULL, NULL, NULL, 54, '185.71', '152.28', '33.43', '3', '0.00', '152.28', '185.71'),
(272, '4IN76PK8SD', 'Salvador McDermott', NULL, NULL, NULL, 92, '115.57', '94.77', '20.80', '2', '0.00', '94.77', '115.57'),
(273, '66WBE3S2RZ', 'Prof. Assunta Kuhn', NULL, NULL, NULL, 64, '705.67', '578.65', '127.02', '1', '0.00', '578.65', '705.67'),
(274, 'D3WALD15LV', 'Caleigh McLaughlin', NULL, NULL, NULL, 8, '198.91', '163.11', '35.80', '2', '0.00', '163.11', '198.91'),
(275, '8X9OSHYLNI', 'Hal Graham', NULL, NULL, NULL, 79, '331.48', '271.81', '59.67', '1', '0.00', '271.81', '331.48'),
(276, 'NW6SNZTQ65', 'Edison Hill', NULL, NULL, NULL, 13, '835.73', '685.30', '150.43', '1', '0.00', '685.30', '835.73'),
(277, 'HZ7H4P5W0B', 'Dr. Ryder Considine III', NULL, NULL, NULL, 98, '664.97', '545.28', '119.69', '2', '0.00', '545.28', '664.97'),
(278, '7TB334BCHX', 'Dr. Terrance Orn', NULL, NULL, NULL, 43, '460.15', '377.32', '82.83', '3', '0.00', '377.32', '460.15'),
(279, 'N15V841H8X', 'Tyler Heller DVM', NULL, NULL, NULL, 72, '373.89', '306.59', '67.30', '2', '0.00', '306.59', '373.89'),
(280, 'XV09J0112I', 'Mr. Sydney Abbott Sr.', NULL, NULL, NULL, 55, '864.87', '709.19', '155.68', '1', '0.00', '709.19', '864.87'),
(281, 'KYDEMXZYRK', 'Emilio Powlowski V', NULL, NULL, NULL, 80, '243.57', '199.73', '43.84', '1', '0.00', '199.73', '243.57'),
(282, 'QL3U17T4FJ', 'Casandra Eichmann', NULL, NULL, NULL, 27, '880.51', '722.02', '158.49', '3', '0.00', '722.02', '880.51'),
(283, 'UZJBQRX0L2', 'Kelsi Roob I', NULL, NULL, NULL, 55, '276.17', '226.46', '49.71', '1', '0.00', '226.46', '276.17'),
(284, 'G1HNPCQPCO', 'Juliet Veum', NULL, NULL, NULL, 47, '473.40', '388.19', '85.21', '2', '0.00', '388.19', '473.40'),
(285, 'RYLLDXFYBU', 'Gisselle Ankunding', NULL, NULL, NULL, 72, '228.51', '187.38', '41.13', '3', '0.00', '187.38', '228.51'),
(286, '4XIBM4RH0C', 'Ms. Alene Christiansen', NULL, NULL, NULL, 49, '364.69', '299.05', '65.64', '2', '0.00', '299.05', '364.69'),
(287, 'PPS4Y31SN9', 'Prof. Lavon Daugherty DDS', NULL, NULL, NULL, 69, '561.75', '460.64', '101.12', '2', '0.00', '460.64', '561.75'),
(288, 'R1NVVJIXKY', 'Rosemarie Kassulke Sr.', NULL, NULL, NULL, 93, '624.23', '511.87', '112.36', '1', '0.00', '511.87', '624.23'),
(289, 'OZYM8BHB94', 'Ms. Heath Marquardt V', NULL, NULL, NULL, 69, '793.70', '650.83', '142.87', '3', '0.00', '650.83', '793.70'),
(290, 'RP99C8L4L8', 'Ryan Hoppe', NULL, NULL, NULL, 15, '865.31', '709.55', '155.76', '2', '0.00', '709.55', '865.31'),
(291, 'TZFKFULR2V', 'Tomasa Homenick IV', NULL, NULL, NULL, 18, '810.42', '664.54', '145.88', '3', '0.00', '664.54', '810.42'),
(292, 'G63721VQ0U', 'Alberto Mante', NULL, NULL, NULL, 84, '147.30', '120.79', '26.51', '2', '0.00', '120.79', '147.30'),
(293, 'PLTS674PEQ', 'Dr. Violette Satterfield Jr.', NULL, NULL, NULL, 70, '231.57', '189.89', '41.68', '2', '0.00', '189.89', '231.57'),
(294, 'NE011MQC5K', 'Titus Mayert', NULL, NULL, NULL, 62, '583.92', '478.81', '105.11', '1', '0.00', '478.81', '583.92'),
(295, 'KOUKJSMG3U', 'Prof. Magali Runolfsdottir', NULL, NULL, NULL, 4, '643.14', '527.37', '115.77', '2', '0.00', '527.37', '643.14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocs`
--

CREATE TABLE `tipodocs` (
  `id` int(2) NOT NULL,
  `codigo` varchar(6) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(150) DEFAULT '',
  `password` varchar(150) DEFAULT '',
  `nombres` varchar(150) DEFAULT NULL,
  `apellidos` varchar(150) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `password`, `nombres`, `apellidos`, `empresa_id`) VALUES
(1, 'elnaufrago2009@gmail.com', 'moises', 'Abraham Moises', 'Linares oscco', 13);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `config_const_docs`
--
ALTER TABLE `config_const_docs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `config_docs_tipos`
--
ALTER TABLE `config_docs_tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `docs`
--
ALTER TABLE `docs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `docs_items`
--
ALTER TABLE `docs_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipodocs`
--
ALTER TABLE `tipodocs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `config_const_docs`
--
ALTER TABLE `config_const_docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `config_docs_tipos`
--
ALTER TABLE `config_docs_tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `docs`
--
ALTER TABLE `docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `docs_items`
--
ALTER TABLE `docs_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT de la tabla `tipodocs`
--
ALTER TABLE `tipodocs`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
