-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bd_ventas
CREATE DATABASE IF NOT EXISTS `bd_ventas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bd_ventas`;

-- Volcando estructura para tabla bd_ventas.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(32) NOT NULL,
  `correo` varchar(128) NOT NULL,
  `celular` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla bd_ventas.clientes: ~11 rows (aproximadamente)
INSERT INTO `clientes` (`id`, `nombre`, `correo`, `celular`) VALUES
	(1, 'Marcelo Quiroga', 'marcelo@mail.com', '77712345'),
	(2, 'Caleb Benitez', 'benitez@mail.org', '70012345'),
	(3, 'Ursula Gonzales', 'nec@lacus.ca', '79112345'),
	(5, 'Juan Carlos Arce', 'conejo@mail.com', '71512345'),
	(6, 'Halee Kirby', 'tiam@tempor.com', '72012345'),
	(7, 'Marco Perez', 'marco@mail.com', '71526789'),
	(8, 'Pedro Marquez', 'peter@mail.com', '72054578'),
	(9, 'Juan de Arco', 'juanita@mail.com', '77112456'),
	(10, 'Luis Callejas', 'lucho@mial.com', '77122456'),
	(16, 'Marcelo Martins', 'marcelo@mail.com', '70012345'),
	(17, 'Juan Capriles', 'capri@mail.com', '78945612');

-- Volcando estructura para tabla bd_ventas.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(32) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla bd_ventas.productos: ~10 rows (aproximadamente)
INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`) VALUES
	(1, 'iPhone 4s', 'Que viene desde Apple', 200),
	(2, 'iPhone 5', 'iPhone 5 from Apple', 150),
	(3, 'iPhone 5s', 'iPhone 5s is too expensive.', 300.8),
	(4, 'iPad Air', 'iPad Air is thin like samurai!', 250),
	(5, 'HTC One', 'Best of 2013', 250),
	(6, 'God', 'God is not on sale. Sorry.', 132),
	(7, 'Lenovo 2020', 'This sword is so sharp that it can slice itself. Good for slicing jellies.', 2000),
	(8, 'Latitude e6420', 'Built by ultimate killing machines. For ultimate killing hobies.', 50),
	(9, 'Toshiba xd456', 'This jacket could save you from heart attack. And maybe heartbreaks.', 50000),
	(10, 'Dell vostro 456', 'This helps you brighten things in the dark.', 650);

-- Volcando estructura para tabla bd_ventas.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(80) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla bd_ventas.usuarios: ~2 rows (aproximadamente)
INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `password`) VALUES
	(1, 'admin', 'admin', 'admin@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997'),
	(2, 'Rosmelia', 'Chura', 'ross@gmail.com', 'c54476dce9c49a16bbb4592bce971fab2ea525e4');

-- Volcando estructura para tabla bd_ventas.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla bd_ventas.ventas: ~5 rows (aproximadamente)
INSERT INTO `ventas` (`id`, `producto_id`, `cliente_id`, `fecha`) VALUES
	(1, 1, 3, '2019-02-08'),
	(2, 10, 5, '2018-01-08'),
	(4, 7, 2, '2014-07-08'),
	(5, 5, 8, '2019-05-07'),
	(15, 5, 1, '2021-05-18');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
