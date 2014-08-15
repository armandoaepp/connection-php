/*
Navicat MySQL Data Transfer

Source Server         : LOCAL
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : planeatec_demo

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-08-15 10:22:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bieregdocumento
-- ----------------------------
DROP TABLE IF EXISTS `bieregdocumento`;
CREATE TABLE `bieregdocumento` (
  `nBieRegCodigo` int(11) NOT NULL,
  `cDocCodigo` varchar(100) NOT NULL,
  `nBieRegDocEstado` int(11) NOT NULL,
  PRIMARY KEY (`nBieRegCodigo`,`cDocCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bieregdocumento
-- ----------------------------

-- ----------------------------
-- Table structure for docbieregdistribucion
-- ----------------------------
DROP TABLE IF EXISTS `docbieregdistribucion`;
CREATE TABLE `docbieregdistribucion` (
  `cDocCodigo` varchar(20) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `nAlmOrigen` int(11) NOT NULL,
  `nAlmDestino` int(11) NOT NULL,
  `nBieRegCodigo` int(11) NOT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cDocCodigo`,`nBieRegCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docbieregdistribucion
-- ----------------------------

-- ----------------------------
-- Table structure for docbieregistro
-- ----------------------------
DROP TABLE IF EXISTS `docbieregistro`;
CREATE TABLE `docbieregistro` (
  `cDocCodigo` varchar(15) CHARACTER SET latin1 NOT NULL,
  `nNroItem` int(11) NOT NULL,
  `nBieRegCodigo` int(11) NOT NULL,
  `nEstado` int(11) NOT NULL,
  PRIMARY KEY (`cDocCodigo`,`nNroItem`,`nBieRegCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docbieregistro
-- ----------------------------

-- ----------------------------
-- Table structure for doccompdetvalor
-- ----------------------------
DROP TABLE IF EXISTS `doccompdetvalor`;
CREATE TABLE `doccompdetvalor` (
  `cDocCodigo` varchar(15) CHARACTER SET latin1 NOT NULL,
  `nNroItem` int(11) NOT NULL,
  `nMoneda` int(11) NOT NULL,
  `fValor` double(11,2) NOT NULL,
  `fDescuento` double(11,2) DEFAULT NULL,
  `fIGV` double(11,2) DEFAULT NULL,
  `dGravado` date DEFAULT NULL,
  PRIMARY KEY (`cDocCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doccompdetvalor
-- ----------------------------

-- ----------------------------
-- Table structure for doccomprobante
-- ----------------------------
DROP TABLE IF EXISTS `doccomprobante`;
CREATE TABLE `doccomprobante` (
  `cDocCodigo` varchar(15) CHARACTER SET latin1 NOT NULL,
  `nTipo` int(11) NOT NULL,
  `nMoneda` int(11) NOT NULL,
  `fmonto` float(11,0) NOT NULL,
  PRIMARY KEY (`cDocCodigo`,`nTipo`,`nMoneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doccomprobante
-- ----------------------------

-- ----------------------------
-- Table structure for doccontenido
-- ----------------------------
DROP TABLE IF EXISTS `doccontenido`;
CREATE TABLE `doccontenido` (
  `cDocCodigo` varchar(15) NOT NULL,
  `nDocParCodigo` int(11) NOT NULL,
  `nDocParClase` int(11) NOT NULL,
  `cDocConContenido` text NOT NULL,
  `nDocConEstado` int(11) NOT NULL,
  PRIMARY KEY (`cDocCodigo`,`nDocParCodigo`,`nDocParClase`),
  UNIQUE KEY `idx_pk` (`cDocCodigo`,`nDocParClase`,`nDocParCodigo`) USING BTREE,
  UNIQUE KEY `nDocParCodigo_UNIQUE` (`nDocParCodigo`) USING BTREE,
  UNIQUE KEY `nDocParClase_UNIQUE` (`nDocParClase`) USING BTREE,
  KEY `idx_clase_codigo` (`nDocParClase`,`nDocParCodigo`) USING BTREE,
  KEY `idx_cdoccodigo` (`cDocCodigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doccontenido
-- ----------------------------

-- ----------------------------
-- Table structure for docestado
-- ----------------------------
DROP TABLE IF EXISTS `docestado`;
CREATE TABLE `docestado` (
  `cDocCodigo` varchar(15) NOT NULL,
  `nDocParCodigo` int(11) unsigned NOT NULL,
  `nDocParClase` int(11) unsigned NOT NULL,
  `dDocEstFecha` datetime NOT NULL,
  `cDocEstGlosa` text,
  PRIMARY KEY (`cDocCodigo`,`nDocParCodigo`,`nDocParClase`,`dDocEstFecha`),
  UNIQUE KEY `idx_pk` (`cDocCodigo`,`nDocParClase`,`nDocParCodigo`,`dDocEstFecha`) USING BTREE,
  KEY `idx_cdoccodigo` (`cDocCodigo`) USING BTREE,
  KEY `idex_clase_codigo` (`nDocParClase`,`nDocParCodigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docestado
-- ----------------------------

-- ----------------------------
-- Table structure for docidentifica
-- ----------------------------
DROP TABLE IF EXISTS `docidentifica`;
CREATE TABLE `docidentifica` (
  `cDocCodigo` varchar(15) NOT NULL,
  `nDocTipoNum` int(11) NOT NULL,
  `cDocNDoc` varchar(100) NOT NULL,
  PRIMARY KEY (`cDocCodigo`,`nDocTipoNum`),
  UNIQUE KEY `idx_pk` (`cDocCodigo`,`nDocTipoNum`) USING BTREE,
  KEY `idx_cdocndoc` (`cDocNDoc`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docidentifica
-- ----------------------------

-- ----------------------------
-- Table structure for docparametro
-- ----------------------------
DROP TABLE IF EXISTS `docparametro`;
CREATE TABLE `docparametro` (
  `cDocCodigo` varchar(15) NOT NULL,
  `nParClase` int(11) unsigned NOT NULL,
  `nParCodigo` int(11) unsigned NOT NULL,
  `cDocParObservacion` varchar(500) NOT NULL,
  PRIMARY KEY (`cDocCodigo`,`nParClase`,`nParCodigo`),
  UNIQUE KEY `idx_pk` (`cDocCodigo`,`nParClase`,`nParCodigo`) USING BTREE,
  UNIQUE KEY `cDocCodigo_UNIQUE` (`cDocCodigo`) USING BTREE,
  KEY `idx_cdoccodigo` (`cDocCodigo`) USING BTREE,
  KEY `idx_clase_codigo` (`nParClase`,`nParCodigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docparametro
-- ----------------------------

-- ----------------------------
-- Table structure for docparparametro
-- ----------------------------
DROP TABLE IF EXISTS `docparparametro`;
CREATE TABLE `docparparametro` (
  `cDocCodigo` varchar(20) CHARACTER SET latin1 NOT NULL,
  `nParSrcCodigo` int(11) NOT NULL,
  `nParSrcClase` int(11) NOT NULL,
  `nParDstCodigo` int(11) NOT NULL,
  `nParDstClase` int(11) NOT NULL,
  `cParParValor` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `cParParGlosa` text CHARACTER SET latin1,
  PRIMARY KEY (`cDocCodigo`,`nParSrcCodigo`,`nParSrcClase`,`nParDstCodigo`,`nParDstClase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docparparametro
-- ----------------------------

-- ----------------------------
-- Table structure for docperparametro
-- ----------------------------
DROP TABLE IF EXISTS `docperparametro`;
CREATE TABLE `docperparametro` (
  `cDocCodigo` varchar(20) NOT NULL,
  `cPerCodigo` varchar(20) NOT NULL,
  `nParCodigo` int(11) NOT NULL,
  `nParClase` int(11) NOT NULL,
  `cDocPerParValor` varchar(500) DEFAULT NULL,
  `cDocPerParGlosa` text,
  `nDocPerParEstado` int(4) NOT NULL,
  PRIMARY KEY (`cDocCodigo`,`cPerCodigo`,`nParCodigo`,`nParClase`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docperparametro
-- ----------------------------

-- ----------------------------
-- Table structure for docpersona
-- ----------------------------
DROP TABLE IF EXISTS `docpersona`;
CREATE TABLE `docpersona` (
  `cDocCodigo` varchar(15) NOT NULL,
  `nDocPerTipo` int(11) NOT NULL,
  `cPerCodigo` varchar(20) NOT NULL,
  `nPerRelacion` int(11) NOT NULL,
  `nDocTipo` int(11) NOT NULL,
  PRIMARY KEY (`cDocCodigo`,`nDocPerTipo`,`cPerCodigo`,`nPerRelacion`,`nDocTipo`),
  UNIQUE KEY `id_pk` (`cDocCodigo`,`nDocPerTipo`,`cPerCodigo`,`nPerRelacion`,`nDocTipo`) USING BTREE,
  KEY `idx_cdoccodigo` (`cDocCodigo`) USING BTREE,
  KEY `idx_cpercodigo` (`cPerCodigo`) USING BTREE,
  KEY `idx_cdoc_ndoc_cper` (`cDocCodigo`,`nDocPerTipo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docpersona
-- ----------------------------

-- ----------------------------
-- Table structure for docref
-- ----------------------------
DROP TABLE IF EXISTS `docref`;
CREATE TABLE `docref` (
  `cDocCodigo` varchar(15) NOT NULL DEFAULT '',
  `cDocRefCodigo` varchar(15) NOT NULL,
  PRIMARY KEY (`cDocCodigo`,`cDocRefCodigo`),
  UNIQUE KEY `idx_pk` (`cDocCodigo`,`cDocRefCodigo`) USING BTREE,
  KEY `idx_cdoccodigo` (`cDocCodigo`) USING BTREE,
  KEY `idx_cdocrefcodigo` (`cDocRefCodigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docref
-- ----------------------------

-- ----------------------------
-- Table structure for docrefdestino
-- ----------------------------
DROP TABLE IF EXISTS `docrefdestino`;
CREATE TABLE `docrefdestino` (
  `cDocCodigo` varchar(15) CHARACTER SET latin1 NOT NULL,
  `cLugarOrigen` text CHARACTER SET latin1 NOT NULL,
  `nOrigTipo` int(11) NOT NULL,
  `cOrigDireccion` varchar(200) CHARACTER SET latin1 NOT NULL,
  `cOrigManz` varchar(100) CHARACTER SET latin1 NOT NULL,
  `cOrigLote` varchar(100) CHARACTER SET latin1 NOT NULL,
  `nOrigTipoRes` int(11) NOT NULL,
  `cOrigResidencia` varchar(200) CHARACTER SET latin1 NOT NULL,
  `cLugarDestino` text CHARACTER SET latin1 NOT NULL,
  `nDestTipo` int(11) NOT NULL,
  `cDestDireccion` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`cDocCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docrefdestino
-- ----------------------------

-- ----------------------------
-- Table structure for documento
-- ----------------------------
DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento` (
  `cDocCodigo` varchar(15) NOT NULL,
  `dDocFecha` datetime NOT NULL,
  `cDocObservacion` varchar(1000) NOT NULL,
  `nDocTipo` int(11) NOT NULL,
  `nDocEstado` tinyint(3) NOT NULL,
  PRIMARY KEY (`cDocCodigo`),
  UNIQUE KEY `idx_cdoccodigo` (`cDocCodigo`) USING BTREE,
  KEY `idx_cdoccodigo_ndoctipo` (`cDocCodigo`,`nDocTipo`) USING BTREE,
  KEY `idx_nDocTipo` (`nDocTipo`) USING BTREE,
  KEY `idx_nEstado` (`nDocEstado`,`cDocCodigo`,`nDocTipo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of documento
-- ----------------------------

-- ----------------------------
-- Table structure for docvigencia
-- ----------------------------
DROP TABLE IF EXISTS `docvigencia`;
CREATE TABLE `docvigencia` (
  `cDocCodigo` varchar(15) NOT NULL,
  `dFecha` date NOT NULL,
  `dFechaFin` date NOT NULL,
  `dHora` datetime NOT NULL,
  PRIMARY KEY (`cDocCodigo`),
  UNIQUE KEY `Codigo` (`cDocCodigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docvigencia
-- ----------------------------

-- ----------------------------
-- Table structure for parametro
-- ----------------------------
DROP TABLE IF EXISTS `parametro`;
CREATE TABLE `parametro` (
  `nParCodigo` int(11) unsigned NOT NULL,
  `nParClase` int(11) NOT NULL,
  `cParJerarquia` varchar(20) NOT NULL,
  `cParNombre` varchar(100) NOT NULL,
  `cParDescripcion` varchar(500) NOT NULL,
  `nParEstado` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`nParClase`,`nParCodigo`),
  UNIQUE KEY `idx_pk_parametro` (`nParCodigo`,`nParClase`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parametro
-- ----------------------------
INSERT INTO `parametro` VALUES ('1', '3000', '1001', 'cParNombre 1', ' cParDescripcion 1', '1');
INSERT INTO `parametro` VALUES ('2', '3000', '1002', 'cParNombre 2', ' cParDescripcion 2', '1');
INSERT INTO `parametro` VALUES ('3', '3000', '1003', 'cParNombre 1', ' cParDescripcion 1', '1');
INSERT INTO `parametro` VALUES ('4', '3000', '1004', 'cParNombre 2', ' cParDescripcion 2', '1');
INSERT INTO `parametro` VALUES ('5', '3000', '1005', 'cParNombre 1', ' cParDescripcion 1', '1');
INSERT INTO `parametro` VALUES ('6', '3000', '1006', 'cParNombre 2', ' cParDescripcion 2', '1');
INSERT INTO `parametro` VALUES ('7', '3000', '1007', 'cParNombre 1', ' cParDescripcion 1', '1');
INSERT INTO `parametro` VALUES ('8', '3000', '1008', 'cParNombre 2', ' cParDescripcion 2', '1');

-- ----------------------------
-- Table structure for pardetalle
-- ----------------------------
DROP TABLE IF EXISTS `pardetalle`;
CREATE TABLE `pardetalle` (
  `nParCodigo` int(11) unsigned NOT NULL,
  `nParClase` int(11) unsigned NOT NULL,
  `nParItem` int(11) unsigned NOT NULL,
  `nParItemS` int(11) unsigned NOT NULL,
  `cParDetValor` varchar(250) CHARACTER SET utf8 NOT NULL,
  `cParDetGlosa` text CHARACTER SET utf8,
  PRIMARY KEY (`nParCodigo`,`nParClase`,`nParItem`,`nParItemS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pardetalle
-- ----------------------------

-- ----------------------------
-- Table structure for parimagen
-- ----------------------------
DROP TABLE IF EXISTS `parimagen`;
CREATE TABLE `parimagen` (
  `nParCodigo` int(11) unsigned NOT NULL,
  `nParClase` int(11) unsigned NOT NULL,
  `nParImgTipo` int(11) unsigned NOT NULL,
  `cParImgRuta` varchar(1000) NOT NULL,
  `cParImgGlosa` text,
  `nParImgEstado` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`nParCodigo`,`nParClase`,`nParImgTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parimagen
-- ----------------------------

-- ----------------------------
-- Table structure for parparametro
-- ----------------------------
DROP TABLE IF EXISTS `parparametro`;
CREATE TABLE `parparametro` (
  `nParSrcCodigo` int(11) unsigned NOT NULL DEFAULT '0',
  `nParSrcClase` int(11) unsigned NOT NULL,
  `nParDstCodigo` int(11) unsigned NOT NULL,
  `nParDstClase` int(11) unsigned NOT NULL,
  `cValor` varchar(250) DEFAULT NULL,
  `nParParEstado` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`nParSrcCodigo`,`nParSrcClase`,`nParDstCodigo`,`nParDstClase`),
  UNIQUE KEY `idx_pk_all` (`nParSrcCodigo`,`nParSrcClase`,`nParDstCodigo`,`nParDstClase`) USING BTREE,
  KEY `idx_pk_src` (`nParSrcCodigo`,`nParSrcClase`) USING BTREE,
  KEY `idx_pk_dst` (`nParDstCodigo`,`nParDstClase`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parparametro
-- ----------------------------

-- ----------------------------
-- Table structure for parparext
-- ----------------------------
DROP TABLE IF EXISTS `parparext`;
CREATE TABLE `parparext` (
  `nIntSrcCodigo` int(11) unsigned NOT NULL,
  `nIntSrcClase` int(11) unsigned NOT NULL,
  `nIntDstCodigo` int(11) unsigned NOT NULL,
  `nIntDstClase` int(11) unsigned NOT NULL,
  `nObjCodigo` int(11) unsigned NOT NULL,
  `nObjTipo` int(11) unsigned NOT NULL,
  `cValor` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`nIntSrcCodigo`,`nIntSrcClase`,`nIntDstCodigo`,`nIntDstClase`,`nObjCodigo`,`nObjTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parparext
-- ----------------------------

-- ----------------------------
-- Table structure for percuenta
-- ----------------------------
DROP TABLE IF EXISTS `percuenta`;
CREATE TABLE `percuenta` (
  `nPerCtaCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `cPerCodigo` varchar(20) CHARACTER SET latin1 NOT NULL,
  `cNroCuenta` varchar(20) CHARACTER SET latin1 NOT NULL,
  `nPerCtaTipo` int(11) unsigned NOT NULL,
  `cPerJurCodigo` varchar(20) CHARACTER SET latin1 NOT NULL,
  `nMonCodigo` int(11) unsigned NOT NULL,
  `nPerCtaEstado` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`nPerCtaCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of percuenta
-- ----------------------------

-- ----------------------------
-- Table structure for perdireccion
-- ----------------------------
DROP TABLE IF EXISTS `perdireccion`;
CREATE TABLE `perdireccion` (
  `cPerCodigo` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT 'Codigo de la Persona a la que le pertenece esta direccion',
  `nUbiCodigo` int(11) NOT NULL COMMENT 'Codigo del ubigeo de esta direccion',
  `nPerDirTipo` int(11) NOT NULL COMMENT 'Codigo del tipo de la direccion (Casa - trabajo)',
  `cPerDirDescripcion` varchar(500) CHARACTER SET latin1 NOT NULL COMMENT 'Descripcion de la direccion',
  `cPerDirGlosa` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `nPerDirEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Se registra la diferentes direcciones de una persona';

-- ----------------------------
-- Records of perdireccion
-- ----------------------------

-- ----------------------------
-- Table structure for perdocumento
-- ----------------------------
DROP TABLE IF EXISTS `perdocumento`;
CREATE TABLE `perdocumento` (
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la Persona a la que le pertenece este documento. ',
  `nPerDocTipo` int(11) NOT NULL COMMENT 'Codigo del tipo de documento',
  `cPerDocNumero` varchar(50) NOT NULL COMMENT 'Numero del documento',
  `dPerDocCaducidad` date NOT NULL,
  `nPerDocCategoria` int(11) DEFAULT NULL,
  `nPerDocEstado` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cPerCodigo`,`nPerDocTipo`,`cPerDocNumero`),
  UNIQUE KEY `idx_pk_PerDocumento` (`cPerCodigo`,`nPerDocTipo`) USING BTREE,
  UNIQUE KEY `idx_cPerDocNumero` (`cPerDocNumero`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Se registra los diferentes documentos de una persona ';

-- ----------------------------
-- Records of perdocumento
-- ----------------------------

-- ----------------------------
-- Table structure for perimagen
-- ----------------------------
DROP TABLE IF EXISTS `perimagen`;
CREATE TABLE `perimagen` (
  `cPerCodigo` varchar(10) NOT NULL,
  `cPerRuta` varchar(50) NOT NULL,
  `nPerTipo` int(11) NOT NULL,
  `nPerEstado` int(11) NOT NULL,
  PRIMARY KEY (`cPerCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perimagen
-- ----------------------------

-- ----------------------------
-- Table structure for perjuridica
-- ----------------------------
DROP TABLE IF EXISTS `perjuridica`;
CREATE TABLE `perjuridica` (
  `cPerCodigo` varchar(20) NOT NULL,
  `nPerJurRubro` int(11) NOT NULL,
  `cPerJurDescripcion` varchar(250) NOT NULL,
  `nPerEmpresa` int(11) NOT NULL,
  PRIMARY KEY (`cPerCodigo`),
  UNIQUE KEY `idx_pk_cPerCodigo` (`cPerCodigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of perjuridica
-- ----------------------------

-- ----------------------------
-- Table structure for permail
-- ----------------------------
DROP TABLE IF EXISTS `permail`;
CREATE TABLE `permail` (
  `cPerCodigo` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT 'Codigo de la Persona a la que le pertenece este Email',
  `nPerMailItem` tinyint(3) NOT NULL COMMENT 'Codigo del tipo de email(personal - corporativo)',
  `cPerMail` varchar(250) NOT NULL COMMENT 'Descripcion del Email',
  `nPerMailEstado` tinyint(3) NOT NULL,
  PRIMARY KEY (`cPerCodigo`,`nPerMailItem`),
  UNIQUE KEY `idx_pk_PerMail` (`cPerCodigo`,`nPerMailItem`) USING BTREE,
  KEY `idx_cPerMail` (`cPerMail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Se registra los diferentes email de una persona ';

-- ----------------------------
-- Records of permail
-- ----------------------------

-- ----------------------------
-- Table structure for pernatural
-- ----------------------------
DROP TABLE IF EXISTS `pernatural`;
CREATE TABLE `pernatural` (
  `cPerCodigo` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT 'Codigo de la Persona',
  `cPerNatApePaterno` varchar(250) NOT NULL COMMENT 'Registro del apellido paterno',
  `cPerNatApeMaterno` varchar(250) NOT NULL COMMENT 'Registro del apellido Materno',
  `nPerNatSexo` tinyint(3) unsigned NOT NULL COMMENT 'Codigo de la Persona a la que le pertenece este sexo',
  `nPerNatEstCivil` tinyint(3) unsigned NOT NULL COMMENT 'Codigo de la Persona a la que le pertenece este estado civil',
  PRIMARY KEY (`cPerCodigo`),
  UNIQUE KEY `idx_pk_pernatural` (`cPerCodigo`) USING BTREE,
  KEY `idx_cPerNatApePaterno` (`cPerNatApePaterno`) USING BTREE,
  KEY `idx_cPerNatApeMaterno` (`cPerNatApeMaterno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='En esta tabla se registra los apellidos de una persona';

-- ----------------------------
-- Records of pernatural
-- ----------------------------

-- ----------------------------
-- Table structure for perparametro
-- ----------------------------
DROP TABLE IF EXISTS `perparametro`;
CREATE TABLE `perparametro` (
  `cPerCodigo` varchar(20) NOT NULL,
  `nParCodigo` int(11) NOT NULL,
  `nParClase` int(11) NOT NULL,
  `nPerParValor` int(11) DEFAULT NULL,
  `cPerParGlosa` varchar(255) DEFAULT NULL,
  `nPerParEstado` int(4) DEFAULT NULL,
  PRIMARY KEY (`cPerCodigo`,`nParCodigo`,`nParClase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of perparametro
-- ----------------------------

-- ----------------------------
-- Table structure for perrelacion
-- ----------------------------
DROP TABLE IF EXISTS `perrelacion`;
CREATE TABLE `perrelacion` (
  `cPerCodigo` varchar(20) CHARACTER SET latin1 NOT NULL,
  `nPerRelTipo` int(11) unsigned NOT NULL,
  `cPerJuridica` varchar(20) CHARACTER SET latin1 NOT NULL,
  `dPerRelacion` date NOT NULL,
  `cPerObservacion` varchar(500) NOT NULL,
  `nPerRelEstado` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`cPerCodigo`,`nPerRelTipo`,`cPerJuridica`),
  UNIQUE KEY `idx_pk_PerRelacion` (`cPerCodigo`,`nPerRelTipo`) USING BTREE,
  KEY `idx_cPerJuridica` (`cPerJuridica`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of perrelacion
-- ----------------------------

-- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la persona.',
  `cPerNombre` varchar(500) NOT NULL COMMENT 'Nombre de la persona.',
  `cPerApellidos` varchar(500) DEFAULT NULL,
  `dPerNacimiento` date NOT NULL COMMENT 'Fecha de nacimiento de la persona.',
  `nPerTipo` tinyint(3) unsigned NOT NULL COMMENT 'Codigo si es una persona  juridica o natural.',
  `nPerEstado` tinyint(3) unsigned NOT NULL COMMENT 'Codigo si esta persona esta activa o inactivo.',
  PRIMARY KEY (`cPerCodigo`),
  UNIQUE KEY `idx_pk_persona` (`cPerCodigo`) USING BTREE,
  KEY `idx_cPerNombre` (`cPerNombre`(255)) USING BTREE,
  KEY `idx_cParApellidos` (`cPerApellidos`(255)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='En esta tabla se registran los nombres de una persona';

-- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO `persona` VALUES ('2000000001', 'ARMANDO ENRIQUE ', 'PISFIL PUEMAPE ', '2014-08-14', '2', '1');
INSERT INTO `persona` VALUES ('2000000002', 'ARMANDO ENRIQUE ', 'PISFIL PUEMAPE ', '2014-08-14', '2', '1');
INSERT INTO `persona` VALUES ('2000000003', 'ARMANDO ENRIQUE ', 'PISFIL PUEMAPE ', '2014-08-14', '2', '1');
INSERT INTO `persona` VALUES ('2000000004', 'ARMANDO ENRIQUE ', 'PISFIL PUEMAPE ', '2014-08-14', '2', '1');
INSERT INTO `persona` VALUES ('2000000005', 'ARMANDO ENRIQUE ', 'PISFIL PUEMAPE 1', '2014-08-14', '2', '1');
INSERT INTO `persona` VALUES ('2000000006', 'ARMANDO ENRIQUE ', 'PISFIL PUEMAPE 2', '2014-08-14', '2', '1');
INSERT INTO `persona` VALUES ('2000000007', 'ARMANDO ENRIQUE ', 'PISFIL PUEMAPE 3', '2014-08-14', '2', '1');

-- ----------------------------
-- Table structure for pertelefono
-- ----------------------------
DROP TABLE IF EXISTS `pertelefono`;
CREATE TABLE `pertelefono` (
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la Persona a la cual le pertenece este Numero Telefonico',
  `nPerTelTipo` int(11) NOT NULL COMMENT 'Tipo de Telefono (Fijo - Celular Movistar - Celular Claro)',
  `nPerTelItem` tinyint(3) unsigned NOT NULL,
  `cPerTelNumero` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT 'Numero del Telefono',
  `nPerTelEstado` tinyint(3) NOT NULL,
  PRIMARY KEY (`cPerCodigo`,`nPerTelItem`,`nPerTelTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacena los telefonos de una determinada Persona';

-- ----------------------------
-- Records of pertelefono
-- ----------------------------

-- ----------------------------
-- Table structure for perusuacceso
-- ----------------------------
DROP TABLE IF EXISTS `perusuacceso`;
CREATE TABLE `perusuacceso` (
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la persona quien tendra acceso al sistema.',
  `nPerUsuAccGrupo` int(11) unsigned NOT NULL COMMENT 'Codigo de un determinado grupo a la que una persona tendra acceso.',
  `nPerUsuAccTipo` int(11) unsigned NOT NULL COMMENT 'Codigo de un determinado grupo a la que una persona tendra acceso.',
  `nPerUsuAccObjCodigo` int(11) unsigned NOT NULL COMMENT 'Codigo del permiso al que tendra una persona.',
  `nPerUsuAccCodigo` int(11) unsigned NOT NULL COMMENT 'Codigo del permiso al que tendra una persona.',
  `nPerUsuAccPrdCodigo` int(11) unsigned NOT NULL COMMENT 'Codigo de un determinado periodo al que un usuario tendra acceso.',
  `nPerUsuAccEstado` tinyint(3) unsigned NOT NULL COMMENT 'Codigo del estado de un usuario(activo - inactivo).',
  PRIMARY KEY (`cPerCodigo`,`nPerUsuAccGrupo`,`nPerUsuAccTipo`,`nPerUsuAccObjCodigo`,`nPerUsuAccCodigo`,`nPerUsuAccPrdCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='En esta tabla se registraran los permisos de un determinado ';

-- ----------------------------
-- Records of perusuacceso
-- ----------------------------

-- ----------------------------
-- Table structure for perusuario
-- ----------------------------
DROP TABLE IF EXISTS `perusuario`;
CREATE TABLE `perusuario` (
  `cPerCodigo` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT 'Codigo de la persona ',
  `cPerUsuCodigo` varchar(50) NOT NULL COMMENT 'Registro del nombre del usuario.',
  `cPerUsuClave` varchar(50) NOT NULL COMMENT 'Registro de la clave del usuario.',
  `nPerUsuEstado` tinyint(3) unsigned NOT NULL COMMENT 'Codigo del estado del usuario(activo - inactivo)',
  PRIMARY KEY (`cPerCodigo`,`cPerUsuCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of perusuario
-- ----------------------------

-- ----------------------------
-- Table structure for transaccion
-- ----------------------------
DROP TABLE IF EXISTS `transaccion`;
CREATE TABLE `transaccion` (
  `cTraCodigo` varchar(100) NOT NULL COMMENT 'Codigo de la transaccion que se va a realizar.',
  `nOpeCodigo` int(11) NOT NULL COMMENT 'Codigo de la operacion que se esta realizando',
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la persona quien esta realizando una determinada transaccion.',
  `dTraFecha` datetime NOT NULL COMMENT 'Fecha en que se realiza una determinada transaccion.',
  `cComputer` varchar(250) NOT NULL COMMENT 'Descripcion del equipo que se esta utilizando',
  `cTraDescripcion` longtext NOT NULL COMMENT 'Descripcion de la transaccion que se esta realizando',
  PRIMARY KEY (`cTraCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='En esta tabla se registrara las transaciones que realiza un ';

-- ----------------------------
-- Records of transaccion
-- ----------------------------

-- ----------------------------
-- Procedure structure for ups_Get_Periodo_Activo
-- ----------------------------
DROP PROCEDURE IF EXISTS `ups_Get_Periodo_Activo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ups_Get_Periodo_Activo`()
BEGIN
	# ESTRAER PERIODO ACTIVO 
	# debe de haber un solo periodo ACTIVO :)
	SELECT 
		periodo.nPrdCodigo, 
		periodo.cPrdDescripcion , 
		periodo.dPrdFecInic, 
		periodo.dPrdFecFin 
	FROM periodo 
	WHERE periodo.nPrdEstado = 1
	LIMIT 1;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_Parametro`(nParCodigo int (11), nParClase int(11))
BEGIN
	
		SELECT 
				parametro.nParCodigo,
				parametro.cParJerarquia , 
				parametro.cParNombre,
				parametro.cParDescripcion
		FROM parametro
		WHERE parametro.nParEstado = 1
		AND parametro.nParClase = nParClase
		AND parametro.nParCodigo = nParCodigo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_PerCosecha_by_nPerCosCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_PerCosecha_by_nPerCosCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_PerCosecha_by_nPerCosCodigo`(nPerCosCodigo INT)
BEGIN
		SELECT 
			percosecha.nPerCosCodigo, 
			percosecha.cPerCodigo, 
			percosecha.nParcCodigo, 
			percosecha.nParcClase, 
			percosecha.nProdCodigo, 
			percosecha.nProdClase, 
			percosecha.nPrdCodigo, 
			percosecha.cCosCodigo, 
			percosecha.fHectareas, 
			percosecha.fQuintales, 
			percosecha.fKilogramos, 
			percosecha.fHolgura
			-- percosecha.cGlosa
		FROM percosecha 
		WHERE percosecha.nPerCosCodigo = nPerCosCodigo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_PerParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_PerParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_PerParametro`(cPerCodigo VARCHAR(20) , nParCodigo INT, nParClase INT)
BEGIN
	
	SELECT 
		perparametro.cPerCodigo, 
		perparametro.cPerParValor , 
		perparametro.cPerParGlosa 
	FROM 	perparametro
	WHERE perparametro.cPerCodigo = cPerCodigo  	
	AND perparametro.nParCodigo = nParCodigo
	AND perparametro.nParClase =  nParClase 
	;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_Persona_By_cPerCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_Persona_By_cPerCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_Persona_By_cPerCodigo`(cPerCodigo varchar(20))
BEGIN
	-- ok 
	SELECT persona.cPerCodigo, persona.cPerNombre, persona.cPerApellidos
	FROM persona
	WHERE persona.cPerCodigo = cPerCodigo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_Persona_By_cPerDocNumero
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_Persona_By_cPerDocNumero`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_Persona_By_cPerDocNumero`(nPerTipo int(11), nPerDocTipo int(11), cPerDocNumero varchar(20))
BEGIN
	#Routine body goes here...
	SELECT persona.cPerCodigo, persona.cPerNombre, persona.cPerApellidos,
				perdocumento.nPerDocTipo, perdocumento.cPerDocNumero
	FROM persona
	INNER JOIN perdocumento ON persona.cPerCodigo=perdocumento.cPerCodigo
	WHERE persona.nPerEstado=1
	AND perdocumento.nPerDocEstado=1
	AND	( (nPerTipo	=	0  ) 				OR 	(persona.nPerTipo = nPerTipo) )
	AND	( (nPerDocTipo	=	0  ) 		OR 	(perdocumento.nPerDocTipo = nPerDocTipo) )
	AND	( (cPerDocNumero	=	"-")	OR	(perdocumento.cPerDocNumero LIKE CONCAT(cPerDocNumero,"%")) );
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Elm_Persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Elm_Persona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Elm_Persona`(cPerCodigo varchar(100))
BEGIN
	UPDATE persona
	SET nPerEstado=0
	WHERE persona.cPerCodigo=cPerCodigo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Filtrar_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Filtrar_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Filtrar_Parametro`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4) , nParClase int(11) , cParNombre varchar(100), cParDescripcion varchar(500))
BEGIN

	IF  (nPagRegistro = 1 ) THEN
		SET @sentencia = CONCAT('SELECT parametro.nParCodigo,
							parametro.cParNombre,
							IFNULL(parametro.cParDescripcion,"") cParDescripcion
					FROM parametro
					WHERE parametro.nParClase="',nParClase,'"
					AND parametro.nParEstado = 1
					AND( ( "',cParNombre ,'" 				= "-" )	OR ( parametro.cParNombre like "',cParNombre ,'%") )
					AND( ( "',cParDescripcion ,'" 	= "-" ) OR ( parametro.cParDescripcion like "',cParDescripcion ,'%") )
					ORDER BY parametro.cParDescripcion ASC
					LIMIT  ',nOriReg,',',nCanReg,' ; ');
					prepare consulta FROM @sentencia;
					execute consulta;
	ELSE
		SELECT parametro.nParCodigo,
				parametro.cParNombre,
				IFNULL(parametro.cParDescripcion,"") cParDescripcion
		FROM parametro
		WHERE parametro.nParClase = nParClase
		AND parametro.nParEstado = 1 
		AND ( ( cParNombre 			= "-" ) OR ( parametro.cParNombre 			LIKE CONCAT(cParNombre,'%') ) )
		AND	( ( cParDescripcion = "-" ) OR ( parametro.cParDescripcion 	LIKE CONCAT(cParDescripcion,'%') ) )
		ORDER BY parametro.cParDescripcion ASC ;
	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Filtrar_ParParametro_by_nParCodigos
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Filtrar_ParParametro_by_nParCodigos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Filtrar_ParParametro_by_nParCodigos`(nOriReg INT(4), nCanReg INT(4), nPagRegistro INT(4),nParSrcCodigo INT(11),nParSrcClase INT(4) ,nParDstCodigo INT(11), nParDstClase INT(4))
BEGIN


	IF  (nPagRegistro = 1 ) THEN
		SET @sentencia = CONCAT('
					SELECT 
						p_src.nParCodigo AS nParSrcCodigo ,
						p_src.cParNombre AS cParSrcNombre , 
						p_src.cParDescripcion AS cParSrcDescripcion,
						p_dst.nParCodigo AS nParDstCodigo,
						p_dst.cParNombre AS cParDstNombre,
						p_dst.cParDescripcion AS cParDstDescripcion, 
						parparametro.cValor 
					FROM parametro AS p_src 
					INNER JOIN parparametro ON parparametro.nParSrcCodigo = p_src.nParCodigo
																	AND parparametro.nParSrcClase = p_src.nParClase			
																	AND parparametro.nParParEstado =  1 

					INNER JOIN parametro AS p_dst ON parparametro.nParDstCodigo = p_dst.nParCodigo
																				AND parparametro.nParDstClase = p_dst.nParClase																
					 
					WHERE  p_src.nParEstado =  1
					AND p_dst.nParEstado =  1
					AND p_src.nParClase = ', nParSrcClase ,'
					AND p_dst.nParClase =  ',nParDstClase ,'
					AND	( ( ',nParSrcCodigo,' = 0 ) OR ( p_src.nParCodigo = ',nParSrcCodigo,' ) )
					AND	( ( ',nParDstCodigo,' = 0 ) OR ( p_dst.nParCodigo = ',nParDstCodigo,' ) )
				  ORDER BY p_src.cParDescripcion , p_dst.cParDescripcion ASC
					LIMIT  ',nOriReg,',',nCanReg);
					PREPARE consulta FROM @sentencia;
					EXECUTE consulta;
	ELSE
					
			SELECT 
					p_src.nParCodigo AS nParSrcCodigo ,
					p_src.cParNombre AS cParSrcNombre , 
					p_src.cParDescripcion AS cParSrcDescripcion,
					p_dst.nParCodigo AS nParDstCodigo,
					p_dst.cParNombre AS cParDstNombre,
					p_dst.cParDescripcion AS cParDstDescripcion, 
					parparametro.cValor 
				FROM parametro AS p_src 
				INNER JOIN parparametro ON parparametro.nParSrcCodigo = p_src.nParCodigo
																AND parparametro.nParSrcClase = p_src.nParClase			
																AND parparametro.nParParEstado =  1 

				INNER JOIN parametro AS p_dst ON parparametro.nParDstCodigo = p_dst.nParCodigo
																			AND parparametro.nParDstClase = p_dst.nParClase																
				 
				WHERE  p_src.nParEstado =  1
				AND p_dst.nParEstado =  1
				AND p_src.nParClase =  nParSrcClase 
				AND p_dst.nParClase =  nParDstClase 
				AND	( ( nParSrcCodigo = 0 ) OR ( p_src.nParCodigo = nParSrcCodigo ) )
				AND	( ( nParDstCodigo = 0 ) OR ( p_dst.nParCodigo = nParDstCodigo ) )
				-- AND	( ( cParSrcDescripcion = "-" ) OR ( p_src.cParDescripcion 	LIKE CONCAT(cParSrcDescripcion,"%") ) )
				-- AND	( ( cParDstDescripcion = "-" ) OR ( p_dst.cParDescripcion 	LIKE CONCAT(cParDstDescripcion,"%") ) )
				ORDER BY p_src.cParDescripcion , p_dst.cParDescripcion ASC ;
	END IF;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Caserios_by_nDisCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Caserios_by_nDisCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Caserios_by_nDisCodigo`(nDisCodigo INT)
BEGIN
	SELECT 
		caserio.nCasCodigo ,
		caserio.cCasDescripcion
	FROM caserio
	WHERE caserio.nDisCodigo = nDisCodigo
	; 

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Caserio_by_nCasCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Caserio_by_nCasCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Caserio_by_nCasCodigo`(nCasCodigo INT)
BEGIN
	SELECT 
		caserio.nCasCodigo , 
		caserio.cCasDescripcion ,
		caserio.nDisCodigo
	FROM caserio 
	WHERE caserio.nCasEstado =  1  
	AND caserio.nCasCodigo = nCasCodigo ; 


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_get_DocPersona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_get_DocPersona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_get_DocPersona`(cDocCodigo varchar(20), cPerCodigo varchar(20), nDocTipo int(4), nDocPerTipo int(4), nPerRelacion int(4))
BEGIN
	#Routine body goes here...
	SELECT	docpersona.cDocCodigo, docpersona.cPerCodigo
	FROM 	docpersona
	WHERE docpersona.cDocCodigo		=	cDocCodigo
	AND		docpersona.cPerCodigo		=	cPerCodigo
	AND		docpersona.nDocTipo			=	nDocTipo
	AND		docpersona.nDocPerTipo	=	nDocPerTipo
	AND		docpersona.nPerRelacion	=	nPerRelacion;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro_By_cParClase
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro_By_cParClase`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro_By_cParClase`(nParClase int(11))
BEGIN
		SELECT parametro.nParCodigo,
				parametro.cParNombre,
				parametro.cParDescripcion
		FROM parametro
		WHERE parametro.nParEstado = 1
		AND parametro.nParClase = nParClase
		ORDER BY 	parametro.cParDescripcion , 
		parametro.cParNombre  ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro_By_Todos
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro_By_Todos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro_By_Todos`(nParCodigo int(4), nParClase Int(4), cParJerarquia nVarChar(20), cParNombre nVarChar(100), cParDescripcion nVarChar(500), nParEstado Int(3))
BEGIN

	SELECT parametro.nParCodigo,
		parametro.nParClase,
		parametro.cParJerarquia,
		parametro.cParNombre,
		parametro.cParDescripcion,
		(length(parametro.cParJerarquia)) as CanJerarquia
	From parametro
	WHERE (( nParCodigo = 0) OR (parametro.nParCodigo = nParCodigo ))
	AND (( nParClase = 0) OR (parametro.nParClase = nParClase ))
	AND (( cParJerarquia = '-' ) OR (parametro.cParJerarquia = cParJerarquia ))
	AND (( cParNombre = '-' ) OR (parametro.cParNombre = cParNombre ))
	AND (( cParDescripcion = '-' ) OR (parametro.cParDescripcion = cParDescripcion ))
	AND (( nParEstado = 0) OR (parametro.nParEstado = nParEstado ))
	ORDER BY parametro.cParJerarquia;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro_cParDesc_by_cParJeranquia
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro_cParDesc_by_cParJeranquia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro_cParDesc_by_cParJeranquia`(nParClase int(11), cParJerarquia varchar(20), cParDescripcion varchar(200))
BEGIN

		SELECT 	parametro.nParCodigo,
						parametro.cParJerarquia ,
						parametro.cParNombre,
						parametro.cParDescripcion
		FROM parametro
		WHERE parametro.nParEstado = 1
		AND	parametro.nParClase = nParClase
		AND ( ( cParJerarquia 	= "-" ) OR ( parametro.cParJerarquia 			= cParJerarquia ) )
		AND	( ( cParDescripcion = "-" ) OR ( parametro.cParDescripcion 	= cParDescripcion ) );

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro_Head_nParClase-000
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro_Head_nParClase-000`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro_Head_nParClase-000`(nParClase INT(4))
BEGIN
		SELECT parametro.cParJerarquia ,
			parametro.cParNombre ,
			parametro.cParDescripcion FROM parametro
		WHERE parametro.nParClase =  nParClase
		AND parametro.nParEstado = 0
		AND parametro.nParCodigo = 0  ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro_Padre_nParClase
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro_Padre_nParClase`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro_Padre_nParClase`(nParClase INT(4))
BEGIN
	-- OK -> para seleccionar el registro cabecera de cada clase 0_0 
		SELECT 
			parametro.cParJerarquia ,
			parametro.cParNombre ,
			parametro.cParDescripcion 
		FROM parametro
		WHERE parametro.nParClase =  nParClase
		AND parametro.nParEstado = 0
		AND parametro.nParCodigo = 0  ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parcelas_by_cPerCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parcelas_by_cPerCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parcelas_by_cPerCodigo`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cParNombre VARCHAR(100) , cParDescripcion VARCHAR(200), cPerCodigo VARCHAR(20))
BEGIN


	IF  (nPagRegistro = 1 ) THEN

		SET @sentencia = CONCAT('
					SELECT 
						parametro.nParCodigo, 
						parametro.cParNombre ,
						parametro.cParDescripcion,
						perparametro.cPerCodigo,
						perparametro.cPerParValor,
						perparametro.cPerParGlosa
					FROM parametro 
					INNER JOIN perparametro ON   perparametro.nParCodigo =  parametro.nParCodigo
																	AND perparametro.nParClase = parametro.nParClase																		
					WHERE parametro.nParClase = 2006 
					AND parametro.nParEstado =  1 
					AND perparametro.cPerCodigo = "',cPerCodigo ,'"					
				AND( ("',cParNombre  ,'" ="-"  ) OR ( parametro.cParNombre like "',cParNombre  ,'%") )
				AND( ("',cParDescripcion  ,'" ="-"  ) OR (  parametro.cParNombre like "',cParDescripcion  ,'%") )				
				ORDER BY 	parametro.cParNombre, parametro.cParDescripcion ASC
				LIMIT ',nOriReg,',',nCanReg);
		prepare consulta FROM @sentencia;
		execute consulta;

	ELSE

		SELECT 
			parametro.nParCodigo, 
			parametro.cParNombre ,
			parametro.cParDescripcion,
			perparametro.cPerCodigo,
			perparametro.cPerParValor,
			perparametro.cPerParGlosa
		FROM parametro 
		INNER JOIN perparametro ON   perparametro.nParCodigo =  parametro.nParCodigo
														AND perparametro.nParClase = parametro.nParClase
															
		WHERE parametro.nParClase = 2006 
		AND parametro.nParEstado =  1 
		AND perparametro.cPerCodigo = cPerCodigo 	
		AND ((cParNombre = "-") OR ( parametro.cParNombre	LIKE CONCAT(cParNombre,"%") ))
		AND ((cParDescripcion = "-") OR ( parametro.cParDescripcion	LIKE CONCAT(cParDescripcion,"%") ))	
		ORDER BY 	parametro.cParNombre, parametro.cParDescripcion ASC
		;

	END IF;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_PerCoseha_by_cPerCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_PerCoseha_by_cPerCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_PerCoseha_by_cPerCodigo`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cPerCodigo VARCHAR(20))
BEGIN


	IF  (nPagRegistro = 1 ) THEN

		SET @sentencia = CONCAT('
					SELECT 
						persona.cPerCodigo, 
						percosecha.nPerCosCodigo , 
						p_parcela.nParCodigo AS nParCodParcela ,
						p_parcela.cParDescripcion AS cParDescParcela,
						p_producto.nParCodigo AS nParCodProducto,
						p_producto.cParDescripcion AS cParDescProducto, 
						percosecha.cCosCodigo, 
						percosecha.fHectareas, 
						percosecha.fQuintales,
						percosecha.fKilogramos, 
						percosecha.fHolgura

					FROM percosecha 
					INNER JOIN persona ON persona.cPerCodigo = percosecha.cPerCodigo 
					INNER JOIN parametro AS p_parcela ON p_parcela.nParCodigo =  percosecha.nParcCodigo
																						AND p_parcela.nParClase = percosecha.nParcClase
																						AND p_parcela.nParEstado =  1 
					INNER JOIN parametro AS p_producto ON p_producto.nParCodigo =  percosecha.nProdCodigo
																					 AND p_producto.nParClase = percosecha.nProdClase
																					 AND p_producto.nParEstado =  1 
					INNER JOIN periodo ON periodo.nPrdCodigo = percosecha.nPrdCodigo
															AND periodo.nPrdEstado =  1 

					WHERE p_parcela.nParClase = 2006 
					AND p_producto.nParClase =  2007 
					AND persona.cPerCodigo = "',cPerCodigo ,'"	
					AND percosecha.nPerCosEstado = 1 
				ORDER BY p_parcela.cParDescripcion ASC 
				LIMIT ',nOriReg,',',nCanReg);
		prepare consulta FROM @sentencia;
		execute consulta;

	ELSE

		
	SELECT 
		persona.cPerCodigo, 
		percosecha.nPerCosCodigo , 
		p_parcela.nParCodigo AS nParCodParcela ,
		p_parcela.cParDescripcion AS cParDescParcela,
		p_producto.nParCodigo AS nParCodProducto,
		p_producto.cParDescripcion AS cParDescProducto, 
		percosecha.cCosCodigo, 
		percosecha.fHectareas, 
		percosecha.fQuintales,
		percosecha.fKilogramos, 
		percosecha.fHolgura		

	FROM percosecha 
	INNER JOIN persona ON persona.cPerCodigo = percosecha.cPerCodigo 
	INNER JOIN parametro AS p_parcela ON p_parcela.nParCodigo =  percosecha.nParcCodigo
																		AND p_parcela.nParClase = percosecha.nParcClase
																		AND p_parcela.nParEstado =  1 
	INNER JOIN parametro AS p_producto ON p_producto.nParCodigo =  percosecha.nProdCodigo
																	 AND p_producto.nParClase = percosecha.nProdClase
																	 AND p_producto.nParEstado =  1 
	INNER JOIN periodo ON periodo.nPrdCodigo = percosecha.nPrdCodigo
											AND periodo.nPrdEstado =  1 

	WHERE p_parcela.nParClase = 2006 
	AND p_producto.nParClase =  2007 
	AND persona.cPerCodigo = cPerCodigo
	AND percosecha.nPerCosEstado = 1 
	ORDER BY p_parcela.cParDescripcion ASC 
		;

	END IF;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Periodo_By_nPrdCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Periodo_By_nPrdCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Periodo_By_nPrdCodigo`(nPrdCodigo Int(4))
BEGIN

	SELECT periodo.nPrdCodigo,
		periodo.cPrdDescripcion,
		periodo.nPrdTipo ,
		periodo.dPrdFecInic,
		periodo.dPrdFecFin,
		periodo.nPrdEstado
	FROM periodo
	WHERE periodo.nPrdCodigo		  = nPrdCodigo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_PerJuridica_by_cPerUsuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_PerJuridica_by_cPerUsuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_PerJuridica_by_cPerUsuario`(cPerUsuario VARCHAR(20))
BEGIN
	-- CON EL CODIGO DEL USUARIO VERIFICACMOS A QUE EMPRESA PERTENECE 
	-- cPerUsuario  es el usuario que esta en linea haciendo el registro de la persona 
		SELECT  perjuridica.cPerCodigo , perjuridica.cPerJurDescripcion 
		FROM  perjuridica
		INNER JOIN perrelacion ON perrelacion.cPerJuridica =   perjuridica.cPerCodigo 
		INNER JOIN persona ON persona.cPerCodigo = perrelacion.cPerCodigo 
		WHERE persona.cPerCodigo = cPerUsuario    ; 

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Permisos_Botonera_By_Usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Permisos_Botonera_By_Usuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Permisos_Botonera_By_Usuario`(nPerTipo int(4), nPerEstado int(4), nPerUsuEstado Int(4), nPerUsuAccEstado Int(4), nParClase Int(4),cPerCodigo  varchar(20), nPerUsuAccGrupo Int(4), nParTipo Int(4), nParSrcClase Int(4), nParSrcCodigo Int(4))
BEGIN
	SELECT persona.cPerCodigo,
		persona.cPerNombre,
		persona.nPerTipo,
		perusuacceso.nPerUsuAccGrupo,
    perusuacceso.nPerUsuAccCodigo,
		perusuacceso.nPerUsuAccEstado,
		parametro.cParJerarquia,
		parametro.cParNombre,
    parametro.cParDescripcion,
		(length(parametro.cParJerarquia)) as CanJerarquia,
		parparametro.cValor
	FROM persona
  INNER JOIN perusuario  	ON persona.cPerCodigo    = perusuario.cPerCodigo
  INNER JOIN perusuacceso ON perusuario.cPerCodigo = perusuacceso.cPerCodigo
  INNER JOIN parametro    ON parametro.nParCodigo  = perusuacceso.nPerUsuAccCodigo AND parametro.nParClase = perusuacceso.nPerUsuAccObjCodigo
	INNER JOIN parparametro	ON parparametro.nParDstClase = parametro.nParClase AND parparametro.nParDstCodigo = parametro.nParCodigo
	WHERE persona.nPerTipo             = nPerTipo
  AND persona.nPerEstado             <> nPerEstado
  AND perusuario.nPerUsuEstado       <> nPerUsuEstado
  AND perusuacceso.nPerUsuAccEstado  <>	nPerUsuAccEstado
  AND parametro.nParClase            = nParClase
  AND persona.cPerCodigo             = cPerCodigo
	AND perusuacceso.nPerUsuAccGrupo	 = nPerUsuAccGrupo
	AND parametro.nParEstado			   		 = nParTipo
	AND parparametro.nParSrcClase			 = nParSrcClase
	AND parparametro.nParSrcCodigo		 = nParSrcCodigo
	ORDER BY parametro.cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Permisos_By_Usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Permisos_By_Usuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Permisos_By_Usuario`(nPerTipo int(4), nPerEstado int(4), nPerUsuEstado Int(4), nPerUsuAccEstado Int(4), nParClase Int(4), cPerCodigo  varchar(20), nPerUsuAccGrupo Int(4))
BEGIN
	SELECT persona.cPerCodigo,
		persona.cPerNombre,
		persona.nPerTipo,
		perusuacceso.nPerUsuAccGrupo,
    perusuacceso.nPerUsuAccCodigo,
		perusuacceso.nPerUsuAccEstado,
		parametro.cParJerarquia,
		parametro.cParNombre,
		-- CONCAT(UPPER(LEFT(parametro.cParDescripcion,1)),lower(SUBSTR(parametro.cParDescripcion,2))) AS NombreMenu,
		parametro.cParDescripcion AS NombreMenu, 
		(length(parametro.cParJerarquia)) as CanJerarquia
	FROM persona
  INNER JOIN perusuario   ON persona.cPerCodigo    = perusuario.cPerCodigo
  INNER JOIN perusuacceso ON perusuario.cPerCodigo = perusuacceso.cPerCodigo
  INNER JOIN parametro    ON parametro.nParCodigo  = perusuacceso.nPerUsuAccCodigo AND parametro.nParClase = perusuacceso.nPerUsuAccObjCodigo
	WHERE persona.nPerTipo            = nPerTipo
  AND persona.nPerEstado            <> nPerEstado
  AND perusuario.nPerUsuEstado      <> nPerUsuEstado
  AND perusuacceso.nPerUsuAccEstado <> nPerUsuAccEstado
  AND parametro.nParClase           = nParClase
  AND persona.cPerCodigo            = cPerCodigo
	AND perusuacceso.nPerUsuAccGrupo	= nPerUsuAccGrupo
	AND parametro.nParEstado <> 0
	ORDER BY parametro.cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Permiso_By_Acceso_Grupo_Persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Permiso_By_Acceso_Grupo_Persona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Permiso_By_Acceso_Grupo_Persona`(nParCodigo int(4), nParClase Int(4), cPerCodigo  varchar(20), nPerUsuAccEstado Int(4))
BEGIN
	SELECT  perusuacceso.nPerUsuAccCodigo   ,
       		perusuacceso.cPerCodigo         ,
        	perusuacceso.nPerUsuAccGrupo    ,
        	perusuacceso.nPerUsuAccPrdCodigo,
        	perusuacceso.nPerUsuAccEstado
	FROM    perusuacceso
	WHERE   perusuacceso.nPerUsuAccEstado = nPerUsuAccEstado
  AND perusuacceso.cPerCodigo        = cPerCodigo
  AND perusuacceso.nPerUsuAccGrupo   = nParClase
  AND perusuacceso.nPerUsuAccCodigo  = nParCodigo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_PerParametro_by_cPer_nPar_Codigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_PerParametro_by_cPer_nPar_Codigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_PerParametro_by_cPer_nPar_Codigo`(cPerCodigo VARCHAR(20),  nParClase INT)
BEGIN
	
SELECT 
			parametro.nParCodigo, 
			parametro.cParNombre ,
			parametro.cParDescripcion,
			perparametro.cPerCodigo,
			perparametro.cPerParValor,
			perparametro.cPerParGlosa
		FROM parametro 
		INNER JOIN perparametro ON  perparametro.nParCodigo =  parametro.nParCodigo
														AND perparametro.nParClase = parametro.nParClase
															
		WHERE perparametro.cPerCodigo = cPerCodigo
		AND parametro.nParClase = nParClase 
		AND parametro.nParEstado =  1 
		ORDER BY parametro.cParDescripcion , parametro.cParNombre ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Persona_By_Apellidos
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Persona_By_Apellidos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Persona_By_Apellidos`(cPerNatApellido varchar(250))
BEGIN
	SELECT 	persona.cPerCodigo,
			CONCAT(persona.cPerNombre, ' ' ,persona.cPerApellidos) Nombre,
			IFNULL(perdocumento.cPerDocNumero,"-") cPerDocNumero,
			RIGHT(persona.cPerCodigo,5)
	FROM	persona
	INNER JOIN pernatural 	ON persona.cPerCodigo = pernatural.cPerCodigo
	LEFT JOIN perdocumento 	ON persona.cPerCodigo = perdocumento.cPerCodigo
	WHERE   persona.nPerTipo        = 1
  AND persona.nPerEstado          <> 0
	AND perdocumento.nPerDocTipo 		<>6
	AND perdocumento.nPerDocEstado	= 1
	HAVING Nombre LIKE CONCAT(cPerNatApellido ,'%')
	limit 0,8;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Persona_By_cPerDocNumero
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Persona_By_cPerDocNumero`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Persona_By_cPerDocNumero`(cPerDocNumero varchar(250), nPerDocTipo Int(4), cPerCodigo varchar(20))
BEGIN
	SELECT CONCAT(persona.cPerApellidos,' ', persona.cPerNombre),  perdocumento.cPerDocNumero, parametro.cParDescripcion
	FROM perdocumento
		INNER JOIN persona 		ON persona.cPerCodigo = perdocumento.cPerCodigo
		INNER JOIN parametro 		ON perdocumento.nPerDocTipo = parametro.nParCodigo AND parametro.nParClase = 1001
	WHERE perdocumento.cPerDocNumero=cPerDocNumero
		AND perdocumento.nPerDocTipo = nPerDocTipo
		AND persona.nPerEstado = 1
		AND ((cPerCodigo ='-') OR (persona.cPerCodigo <> cPerCodigo ));
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Persona_By_nPerRelTipo_cPerDocNumero
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Persona_By_nPerRelTipo_cPerDocNumero`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Persona_By_nPerRelTipo_cPerDocNumero`(nPerRelTipo int(11), cPerDocNumero varchar(100))
BEGIN
	IF  (nPerRelTipo = 1 ) THEN
		SET @sentencia=CONCAT('SELECT	persona.cPerCodigo,
																	persona.cPerNombre,
																	"-",
																	rubro.cParDescripcion,
																	CONCAT(contacto.cPerNombre, " ", contacto.cPerApellidos) AS cPerApellidos
													FROM persona
													INNER JOIN perjuridica ON persona.cPerCodigo=perjuridica.cPerCodigo
													INNER JOIN perdocumento ON persona.cPerCodigo=perdocumento.cPerCodigo
													INNER JOIN parametro AS rubro ON rubro.nParCodigo=perjuridica.nPerJurRubro AND rubro.nParClase=1006
													INNER JOIN perrelacion ON perrelacion.cPerJuridica=perjuridica.cPerCodigo
													INNER JOIN persona	AS contacto ON contacto.cPerCodigo=perrelacion.cPerCodigo AND perrelacion.nPerRelTipo=2018
													WHERE perdocumento.cPerDocNumero=',cPerDocNumero,'
													AND persona.nPerTipo = 2
													AND persona.nPerEstado = 1
													AND perdocumento.nPerDocTipo=7
													AND perrelacion.nPerRelEstado=1');
					prepare consulta FROM @sentencia;
					execute consulta;
	ELSE
		SELECT	persona.cPerCodigo,
						persona.cPerNombre,
						pernatural.cPerNatApePaterno,
						pernatural.cPerNatApeMaterno,
						'0',
						perdocumento.nPerDocTipo
		FROM persona
		INNER JOIN pernatural ON persona.cPerCodigo=pernatural.cPerCodigo
		INNER JOIN perdocumento ON persona.cPerCodigo=perdocumento.cPerCodigo
		WHERE perdocumento.cPerDocNumero = cPerDocNumero
		AND persona.nPerTipo = 1
		AND persona.nPerEstado = 1
		AND perdocumento.nPerDocTipo=2;
	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Persona_GenerarCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Persona_GenerarCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Persona_GenerarCodigo`(nPerTipo INT)
BEGIN

	SELECT 	IFNULL( MAX(persona.cPerCodigo)+1 , CONCAT(nPerTipo , '000000001') )  AS cPerCodigo
	FROM		persona
	WHERE		LENGTH(persona.cPerCodigo) > 9
	AND 	persona.nPerTipo = nPerTipo;

/*
  SELECT 	IFNULL( MAX(persona.cPerCodigo)+1 , '1000001' ) 
	FROM		persona;
*/

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Productores
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Productores`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Productores`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4) , cPerDocNumero VARCHAR(20) , cPerApellidos VARCHAR(250), cPerNombre VARCHAR(250) , nParCodStatus INT(11) , cParSector VARCHAR(100))
BEGIN

	IF  (nPagRegistro = 1 ) THEN
		SET @sentencia = CONCAT('
					SELECT 
						persona.cPerCodigo,
						persona.dPerNacimiento,
						persona.cPerNombre ,
						persona.cPerApellidos , 					 
						perdocumento.cPerDocNumero,
						permail.cPerMail , 
						pertelefono.cPerTelNumero ,
						perpar_fechaIncorp.cPerParValor AS dFechaIncorp ,
						p_status.cParDescripcion AS cParStatus , 
						p_sector.cParDescripcion AS cParSector
					FROM persona					
					INNER JOIN perdocumento ON perdocumento.cPerCodigo =  persona.cPerCodigo 
					INNER JOIN perrelacion ON perrelacion.cPerCodigo =  persona.cPerCodigo
					INNER JOIN permail ON permail.cPerCodigo =  persona.cPerCodigo
					INNER JOIN pertelefono ON pertelefono.cPerCodigo =  persona.cPerCodigo
					# FECHA DE INCORPORACION DEL PRODUCTOR
					INNER JOIN perparametro AS perpar_fechaIncorp ON perpar_fechaIncorp.cPerCodigo = persona.cPerCodigo 
																	AND perpar_fechaIncorp.nParClase = 2005
																	AND perpar_fechaIncorp.nParCodigo =  1 

					# STATUS DEL PRODUCTOR 
					INNER JOIN perparametro AS perpar_status ON perpar_status.cPerCodigo = persona.cPerCodigo 
																	AND perpar_status.nParClase = 2003							
							
					INNER JOIN parametro AS p_status ON p_status.nParCodigo = perpar_status.nParCodigo 
																					AND p_status.nParClase = perpar_status.nParClase 
																					AND p_status.nParEstado =  1 
					# SECTOR AL PERTENECE EL PRODUCTOR 
					INNER JOIN perubigeo ON perubigeo.cPerCodigo = persona.cPerCodigo 
					INNER JOIN parametro AS p_sector ON p_sector.nParCodigo =  perubigeo.nPerUbiCodigo 
																						AND p_sector.nParClase =  2002 
																						AND p_status.nParEstado =  1
					WHERE persona.nPerTipo =  2 
					AND persona.nPerEstado > 0  
					AND perrelacion.nPerRelTipo =  2002 
					AND perrelacion.nPerRelEstado =  1 	
									
					AND( ( "',cPerDocNumero ,'" = "-" )	OR ( perdocumento.cPerDocNumero	LIKE "',cPerDocNumero ,'%") )
					AND( ( "',cPerApellidos ,'" = "-" )	OR ( persona.cPerApellidos	LIKE "',cPerApellidos ,'%") )
					AND( ( "',cPerNombre ,'" 		= "-" )	OR ( persona.cPerNombre	LIKE "',cPerNombre ,'%") )
					AND( ( ',nParCodStatus ,' 	= 0 )	OR (p_status.nParCodigo	=	',nParCodStatus ,' ) )
					AND( ( "',cParSector ,'" 		= "-" )	OR ( p_sector.cParDescripcion	LIKE "',cParSector ,'%") )
					ORDER BY persona.cPerApellidos, persona.cPerNombre ,perdocumento.cPerDocNumero ASC 

					LIMIT  ',nOriReg,',',nCanReg,' ; ');
					prepare consulta FROM @sentencia;
					execute consulta;
	ELSE
		SELECT 
			persona.cPerCodigo,
			persona.dPerNacimiento,
			persona.cPerNombre ,
			persona.cPerApellidos , 
			-- pernatural.cPerNatApePaterno, 
			-- pernatural.cPerNatApeMaterno, 
			-- pernatural.nPerNatSexo , 
			-- esto optimizaria si queremos sacar el sexo de pernatural
			-- (SELECT pernatural.nPerNatSexo FROM pernatural WHERE pernatural.cPerCodigo = persona.cPerCodigo LIMIT 1 ) AS nPerNatSexo , 
			perdocumento.cPerDocNumero,
			permail.cPerMail , 
			pertelefono.cPerTelNumero ,
			perpar_fechaIncorp.cPerParValor AS dFechaIncorp ,
			p_status.cParDescripcion AS cParStatus , 
			p_sector.cParDescripcion AS cParSector
		FROM persona
		-- INNER JOIN pernatural ON  pernatural.cPerCodigo   = persona.cPerCodigo
		INNER JOIN perdocumento ON perdocumento.cPerCodigo =  persona.cPerCodigo 
		INNER JOIN perrelacion ON perrelacion.cPerCodigo =  persona.cPerCodigo
		INNER JOIN permail ON permail.cPerCodigo =  persona.cPerCodigo
		INNER JOIN pertelefono ON pertelefono.cPerCodigo =  persona.cPerCodigo
		# FECHA DE INCORPORACION DEL PRODUCTOR
		INNER JOIN perparametro AS perpar_fechaIncorp ON perpar_fechaIncorp.cPerCodigo = persona.cPerCodigo 
														AND perpar_fechaIncorp.nParClase = 2005
														AND perpar_fechaIncorp.nParCodigo =  1 

		# STATUS DEL PRODUCTOR 
		INNER JOIN perparametro AS perpar_status ON perpar_status.cPerCodigo = persona.cPerCodigo 
														AND perpar_status.nParClase = 2003							
				
		INNER JOIN parametro AS p_status ON p_status.nParCodigo = perpar_status.nParCodigo 
																		AND p_status.nParClase = perpar_status.nParClase 
																		AND p_status.nParEstado =  1 
		# SECTOR AL PERTENECE EL PRODUCTOR 
		INNER JOIN perubigeo ON perubigeo.cPerCodigo = persona.cPerCodigo 
		INNER JOIN parametro AS p_sector ON p_sector.nParCodigo =  perubigeo.nPerUbiCodigo 
																			AND p_sector.nParClase =  2002 
																			AND p_status.nParEstado =  1
		WHERE persona.nPerTipo =  2 
		AND persona.nPerEstado > 0  
		AND perrelacion.nPerRelTipo =  2002 
		AND perrelacion.nPerRelEstado =  1 		
		AND	( ( cPerDocNumero = "-" ) OR ( perdocumento.cPerDocNumero	LIKE CONCAT(cPerDocNumero,"%") ) )
		AND	( ( cPerApellidos = "-" ) OR ( persona.cPerApellidos 	LIKE CONCAT(cPerApellidos,"%") ) )
		AND ( ( cPerNombre 		= "-" ) OR ( persona.cPerNombre 		LIKE CONCAT(cPerNombre,"%") ) )
		AND ( ( nParCodStatus		= 0 ) OR ( p_status.nParCodigo	=	nParCodStatus ) )
		AND ( ( cParSector		= "-" ) OR ( p_sector.cParDescripcion 	LIKE CONCAT(cParSector,"%") ) )
		ORDER BY persona.cPerApellidos, persona.cPerNombre ,perdocumento.cPerDocNumero ASC ;


	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Productor_by_cPerCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Productor_by_cPerCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Productor_by_cPerCodigo`(cPerCodigo VARCHAR(20))
BEGIN
	
			SELECT 
				persona.cPerCodigo,
				persona.dPerNacimiento,
				persona.cPerNombre ,  
				pernatural.cPerNatApePaterno, 
				pernatural.cPerNatApeMaterno, 
				persona.nPerEstado , 
				pernatural.nPerNatSexo , 
				perdocumento.cPerDocNumero,
				permail.cPerMail , 
				pertelefono.cPerTelNumero ,
				perpar_fechaIncorp.cPerParValor AS dFechaIncorp ,
				p_status.nParCodigo AS nParStatus , 
				p_status.cParDescripcion AS cParStatus , 
				p_sector.nParCodigo AS nParSector , 
				p_sector.cParDescripcion AS cParSector
			FROM persona
			INNER JOIN pernatural ON  pernatural.cPerCodigo   = persona.cPerCodigo
			INNER JOIN perdocumento ON perdocumento.cPerCodigo =  persona.cPerCodigo 
			INNER JOIN perrelacion ON perrelacion.cPerCodigo =  persona.cPerCodigo
			INNER JOIN permail ON permail.cPerCodigo =  persona.cPerCodigo
			INNER JOIN pertelefono ON pertelefono.cPerCodigo =  persona.cPerCodigo
			# FECHA DE INCORPORACION DEL PRODUCTOR
			INNER JOIN perparametro AS perpar_fechaIncorp ON perpar_fechaIncorp.cPerCodigo = persona.cPerCodigo 
															AND perpar_fechaIncorp.nParClase = 2005
															AND perpar_fechaIncorp.nParCodigo =  1 

			# STATUS DEL PRODUCTOR 
			INNER JOIN perparametro AS perpar_status ON perpar_status.cPerCodigo = persona.cPerCodigo 
															AND perpar_status.nParClase = 2003							
					
			INNER JOIN parametro AS p_status ON p_status.nParCodigo = perpar_status.nParCodigo 
																			AND p_status.nParClase = perpar_status.nParClase 
																			AND p_status.nParEstado =  1 
			# SECTOR AL PERTENECE EL PRODUCTOR 
			INNER JOIN perubigeo ON perubigeo.cPerCodigo = persona.cPerCodigo 
			INNER JOIN parametro AS p_sector ON p_sector.nParCodigo =  perubigeo.nPerUbiCodigo 
																				AND p_sector.nParClase =  2002 
																				AND p_status.nParEstado =  1


			WHERE persona.nPerTipo =  2 
			AND persona.nPerEstado > 0  
			AND perrelacion.nPerRelTipo =  2002 
			AND perrelacion.nPerRelEstado =  1 
			AND persona.cPerCodigo =  cPerCodigo  ; -- '2000000004' 


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Sectores_by_nCasCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Sectores_by_nCasCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Sectores_by_nCasCodigo`(nCasCodigo INT)
BEGIN
				SELECT			
					p_sector.nParCodigo ,
					p_sector.cParNombre ,
					p_sector.cParDescripcion ,
					caserio.nCasCodigo 					
				FROM  parametro AS p_sector 
				INNER JOIN  caserio ON caserio.nCasCodigo = p_sector.cParJerarquia 
																AND p_sector.nParClase = 2002
				WHERE p_sector.nParEstado = 1	
				AND caserio.nCasEstado = 1 
				AND caserio.nCasCodigo = nCasCodigo  
				; 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Sel_Caserios
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Sel_Caserios`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Sel_Caserios`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4),   cDepDescripcion varchar(100) , cProDescripcion varchar(100) ,cDisDescripcion varchar(100) , cCasDescripcion varchar(100))
BEGIN


	IF  (nPagRegistro = 1 ) THEN

		SET @sentencia = CONCAT('
				SELECT 
					departamento.nDepCodigo , 
					departamento.cDepDescripcion ,
					provincia.nProCodigo ,
					provincia.cProDescripcion , 
					distrito.nDisCodigo , 
					distrito.cDisDescripcion , 
					caserio.nCasCodigo ,
					caserio.cCasDescripcion 
				FROM departamento 
				INNER JOIN provincia ON  provincia.nDepCodigo  = departamento.nDepCodigo 
				INNER JOIN distrito ON distrito.nProCodigo =  provincia.nProCodigo
				INNER JOIN caserio ON caserio.nDisCodigo =  distrito.nDisCodigo 
				WHERE caserio.nCasEstado = 1 
				AND( ("',cDepDescripcion  ,'" ="-"  ) OR (  departamento.cDepDescripcion like "',cDepDescripcion  ,'%") )
				AND( ("',cProDescripcion  ,'" ="-"  ) OR (  provincia.cProDescripcion like "',cProDescripcion  ,'%") )
				AND( ("',cDisDescripcion  ,'" ="-"  ) OR (  distrito.cDisDescripcion like "',cDisDescripcion  ,'%") )
				AND( ("',cCasDescripcion  ,'" ="-"  ) OR (  caserio.cCasDescripcion like "',cCasDescripcion  ,'%") )
				ORDER BY departamento.cDepDescripcion, provincia.cProDescripcion ,distrito.cDisDescripcion , caserio.cCasDescripcion ASC
				LIMIT ',nOriReg,',',nCanReg);
		prepare consulta FROM @sentencia;
		execute consulta;

	ELSE

		SELECT 
			departamento.nDepCodigo , 
			departamento.cDepDescripcion ,
			provincia.nProCodigo ,
			provincia.cProDescripcion , 
			distrito.nDisCodigo , 
			distrito.cDisDescripcion , 
			caserio.nCasCodigo ,
			caserio.cCasDescripcion 
		FROM departamento 
		INNER JOIN provincia ON  provincia.nDepCodigo  = departamento.nDepCodigo 
		INNER JOIN distrito ON distrito.nProCodigo =  provincia.nProCodigo
		INNER JOIN caserio ON caserio.nDisCodigo =  distrito.nDisCodigo 
		WHERE caserio.nCasEstado = 1 
		AND ((cDepDescripcion = "-") OR ( departamento.cDepDescripcion	LIKE CONCAT(cDepDescripcion,"%") ))
		AND ((cProDescripcion = "-") OR ( provincia.cProDescripcion	LIKE CONCAT(cProDescripcion,"%") ))
		AND ((cDisDescripcion = "-") OR ( distrito.cDisDescripcion	LIKE CONCAT(cDisDescripcion,"%") ))
		AND ((cCasDescripcion = "-") OR ( caserio.cCasDescripcion	LIKE CONCAT(cCasDescripcion,"%") ))
		ORDER BY departamento.cDepDescripcion, provincia.cProDescripcion ,distrito.cDisDescripcion , caserio.cCasDescripcion ASC
		;

	END IF;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Sel_Periodos
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Sel_Periodos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Sel_Periodos`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4),  cPrdDescripcion varchar(100))
BEGIN

	IF  (nPagRegistro = 1 ) THEN

		SET @sentencia = CONCAT('SELECT periodo.nPrdCodigo,
					 periodo.cPrdDescripcion,
					DATE_FORMAT(periodo.dPrdFecInic ,"%d/%m/%Y") AS dPrdFecInic,
					DATE_FORMAT(periodo.dPrdFecFin ,"%d/%m/%Y") AS dPrdFecFin ,
					periodo.nPrdEstado
				FROM periodo
				WHERE periodo.nPrdEstado 		IN( 1, 2)
				AND( ("',cPrdDescripcion ,'" ="-"  ) OR (  periodo.cPrdDescripcion like "',cPrdDescripcion ,'%") )
				ORDER BY DATE_FORMAT(periodo.dPrdFecInic ,"%d/%m/%Y") DESC , DATE_FORMAT(periodo.dPrdFecFin ,"%d/%m/%Y")  DESC
				LIMIT ',nOriReg,',',nCanReg);
		prepare consulta FROM @sentencia;
		execute consulta;

	ELSE

		SELECT periodo.nPrdCodigo,
			 periodo.cPrdDescripcion,
			 DATE_FORMAT(periodo.dPrdFecInic ,'%d/%m/%Y') AS dPrdFecInic,
			 DATE_FORMAT(periodo.dPrdFecFin ,'%d/%m/%Y') AS dPrdFecFin ,
			periodo.nPrdEstado

		FROM periodo
		WHERE periodo.nPrdEstado 		IN( 1, 2)
		AND( (cPrdDescripcion ='-') 		OR ( periodo.cPrdDescripcion like concat(cPrdDescripcion,'%')) )
		ORDER BY DATE_FORMAT(periodo.dPrdFecInic ,"%d/%m/%Y") DESC , DATE_FORMAT(periodo.dPrdFecFin ,"%d/%m/%Y")  DESC;

	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Sel_Sectores
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Sel_Sectores`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Sel_Sectores`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4) ,  cProDescripcion varchar(100) ,cDisDescripcion varchar(100) , cCasDescripcion varchar(100),   cParDescSector varchar(100) ,cParNombre varchar(20))
BEGIN

	IF  (nPagRegistro = 1 ) THEN

		SET @sentencia = CONCAT('
			SELECT			
					p_sector.nParCodigo ,
					p_sector.cParNombre ,
					p_sector.cParDescripcion ,
					caserio.nCasCodigo , 
					caserio.cCasDescripcion , 
					distrito.nDisCodigo ,
					distrito.cDisDescripcion , 
					provincia.nProCodigo , 
					provincia.cProDescripcion,
					departamento.nDepCodigo ,
					departamento.cDepDescripcion
					
				FROM  parametro AS p_sector 
				INNER JOIN  caserio ON caserio.nCasCodigo = p_sector.cParJerarquia 
																AND p_sector.nParClase = 2002
				INNER JOIN distrito ON distrito.nDisCodigo = caserio.nDisCodigo 
				INNER JOIN provincia ON provincia.nProCodigo =  distrito.nProCodigo
				INNER JOIN departamento ON departamento.nDepCodigo = provincia.nDepCodigo
				WHERE p_sector.nParEstado = 1	
				AND caserio.nCasEstado = 1 
				AND distrito.nDisEstado =  1 
				AND departamento.nDepEstado = 1	
				AND( ("',cProDescripcion  ,'" ="-"  ) OR (  provincia.cProDescripcion like "',cProDescripcion  ,'%") )
				AND( ("',cDisDescripcion  ,'" ="-"  ) OR (  distrito.cDisDescripcion like "',cDisDescripcion  ,'%") )
				AND( ("',cCasDescripcion  ,'" ="-"  ) OR (  caserio.cCasDescripcion like "',cCasDescripcion  ,'%") )
				AND( ("',cParDescSector  ,'" = "-"  ) OR (  p_sector.cParDescripcion like "',cParDescSector  ,'%") )
				AND( ("',cParNombre  ,'" = "-"  ) OR ( p_sector.cParNombre like "',cParNombre  ,'%") )
				ORDER BY p_sector.cParDescripcion, caserio.cCasDescripcion , distrito.cDisDescripcion,provincia.cProDescripcion ASC
				LIMIT ',nOriReg,',',nCanReg);
		prepare consulta FROM @sentencia;
		execute consulta;

	ELSE
		-- cParJerarquia de parametro almacena  codigo distrito 
				SELECT			
					p_sector.nParCodigo ,
					p_sector.cParNombre ,
					p_sector.cParDescripcion ,
					caserio.nCasCodigo , 
					caserio.cCasDescripcion , 
					distrito.nDisCodigo ,
					distrito.cDisDescripcion , 
					provincia.nProCodigo , 
					provincia.cProDescripcion,
					departamento.nDepCodigo ,
					departamento.cDepDescripcion
					
				FROM  parametro AS p_sector 
				INNER JOIN  caserio ON caserio.nCasCodigo = p_sector.cParJerarquia 
																AND p_sector.nParClase = 2002
				INNER JOIN distrito ON distrito.nDisCodigo = caserio.nDisCodigo 
				INNER JOIN provincia ON provincia.nProCodigo =  distrito.nProCodigo
				INNER JOIN departamento ON departamento.nDepCodigo = provincia.nDepCodigo
				WHERE p_sector.nParEstado = 1	
				AND caserio.nCasEstado = 1 
				AND distrito.nDisEstado =  1 
				AND departamento.nDepEstado = 1
				AND ((cProDescripcion = "-") OR ( provincia.cProDescripcion	LIKE CONCAT(cProDescripcion,"%") ))
				AND ((cDisDescripcion = "-") OR ( distrito.cDisDescripcion	LIKE CONCAT(cDisDescripcion,"%") ))
				AND ((cCasDescripcion = "-") OR ( caserio.cCasDescripcion	LIKE CONCAT(cCasDescripcion,"%") ))			
				AND ((cParDescSector = "-") OR ( 	p_sector.cParDescripcion LIKE CONCAT(cParDescSector,"%") ))
				AND ((cParNombre  = "-") OR ( 	p_sector.cParNombre  LIKE CONCAT(cParNombre ,"%") ))
				ORDER BY p_sector.cParDescripcion, caserio.cCasDescripcion , distrito.cDisDescripcion,provincia.cProDescripcion  ASC
				;
		
	END IF;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_SubPermisos_By_Usuario_Jerarquia
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_SubPermisos_By_Usuario_Jerarquia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_SubPermisos_By_Usuario_Jerarquia`(nPerTipo int(4), nPerEstado int(4), nPerUsuEstado Int(4), nPerUsuAccEstado Int(4), nParClase Int(4), cPerCodigo  varchar(20), nCanJerarquia Int(4), cJerarquia nVarChar(50), nPerUsuAccGrupo Int(4), nParJerarquia Int(4))
BEGIN
	SELECT
		persona.cPerCodigo,
		persona.cPerNombre,
		persona.nPerTipo,
		perusuacceso.nPerUsuAccGrupo,
    perusuacceso.nPerUsuAccCodigo,
		perusuacceso.nPerUsuAccEstado,
		parametro.cParJerarquia,
		parametro.cParNombre ,
		parametro.cParDescripcion AS NombreMenu,
    -- Concat(left(parametro.cParDescripcion,1),lower(right(parametro.cParDescripcion,(length(parametro.cParDescripcion)-1)))) AS NombreMenu,
		(length(parametro.cParJerarquia)) as CanJerarquia
	FROM persona
  INNER JOIN perusuario   ON persona.cPerCodigo    = perusuario.cPerCodigo
  INNER JOIN perusuacceso ON perusuario.cPerCodigo = perusuacceso.cPerCodigo
  INNER JOIN parametro    ON parametro.nParCodigo  = perusuacceso.nPerUsuAccCodigo AND  parametro.nParClase = perusuacceso.nPerUsuAccObjCodigo
	WHERE   persona.nPerTipo           = nPerTipo
  AND persona.nPerEstado             <> nPerEstado
  AND perusuario.nPerUsuEstado       <> nPerUsuEstado
  AND perusuacceso.nPerUsuAccEstado  <> nPerUsuAccEstado
  AND parametro.nParClase            = nParClase
  AND persona.cPerCodigo             = cPerCodigo
	AND LENGTH(parametro.cParJerarquia)= (nCanJerarquia+2)
	AND LEFT(parametro.cParJerarquia,nParJerarquia)= cJerarquia
	AND perusuacceso.nPerUsuAccGrupo	 = nPerUsuAccGrupo
	AND parametro.nParEstado <> 0
	ORDER BY parametro.cParJerarquia ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Ubigeo_nParCodSector
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Ubigeo_nParCodSector`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Ubigeo_nParCodSector`(nParCodigo INT)
BEGIN
	SELECT 
		p_sector.nParCodigo ,
		p_sector.cParDescripcion , 
		caserio.nCasCodigo,
		caserio.cCasDescripcion ,
		distrito.nDisCodigo , 
		distrito.cDisDescripcion , 
		provincia.nProCodigo ,
		provincia.cProDescripcion,
		departamento.nDepCodigo,
		departamento.cDepDescripcion
	FROM 
	parametro AS p_sector 
	INNER JOIN caserio ON caserio.nCasCodigo =  p_sector.cParJerarquia 
	INNER JOIN distrito ON distrito.nDisCodigo = caserio.nDisCodigo 
	INNER JOIN provincia ON provincia.nProCodigo =  distrito.nProCodigo
	INNER JOIN departamento ON departamento.nDepCodigo = provincia.nDepCodigo
	WHERE p_sector.nParClase =  2002 
	AND p_sector.nParEstado = 1 
	AND p_sector.nParCodigo = nParCodigo
	;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Usuario_By_Clave_UserName
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Usuario_By_Clave_UserName`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Usuario_By_Clave_UserName`(cUserName varchar(50),cUserClave varchar(50))
BEGIN
	SELECT  perusuario.cPerCodigo,
		 persona.cPerNombre,
		 persona.cPerApellidos
	FROM    perusuario
	Inner Join persona ON persona.cPerCodigo = perusuario.cPerCodigo
	WHERE   perusuario.cPerUsuCodigo  =cUserName
  AND perusuario.cPerUsuClave   = cUserClave
  AND perusuario.nPerUsuEstado  <> 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_Parametro`(nParCodigo int(11), nParClase int(11) ,cParNombre varchar(1000), cParDescripcion varchar(1000))
BEGIN

	DECLARE cParJerarquia VARCHAR(20);

-- Generar jerarquia para el parametro


	SELECT 	IFNULL( MAX(parametro.cParJerarquia)+1 , 1001 ) INTO cParJerarquia
	FROM 		parametro
	WHERE 	parametro.nParClase=nParClase AND parametro.nParCodigo <> 0 ;

		INSERT INTO parametro (parametro.nParCodigo,
												 parametro.nParClase,
												 parametro.cParJerarquia,
												 parametro.cParNombre,
												 parametro.cParDescripcion,
												 parametro.nParEstado)
  VALUES(nParCodigo, nParClase, cParJerarquia, cParNombre, cParDescripcion,	1);

	SELECT nParCodigo, cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_Transaccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_Transaccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_Transaccion`(nOpeCodigo int(11), cPerCodigo  varchar(20), cComputer varchar(250), cTraDescripcion varchar(250))
BEGIN

	insert into transaccion
		(cTraCodigo, nOpeCodigo, cPerCodigo, dTraFecha, cComputer, cTraDescripcion)
	values
		(CONCAT( CAST(replace(replace(replace(now(),'-',''),' ',''),':','') AS CHAR), LEFT(CAST(  REPLACE(UUID(),'-','') AS CHAR),36)),
		  nOpeCodigo,
		  cPerCodigo,
		  now(),
		  cComputer,
		  cTraDescripcion );

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_All_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_All_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_All_Parametro`(nParCodigo int(11), nParClase int(11) ,cParNombre varchar(100), cParDescripcion varchar(500))
BEGIN

	DECLARE cParJerarquia VARCHAR(20);

-- Generar jerarquia para el parametro
  SELECT 	IFNULL( MAX(parametro.cParJerarquia)+1 , 1001 ) INTO cParJerarquia
	FROM 		parametro
	WHERE 	parametro.nParClase=nParClase AND parametro.nParCodigo <> 0 ;

		INSERT INTO parametro (parametro.nParCodigo,
												 parametro.nParClase,
												 parametro.cParJerarquia,
												 parametro.cParNombre,
												 parametro.cParDescripcion,
												 parametro.nParEstado)
  VALUES(nParCodigo, nParClase, cParJerarquia, cParNombre, cParDescripcion,	1);

	SELECT nParCodigo, cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_All_Persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_All_Persona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_All_Persona`(cPerCodigo varchar(20), cPerNombre varchar(500), cPerApellidos varchar(500), dPerNacimiento varchar(20), nPerTipo int(3), nPerEstado int(3))
BEGIN
	/*registrar persona*/
	INSERT INTO persona(persona.cPerCodigo,
											persona.cPerNombre,
											persona.cPerApellidos,
											persona.dPerNacimiento,
											persona.nPerTipo,
											persona.nPerEstado)
	VALUES (cPerCodigo,
					cPerNombre,
					cPerApellidos,
					dPerNacimiento,
					nPerTipo,
					nPerEstado);

	SELECT cPerCodigo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_Caserio
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_Caserio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_Caserio`(cCasDescripcion VARCHAR(150), nDisCodigo INT)
BEGIN
	DECLARE nCasCodigo_ INT ; 
	SELECT 
		( IFNULL(MAX(caserio.nCasCodigo),0) + 1 )  INTO nCasCodigo_  
	FROM caserio  ;

	INSERT INTO caserio	(
		caserio.nCasCodigo, 
		caserio.cCasDescripcion, 
		caserio.nDisCodigo, 
		caserio.nCasEstado
	) 
	VALUES (nCasCodigo_, cCasDescripcion, nDisCodigo,1 );

	SELECT nCasCodigo_ AS nCasCodigo ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_CtaCteNumeracion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_CtaCteNumeracion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_CtaCteNumeracion`(cPerJuridica VARCHAR(20), nComTipo INT(11), nSerie INT(11), cNumero VARCHAR(20))
BEGIN

	INSERT INTO ctactenumeracion (
		ctactenumeracion.cPerJuridica,
		ctactenumeracion.nComTipo,
		ctactenumeracion.nSerie,
		ctactenumeracion.Numero
	)
	VALUES (cPerJuridica, nComTipo, nSerie, cNumero);

SELECT cPerJuridica ; 

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_DocPerParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_DocPerParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_DocPerParametro`(cDocCodigo varchar(20), cPerCodigo VARCHAR(20), nParCodigo INT(11), nParClase INT(11), cDocPerParValor varchar(500), cDocPerParGlosa VARCHAR(250))
BEGIN
		INSERT INTO docperparametro (
				docperparametro.cDocCodigo ,
				docperparametro.cPerCodigo, 
				docperparametro.nParCodigo, 
				docperparametro.nParClase, 
				docperparametro.cDocPerParValor, 
				docperparametro.cDocPerParGlosa, 
				docperparametro.nDocPerParEstado
				) 
		VALUES (cDocCodigo, cPerCodigo, nParCodigo, nParClase, cDocPerParValor, cDocPerParGlosa, 1);


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_DocPersona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_DocPersona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_DocPersona`(cDocCodigo varchar(20), nDocPerTipo int(11), cPerCodigo varchar(20), nPerRelacion int(11),  nDocTipo int(11))
BEGIN

	INSERT INTO docpersona(docpersona.cDocCodigo,
												 docpersona.nDocPerTipo,
												 docpersona.cPerCodigo,
												 docpersona.nPerRelacion,
												 docpersona.nDocTipo)
	VALUES(cDocCodigo,
				 nDocPerTipo,
				 cPerCodigo,
				 nPerRelacion,
				 nDocTipo);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_Parametro`(nParClase int(11) ,cParNombre varchar(100), cParDescripcion varchar(500))
BEGIN
  DECLARE nParCodigo INT;
	DECLARE cParJerarquia VARCHAR(20);
-- Generar codigo para el parametro
  SELECT 	IFNULL( MAX(parametro.nParCodigo)+1 , 1 ) INTO nParCodigo
	FROM		parametro
	WHERE		parametro.nParClase = nParClase;
-- Generar jerarquia para el parametro
  -- SELECT 	LPAD(IFNULL( MAX(parametro.cParJerarquia)+1 , 1001 ),4,'0') INTO cParJerarquia
	SELECT 	IFNULL( MAX(parametro.cParJerarquia)+1 , 1001 ) INTO cParJerarquia
	FROM 		parametro
	WHERE 	parametro.nParClase=nParClase AND parametro.nParCodigo <> 0 ;

		INSERT INTO parametro (parametro.nParCodigo,
												 parametro.nParClase,
												 parametro.cParJerarquia,
												 parametro.cParNombre,
												 parametro.cParDescripcion,
												 parametro.nParEstado)
  VALUES(nParCodigo, nParClase, cParJerarquia, cParNombre, cParDescripcion,	1);

	SELECT nParCodigo, cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_ParParametro`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11), nParDstClase int(11), cValor varchar(100))
BEGIN

		INSERT INTO parparametro (parparametro.nParSrcCodigo,
															parparametro.nParSrcClase,
															parparametro.nParDstCodigo,
															parparametro.nParDstClase,
															parparametro.cValor,
															parparametro.nParParEstado)
		VALUES (nParSrcCodigo, nParSrcClase, nParDstCodigo, nParDstClase,	cValor, 1);

		SELECT nParSrcCodigo ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_ParParExt
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_ParParExt`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_ParParExt`(nParSrcCodigo INT, nParSrcClase INT, nParDstCodigo INT, nParDstClase INT, nObjCodigo INT, nObjTipo INT, cParParExtValor VARCHAR(250), cParParExtGlosa VARCHAR(1000))
BEGIN
  # OK 
	INSERT INTO parparext (
		nParSrcCodigo, 
		nParSrcClase, 
		nParDstCodigo, 
		nParDstClase, 
		nObjCodigo, 
		nObjTipo, 
		cParParExtValor, 
		cParParExtGlosa
	) 
	VALUES (nParSrcCodigo, nParSrcClase, nParDstCodigo, nParDstClase, nObjCodigo, nObjTipo, cParParExtValor, cParParExtGlosa);
	
	SELECT nParSrcCodigo ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_PerCosecha
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_PerCosecha`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_PerCosecha`(cPerCodigo VARCHAR(20), nParcCodigo INT, nProdCodigo INT, nPrdCodigo INT, cCosCodigo VARCHAR(20), fHectareas FLOAT, fQuintales FLOAT, fKilogramos FLOAT,fHolgura FLOAT, cGlosa VARCHAR(250))
BEGIN

DECLARE nPerCosCodigo INT ; 

	INSERT INTO  percosecha (
		percosecha.nPerCosCodigo, 
		percosecha.cPerCodigo, 
		percosecha.nParcCodigo, 
		percosecha.nParcClase, 
		percosecha.nProdCodigo, 
		percosecha.nProdClase, 
		percosecha.nPrdCodigo, 
		percosecha.cCosCodigo, 
		percosecha.fHectareas, 
		percosecha.fQuintales, 
		percosecha.fKilogramos, 
		percosecha.fHolgura, 
		percosecha.cGlosa, 
		percosecha.nPerCosEstado
	) 
	VALUES (null, cPerCodigo, nParcCodigo, 2006, nProdCodigo, 2007, nPrdCodigo, cCosCodigo, fHectareas, fQuintales, fKilogramos,fHolgura, cGlosa, 1);
	-- devolvemos el autoincrement 
	SET nPerCosCodigo = LAST_INSERT_ID() ; 
	SELECT nPerCosCodigo ; 
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_PerDocumento
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_PerDocumento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_PerDocumento`(cPerCodigo VARCHAR(20), nPerDocTipo INT , cPerDocNumero VARCHAR(20) , dPerDocCaducidad DATE, nPerDocCategoria INT)
BEGIN

	INSERT INTO perdocumento (
	perdocumento.cPerCodigo,
	perdocumento.nPerDocTipo,
	perdocumento.cPerDocNumero,
	perdocumento.dPerDocCaducidad,
	perdocumento.nPerDocCategoria,
	perdocumento.nPerDocEstado
)
VALUES (cPerCodigo, nPerDocTipo, cPerDocNumero, dPerDocCaducidad, nPerDocCategoria, 1);

SELECT cPerCodigo ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_Periodo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_Periodo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_Periodo`(cPrdDescripcion VARCHAR(250), dPrdFecInic DATE , dPrdFecFin DATE , nPrdTipo INT(4) ,  nPrdEstado INT(4))
BEGIN

	-- SELECT MAX(CAST((nPrdCodigo) AS SIGNED))+1
SELECT ( IFNULL(MAX(CAST((nPrdCodigo) AS SIGNED)),0)+1 ) INTO @pnPeriodo
	FROM periodo ;

	INSERT INTO periodo
	(
		periodo.nPrdCodigo,
		periodo.cPrdDescripcion,
		periodo.dPrdFecInic,
		periodo.dPrdFecFin,
		periodo.nPrdTipo,
		periodo.nPrdEstado
	)
	VALUES
	(
		@pnPeriodo,
		cPrdDescripcion,
		dPrdFecInic,
		dPrdFecFin,
		nPrdTipo ,
		nPrdEstado
	);

		SELECT  @pnPeriodo AS nPrdCodigo ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_PerMail
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_PerMail`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_PerMail`(cPerCodigo VARCHAR(20),  cPerMail VARCHAR(120))
BEGIN
	DECLARE nPerMailItem_ INT ; 

	SELECT IFNULL(MAX(permail.nPerMailItem ) +1 ,1) INTO nPerMailItem_ 
	FROM permail 
	WHERE permail.cPerCodigo = cPerCodigo ;  


	INSERT INTO permail (permail.cPerCodigo, permail.nPerMailItem, permail.cPerMail, permail.nPerMailEstado)
	VALUES (cPerCodigo, nPerMailItem_ , cPerMail , 1 );

	SELECT cPerCodigo , nPerMailItem_ AS nPerMailItem ; 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_PerNatural
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_PerNatural`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_PerNatural`(cPerCodigo VARCHAR(20), cPerNatApePaterno VARCHAR(250), cPerNatApeMaterno VARCHAR(250) , nPerNatSexo INT, nPerNatEstCivi INT)
BEGIN

	INSERT INTO pernatural (
		pernatural.cPerCodigo, 
		pernatural.cPerNatApePaterno, 
		pernatural.cPerNatApeMaterno, 
		pernatural.nPerNatSexo, 
		pernatural.nPerNatEstCivil
	)
 VALUES (cPerCodigo, cPerNatApePaterno, cPerNatApeMaterno, nPerNatSexo, nPerNatEstCivi);

SELECT cPerCodigo ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_PerParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_PerParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_PerParametro`(cPerCodigo VARCHAR(20), nParCodigo INT , nParClase INT , cPerParValor VARCHAR(100) , cPerParGlosa VARCHAR(250))
BEGIN
	INSERT INTO perparametro(
		perparametro.cPerCodigo, 
		perparametro.nParCodigo, 
		perparametro.nParClase, 
		perparametro.cPerParValor, 
		perparametro.cPerParGlosa, 
		perparametro.nPerParEstado
	) 
	VALUES (cPerCodigo, nParCodigo, nParClase, cPerParValor, cPerParGlosa , 1);
	
	SELECT cPerCodigo ;
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_PerParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_PerParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_PerParParametro`(cPerCodigo VARCHAR(20), nParSrcCodigo INT, nParSrcClase INT, nParDstCodigo INT, nParDstClase INT, cParParValor VARCHAR(250), cParParGlosa VARCHAR(1000))
BEGIN
	-- ok 
	INSERT INTO  peparparametro (
		peparparametro.cPerCodigo, 
		peparparametro.nParSrcCodigo, 
		peparparametro.nParSrcClase, 
		peparparametro.nParDstCodigo, 
		peparparametro.nParDstClase, 
		peparparametro.cParParValor, 
		peparparametro.cParParGlosa
	) 
	VALUES (cPerCodigo, nParSrcCodigo, nParSrcClase, nParDstCodigo, nParDstClase, cParParValor, cParParGlosa);
	
	SELECT cPerCodigo ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_PerRelacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_PerRelacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_PerRelacion`(cPerCodigo VARCHAR(20), nPerRelTipo INT, cPerUsuario VARCHAR(20), dPerRelacion DATE, cPerObservacion VARCHAR(100))
BEGIN
 
	DECLARE cPerJuridica_ VARCHAR(20) ; 
	-- CON EL CODIGO DEL USUARIO VERIFICACMOS A QUE EMPRESA PERTENECE 
	-- cPerUsuario  es el usuario que esta en linea haciendo el registro de la persona 
		SELECT  perjuridica.cPerCodigo  INTO cPerJuridica_
		FROM  perjuridica
		INNER JOIN perrelacion ON perrelacion.cPerJuridica =   perjuridica.cPerCodigo 
		INNER JOIN persona ON persona.cPerCodigo = perrelacion.cPerCodigo 
		WHERE persona.cPerCodigo = cPerUsuario    ; 

	
	INSERT INTO perrelacion (
		perrelacion.cPerCodigo, 
		perrelacion.nPerRelTipo, 
		perrelacion.cPerJuridica, 
		perrelacion.dPerRelacion, 
		perrelacion.cPerObservacion, 
		perrelacion.nPerRelEstado
	) 
	VALUES (cPerCodigo, nPerRelTipo, cPerJuridica_ , dPerRelacion, cPerObservacion, 1);
	
	SELECT cPerCodigo , cPerJuridica_ AS cPerJuridica_;
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_Persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_Persona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_Persona`(cPerNombre varchar(500), cPerApellidos varchar(500), dPerNacimiento varchar(20), nPerTipo int(3), nPerEstado int(3))
BEGIN
	# declarar variable 
		DECLARE cPerCodigo_ VARCHAR(20);


  SELECT 	IFNULL( MAX(persona.cPerCodigo)+1 , CONCAT(nPerTipo , '000000001') )   INTO cPerCodigo_
	FROM		persona
	WHERE		LENGTH(persona.cPerCodigo) > 9
	AND 	persona.nPerTipo = nPerTipo;


	INSERT INTO persona(persona.cPerCodigo,
											persona.cPerNombre,
											persona.cPerApellidos,
											persona.dPerNacimiento,
											persona.nPerTipo,
											persona.nPerEstado)
	VALUES (cPerCodigo_,
					cPerNombre,
					cPerApellidos,
					dPerNacimiento,
					nPerTipo,
					nPerEstado);
	# seleccionar codigo 
		SELECT cPerCodigo_ AS cPerCodigo;



END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_PerTelefono
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_PerTelefono`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_PerTelefono`(cPerCodigo VARCHAR(20), nPerTelTipo INT,  cPerTelNumero VARCHAR(20))
BEGIN
	DECLARE nPerTelItem_ INT ; 

	SELECT IFNULL(MAX(pertelefono.nPerTelItem ) +1 ,1) INTO nPerTelItem_ 
	FROM pertelefono 
	WHERE pertelefono.cPerCodigo = cPerCodigo ;  

	INSERT INTO pertelefono (
		pertelefono.cPerCodigo, 
		pertelefono.nPerTelTipo, 
		pertelefono.nPerTelItem, 
		pertelefono.cPerTelNumero, 
		pertelefono.nPerTelEstado
	) 
	VALUES (cPerCodigo, nPerTelTipo, nPerTelItem_ , cPerTelNumero, 1);
	
	SELECT cPerCodigo, nPerTelItem_  AS nPerTelItem ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_PerUbigeo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_PerUbigeo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_PerUbigeo`(cPerCodigo VARCHAR(20), nPerUbiCodigo INT, cPerUbiGlosa VARCHAR(200))
BEGIN
	INSERT INTO perubigeo (
		perubigeo.cPerCodigo, 
		perubigeo.nPerUbiCodigo, 
		perubigeo.cPerUbiGlosa, 
		perubigeo.nPerUbiEstado
	) 
	VALUES (cPerCodigo, nPerUbiCodigo, cPerUbiGlosa, 1);

	SELECT cPerCodigo ; 

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_Transaccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_Transaccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_Transaccion`(nOpeCodigo int(11), cPerCodigo  varchar(20), cComputer varchar(250), cTraDescripcion varchar(250))
BEGIN

	insert into transaccion
		(cTraCodigo, nOpeCodigo, cPerCodigo, dTraFecha, cComputer, cTraDescripcion)
	values
		(CONCAT( CAST(replace(replace(replace(now(),'-',''),' ',''),':','') AS CHAR), LEFT(CAST(  REPLACE(UUID(),'-','') AS CHAR),36)),
		  nOpeCodigo,
		  cPerCodigo,
		  now(),
		  cComputer,
		  cTraDescripcion );

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_ubg_Get_Departamentos_by_nPaiCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_ubg_Get_Departamentos_by_nPaiCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ubg_Get_Departamentos_by_nPaiCodigo`(nPaiCodigo INT(11))
BEGIN
	SELECT 
		departamento.nDepCodigo, 
		departamento.cDepDescripcion
	FROM departamento 
	WHERE departamento.nDepEstado = 1 
	AND departamento.nPaiCodigo = nPaiCodigo 
	ORDER BY departamento.cDepDescripcion ASC ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_ubg_Get_Distritos_by_nProCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_ubg_Get_Distritos_by_nProCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ubg_Get_Distritos_by_nProCodigo`(nProCodigo INT(11))
BEGIN
	SELECT 
		distrito.nDisCodigo , 
		distrito.cDisDescripcion 
	FROM distrito 
	WHERE distrito.nProCodigo = nProCodigo
	AND distrito.nDisEstado = 1 
	ORDER BY distrito.cDisDescripcion ASC
	; 

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_ubg_Get_Provincias_by_nDepCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_ubg_Get_Provincias_by_nDepCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ubg_Get_Provincias_by_nDepCodigo`(nDepCodigo INT(11))
BEGIN
	SELECT 
		provincia.nProCodigo , 
		provincia.cProDescripcion 
	FROM provincia 
	WHERE provincia.nDepCodigo = nDepCodigo 
	AND provincia.nProEstado = 1 
	ORDER BY provincia.cProDescripcion  ASC
; 

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_Caserio
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_Caserio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_Caserio`(nCasCodigo INT, cCasDescripcion VARCHAR(150) ,nDisCodigo INT)
BEGIN
	UPDATE caserio SET 
		caserio.cCasDescripcion =  cCasDescripcion , 
		caserio.nDisCodigo      = nDisCodigo 
	WHERE caserio.nCasCodigo = nCasCodigo ; 
	
	SELECT nCasCodigo ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_Caserio_Estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_Caserio_Estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_Caserio_Estado`(nCasCodigo INT , nCasEstado INT)
BEGIN
		UPDATE caserio SET 
		caserio.nCasEstado =  nCasEstado 
	WHERE caserio.nCasCodigo = nCasCodigo ; 
	SELECT nCasCodigo ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_CtaCteNumeracion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_CtaCteNumeracion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_CtaCteNumeracion`(cPerJuridica varchar(20), nComTipo int(11), nSerie int(11), cNumero varchar(20))
BEGIN

	/*IF cPerJuridica="-" THEN
		UPDATE ctactenumeracion
		SET ctactenumeracion.Numero = LPAD (numero, 3, 0)
		WHERE ctactenumeracion.nComTipo = nParComprobante
		AND ctactenumeracion.nSerie = nParSerie
		AND ctactenumeracion.cPerJuridica = (SELECT cPerCodigo
						FROM perjuridica
						WHERE nPerEmpresa=1
						LIMIT 0,1);
	ELSE
		UPDATE ctactenumeracion
		SET ctactenumeracion.Numero = LPAD (numero, 3, 0)
		WHERE ctactenumeracion.nComTipo = nParComprobante
		AND ctactenumeracion.nSerie = nParSerie
		AND ctactenumeracion.cPerJuridica = cPerJuridica;
	END IF;*/
		UPDATE ctactenumeracion
		SET ctactenumeracion.Numero = cNumero
		WHERE ctactenumeracion.nComTipo = nComTipo
		AND ctactenumeracion.nSerie = nSerie
		AND ctactenumeracion.cPerJuridica = cPerJuridica;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_Parametro`(nParCodigo int(11), nParClase  int(11) , cParNombre varchar(100), cParDescripcion varchar(255))
BEGIN

		UPDATE parametro
			SET parametro.cParNombre = cParNombre,
					parametro.cParDescripcion = cParDescripcion
		WHERE parametro.nParCodigo = nParCodigo
		AND parametro.nParClase = nParClase
		AND parametro.nParEstado = 1;

	SELECT  nParCodigo  ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_Parametro_and_cParJerarquia
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_Parametro_and_cParJerarquia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_Parametro_and_cParJerarquia`(nParCodigo int(11), nParClase  int(11) ,cParJerarquia varchar(20), cParNombre varchar(100), cParDescripcion varchar(255))
BEGIN

		UPDATE parametro
			SET parametro.cParJerarquia = cParJerarquia,
					parametro.cParNombre = cParNombre,
					parametro.cParDescripcion = cParDescripcion 
					
		WHERE parametro.nParCodigo = nParCodigo
		AND parametro.nParClase = nParClase
		AND parametro.nParEstado = 1;

	SELECT  nParCodigo  ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_Parametro_Estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_Parametro_Estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_Parametro_Estado`(nParCodigo int(11), nParClase int(11) ,   nParEstado int(3))
BEGIN
  UPDATE parametro SET
				parametro.nParEstado = nParEstado
	WHERE parametro.nParCodigo = nParCodigo
	AND parametro.nParClase = nParClase ;

SELECT nParCodigo  ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_ParParametro_cValor
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_ParParametro_cValor`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_ParParametro_cValor`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11), nParDstClase int(11), cValor varchar(100))
BEGIN
	# OK 
	UPDATE parparametro
	SET parparametro.cValor = cValor
	WHERE parparametro.nParSrcCodigo = nParSrcCodigo
	AND parparametro.nParSrcClase = nParSrcClase
	AND parparametro.nParDstCodigo = nParDstCodigo
	AND parparametro.nParDstClase = nParDstClase;
	
	SELECT nParSrcCodigo ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_ParParametro_nEstado
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_ParParametro_nEstado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_ParParametro_nEstado`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11), nParDstClase int(11), cParEstado varchar(100))
BEGIN
  # OK 
	UPDATE parparametro
	SET parparametro.nParEstado = cParEstado
	WHERE parparametro.nParSrcCodigo = nParSrcCodigo
	AND parparametro.nParSrcClase    = nParSrcClase
	AND parparametro.nParDstCodigo   = nParDstCodigo
	AND parparametro.nParDstClase    = nParDstClase;

	SELECT nParSrcCodigo ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerCosecha
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerCosecha`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerCosecha`(nPerCosCodigo INT, ParcCodigo INT, nProdCodigo INT,  cCosCodigo VARCHAR(20), fHectareas FLOAT, fQuintales FLOAT, fKilogramos FLOAT,fHolgura FLOAT)
BEGIN
		UPDATE percosecha SET				
			percosecha.nParcCodigo   = nParcCodigo , 
			-- percosecha.nParcClase    = nParcClase , 
			percosecha.nProdCodigo   = nProdCodigo , 
			-- percosecha.nProdClase    = nProdClase , 
			-- percosecha.nPrdCodigo    = nPrdCodigo , 
			percosecha.cCosCodigo    = cCosCodigo , 
			percosecha.fHectareas    = fHectareas , 
			percosecha.fQuintales    = fQuintales , 
			percosecha.fKilogramos   = fKilogramos , 
			percosecha.fHolgura      = fHolgura 
		WHERE percosecha.nPerCosCodigo = nPerCosCodigo 
		;
		
	SELECT  nPerCosCodigo  ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerCosecha_Estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerCosecha_Estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerCosecha_Estado`(nPerCosCodigo INT, nPerCosEstado INT)
BEGIN
		UPDATE percosecha SET				
			percosecha.nPerCosEstado = nPerCosEstado 		
		WHERE percosecha.nPerCosCodigo = nPerCosCodigo 
		;
	
	SELECT  nPerCosCodigo  ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerDocumento_by_cPerCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerDocumento_by_cPerCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerDocumento_by_cPerCodigo`(cPerCodigo VARCHAR(20), nPerDocTipo INT , cPerDocNumero VARCHAR(20))
BEGIN
	UPDATE  perdocumento SET 				
		perdocumento.cPerDocNumero = cPerDocNumero
	WHERE perdocumento.cPerCodigo = cPerCodigo
	AND perdocumento.nPerDocTipo = nPerDocTipo ;
	
	SELECT cPerCodigo ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_Periodo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_Periodo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_Periodo`(nPrdCodigo INT(11) , cPrdDescripcion VARCHAR(250) , dPrdFecInic DATE , dPrdFecFin DATE, nPrdTipo INT(11))
BEGIN

	UPDATE periodo SET
		periodo.cPrdDescripcion = cPrdDescripcion,
		periodo.dPrdFecInic     = dPrdFecInic,
		periodo.dPrdFecFin      = dPrdFecFin,
		periodo.nPrdTipo        = nPrdTipo
	WHERE periodo.nPrdCodigo = nPrdCodigo;
	-- esto para que el metodo de conexion no duelva error cuando se trabaja con transacciones
	SELECT "Ok" AS cMensaje ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_Periodo_Estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_Periodo_Estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_Periodo_Estado`(nPrdCodigo INT(11), nPrdEstado INT(4))
BEGIN
	UPDATE periodo SET
		periodo.nPrdEstado = nPrdEstado
	WHERE periodo.nPrdCodigo = nPrdCodigo;
	SELECT "ok" AS cMensaje ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerMail
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerMail`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerMail`(cPerCodigo VARCHAR(20) ,  nPerMailItem INT , cPerMail VARCHAR(200))
BEGIN

	UPDATE permail SET 		 
		permail.cPerMail = cPerMail
	WHERE permail.cPerCodigo = cPerCodigo 
	AND permail.nPerMailItem = nPerMailItem 
	;

	SELECT cPerCodigo ; 

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerNatural
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerNatural`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerNatural`(cPerCodigo VARCHAR(20), cPerNatApePaterno VARCHAR(250), cPerNatApeMaterno VARCHAR(250), nPerNatSexo INT, nPerNatEstCivil INT)
BEGIN
	UPDATE pernatural SET 	
		pernatural.cPerNatApePaterno = cPerNatApePaterno, 
		pernatural.cPerNatApeMaterno = cPerNatApeMaterno, 
		pernatural.nPerNatSexo = nPerNatSexo, 
		pernatural.nPerNatEstCivil = nPerNatEstCivil 
	WHERE pernatural.cPerCodigo = cPerCodigo ;
	
	SELECT cPerCodigo ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerParametro`(cPerCodigo VARCHAR(20) , nParCodigo INT , nParClase INT , cPerParValor VARCHAR(100) , cPerParGlosa VARCHAR(250))
BEGIN
	-- ACTUALIZAR solomente -> cPerParValor , cPerParGlosa ;
	UPDATE perparametro SET 
		perparametro.cPerParValor = cPerParValor , 
		perparametro.cPerParGlosa = cPerParGlosa
	WHERE perparametro.cPerCodigo = cPerCodigo
	AND perparametro.nParCodigo = nParCodigo
	AND perparametro.nParClase = nParClase;
	
	SELECT cPerCodigo  ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerParametro_Estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerParametro_Estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerParametro_Estado`(cPerCodigo VARCHAR(20) , nParCodigo INT , nParClase INT ,nPerParEstado INT)
BEGIN
	
	UPDATE perparametro SET 		
		perparametro.nPerParEstado = nPerParEstado
	WHERE perparametro.cPerCodigo = cPerCodigo
	AND perparametro.nParCodigo = nParCodigo
	AND perparametro.nParClase = nParClase;
	
	SELECT cPerCodigo  ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerParametro_nParCodigoNew
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerParametro_nParCodigoNew`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerParametro_nParCodigoNew`(cPerCodigo VARCHAR(20) , nParCodigo INT , nParClase INT , cPerParValor VARCHAR(100) , cPerParGlosa VARCHAR(250) , nParCodigoNew INT)
BEGIN
	-- esto es para actualizar el nParCodigo cuando se seleccionar otro tipo de parametro para una clase 
	-- esto generalmente cuando se utilizan combos para el parametro 
	UPDATE perparametro SET 
		perparametro.nParCodigo = nParCodigoNew  , 
		perparametro.cPerParValor = cPerParValor , 
		perparametro.cPerParGlosa = cPerParGlosa
	WHERE perparametro.cPerCodigo = cPerCodigo
	AND perparametro.nParCodigo = nParCodigo
	AND perparametro.nParClase = nParClase;
	
	SELECT cPerCodigo  ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerRelacion_Estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerRelacion_Estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerRelacion_Estado`(cPerCodigo VARCHAR(20), nPerRelTipo INT, cPerUsuario VARCHAR(20) , nPerRelEstado INT)
BEGIN

	DECLARE cPerJuridica_ VARCHAR(20) ; 

	-- CON EL CODIGO DEL USUARIO VERIFICACMOS A QUE EMPRESA PERTENECE 
	-- cPerUsuario  es el usuario que esta en linea haciendo el registro de la persona 
		SELECT  perjuridica.cPerCodigo  INTO cPerJuridica_
		FROM  perjuridica
		INNER JOIN perrelacion ON perrelacion.cPerJuridica =   perjuridica.cPerCodigo 
		INNER JOIN persona ON persona.cPerCodigo = perrelacion.cPerCodigo 
		WHERE persona.cPerCodigo = cPerUsuario    ; 

	 -- Modificamos el nPerRelEstado la persona queda Innavilitada 
	 -- para el tipo de persona registra y para una determinada empresa 
		UPDATE perrelacion SET 
			perrelacion.nPerRelEstado = nPerRelEstado
		WHERE perrelacion.cPerCodigo = cPerCodigo
		AND perrelacion.nPerRelTipo  = nPerRelTipo 
		AND perrelacion.cPerJuridica = cPerJuridica_ ;

	SELECT cPerCodigo, cPerJuridica_ AS cPerJuridica ; 


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_Persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_Persona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_Persona`(cPerCodigo varchar(20), cPerNombre varchar(500), cPerApellidos varchar(500), dPerNacimiento varchar(20),  nPerEstado int(3))
BEGIN

	UPDATE persona
	SET persona.cPerNombre		=	cPerNombre,
			persona.cPerApellidos	=	cPerApellidos,
			persona.dPerNacimiento=	dPerNacimiento ,
			persona.nPerEstado		= nPerEstado
	WHERE persona.cPerCodigo	=  cPerCodigo;
	
	SELECT cPerCodigo ;
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerTelefono
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerTelefono`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerTelefono`(cPerCodigo VARCHAR(20),   nPerTelTipo INT , nPerTelItem INT , cPerTelNumero VARCHAR(20) , nPerTelTipNew INT)
BEGIN

	UPDATE pertelefono SET 		
		pertelefono.nPerTelTipo = nPerTelTipNew ,		
		pertelefono.cPerTelNumero = cPerTelNumero 
	WHERE pertelefono.cPerCodigo = cPerCodigo
	AND pertelefono.nPerTelTipo = nPerTelTipo
	AND pertelefono.nPerTelItem = nPerTelItem;

	SELECT cPerCodigo ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerUbigeo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerUbigeo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerUbigeo`(cPerCodigo VARCHAR(20), nPerUbiCodigo INT , cPerUbiGlosa VARCHAR(200) ,  nPerUbiCodigoNew INT)
BEGIN
	UPDATE  perubigeo SET 	
		perubigeo.nPerUbiCodigo = nPerUbiCodigoNew , 
		perubigeo.cPerUbiGlosa  = cPerUbiGlosa
	WHERE perubigeo.cPerCodigo = cPerCodigo 
	AND perubigeo.nPerUbiCodigo = nPerUbiCodigo;
	
SELECT cPerCodigo ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_Caserio
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_Caserio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_Caserio`(cCasDescripcion VARCHAR(150) , nDisCodigo INT)
BEGIN

	SELECT 
		caserio.nCasCodigo , 
		caserio.cCasDescripcion ,
		caserio.nDisCodigo
	FROM caserio 
	WHERE caserio.cCasDescripcion = cCasDescripcion
		AND	caserio.nDisCodigo = nDisCodigo ; 


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_CtaCteNumeracion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_CtaCteNumeracion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_CtaCteNumeracion`(cPerJuridica varchar(20), nComTipo int(11))
BEGIN
	
	SELECT 
		ctactenumeracion.nSerie, 
		ctactenumeracion.Numero
	FROM ctactenumeracion
	WHERE ctactenumeracion.cPerJuridica = cPerJuridica
	AND ctactenumeracion.nComTipo = nComTipo;
	#cPerJuridica .: codigo del punto de emision
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_Parametro`(nParClase int(11), cParNombre varchar(100), cParDescripcion varchar(500))
BEGIN

		SELECT 	parametro.nParCodigo,
						parametro.cParNombre,
						cParDescripcion
		FROM parametro
		WHERE parametro.nParEstado = 1
		AND	parametro.nParClase = nParClase
		AND ( ( cParNombre 			= "-" ) OR ( parametro.cParNombre 			= cParNombre ) )
		AND	( ( cParDescripcion = "-" ) OR ( parametro.cParDescripcion 	= cParDescripcion ) );

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_Parametro_Upd
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_Parametro_Upd`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_Parametro_Upd`(nParCodigo int ,nParClase int(11), cParNombre varchar(100), cParDescripcion varchar(500))
BEGIN

		SELECT 	parametro.nParCodigo,
						parametro.cParNombre,
						cParDescripcion
		FROM parametro
		WHERE parametro.nParEstado = 1
		AND parametro.nParCodigo <> nParCodigo
		AND	parametro.nParClase = nParClase
		AND ( ( cParNombre 			= "-" ) OR ( parametro.cParNombre 			= cParNombre ) )
		AND	( ( cParDescripcion = "-" ) OR ( parametro.cParDescripcion 	= cParDescripcion ) );

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_PerCosecha
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_PerCosecha`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_PerCosecha`(cPerCodigo VARCHAR(20), nParcCodigo INT , nProdCodigo INT, nPrdCodigo INT)
BEGIN

	SELECT 
		percosecha.nPerCosCodigo , 
		percosecha.cCosCodigo, 
		percosecha.fHectareas,
		percosecha.fQuintales, 
		percosecha.fQuintales, 
		percosecha.fKilogramos,
		percosecha.fHolgura
	FROM percosecha
	WHERE percosecha.cPerCodigo = cPerCodigo
	AND percosecha.nPrdCodigo = nPrdCodigo
	AND ( (nParcCodigo = 0 ) OR (percosecha.nParcCodigo = nParcCodigo) ) 
	AND ( (nParcCodigo = 0 ) OR (percosecha.nParcClase =  2006) ) 
	AND ( (nProdCodigo = 0 ) OR (percosecha.nProdCodigo = nProdCodigo) ) 
	AND ( (nProdCodigo = 0 ) OR (percosecha.nProdClase = 2007 ) ) 
	; 


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_PerCosecha_Upd
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_PerCosecha_Upd`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_PerCosecha_Upd`(nPerCosCodigo INT,cPerCodigo VARCHAR(20), nParcCodigo INT , nProdCodigo INT, nPrdCodigo INT)
BEGIN

	SELECT 
		percosecha.nPerCosCodigo , 
		percosecha.cCosCodigo, 
		percosecha.fHectareas,
		percosecha.fQuintales, 
		percosecha.fQuintales, 
		percosecha.fKilogramos,
		percosecha.fHolgura
	FROM percosecha
	WHERE percosecha.cPerCodigo = cPerCodigo
	AND percosecha.nParcCodigo = nParcCodigo
	AND percosecha.nParcClase =  2006
	AND percosecha.nProdCodigo = nProdCodigo
	AND percosecha.nProdClase = 2007 
	AND percosecha.nPrdCodigo = nPrdCodigo 
	AND percosecha.nPerCosCodigo <> nPerCosCodigo 
	LIMIT 1;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_PerDocumento
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_PerDocumento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_PerDocumento`(cPerCodigo VARCHAR(20) ,  nPerDocTipo INT ,cPerDocNumero VARCHAR(20) )
BEGIN
	SELECT 
		perdocumento.cPerCodigo , 
		perdocumento.cPerDocNumero ,
		perdocumento.nPerDocTipo
	FROM perdocumento 
	WHERE ((cPerCodigo = "-") OR (perdocumento.cPerCodigo = cPerCodigo))	
	AND ((nPerDocTipo = 0 ) OR (perdocumento.nPerDocTipo = nPerDocTipo ))
	AND ((cPerDocNumero = "-") OR (perdocumento.cPerDocNumero = cPerDocNumero));


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_PerDocumento_Upd
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_PerDocumento_Upd`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_PerDocumento_Upd`(cPerCodigo VARCHAR(20) , cPerDocNumero VARCHAR(20))
BEGIN
	SELECT 
		perdocumento.cPerCodigo , 
		perdocumento.cPerDocNumero ,
		perdocumento.nPerDocTipo
	FROM perdocumento 
	WHERE perdocumento.cPerCodigo <> cPerCodigo
	AND perdocumento.cPerDocNumero = cPerDocNumero
	LIMIT 1 ;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_Periodo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_Periodo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_Periodo`(nPrdCodigo int(11) , cPrdDescripcion varchar(150) , dPrdFecInic varchar(20) , dPrdFecFin varchar(20))
BEGIN

	SELECT
				periodo.nPrdCodigo ,
				periodo.cPrdDescripcion ,
				periodo.dPrdFecInic ,
				periodo.dPrdFecFin,
				periodo.nPrdEstado
	FROM periodo
	WHERE ((nPrdCodigo = 0 ) OR ( periodo.nPrdCodigo = nPrdCodigo ))
		AND ((cPrdDescripcion = '-' ) OR ( periodo.cPrdDescripcion = cPrdDescripcion ))
		AND ((dPrdFecInic = '-' ) OR ( periodo.dPrdFecInic = dPrdFecInic ))
		AND ((dPrdFecFin = '-' ) OR ( periodo.dPrdFecFin = dPrdFecFin ))
 ;
-- nPrdCodigo , cPrdDescripcion , dPrdFecInic , dPrdFecFin
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_Periodo_by_Fecha
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_Periodo_by_Fecha`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_Periodo_by_Fecha`(dPrdFecha DATE , nPrdTipo INT(4))
BEGIN

	SELECT
				periodo.nPrdCodigo ,
				periodo.cPrdDescripcion ,
				periodo.dPrdFecInic ,
				periodo.dPrdFecFin ,
				periodo.nPrdEstado
				FROM periodo
	WHERE dPrdFecha  BETWEEN periodo.dPrdFecInic AND periodo.dPrdFecFin
	AND periodo.nPrdTipo = nPrdTipo
	AND nPrdEstado IN( 1 , 2) ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_Persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_Persona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_Persona`(cPerCodigo varchar(20) ,cPerNombres varchar(500), cPerApellidos varchar(500))
BEGIN

		SELECT 	persona.cPerCodigo,
						persona.cPerNombre,
						persona.cPerApellidos,
						persona.dPerNacimiento
		FROM persona
		WHERE persona.nPerEstado = 1
		AND ( ( cPerCodigo		= "-" ) OR ( persona.cPerCodigo 		= cPerCodigo 	) )
		AND ( ( cPerNombres		= "-" ) OR ( TRIM(persona.cPerNombre) 		= TRIM(cPerNombres) 	) )
		AND	( ( cPerApellidos	=	"-" ) OR ( TRIM(persona.cPerApellidos) 	= TRIM(cPerApellidos) ) );

END
;;
DELIMITER ;
