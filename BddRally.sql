DROP DATABASE IF EXISTS bddRallyLecture;
CREATE DATABASE bddRallyLecture;

DROP TABLE IF EXISTS Editeur;
/*SUPPRESSION DE LA TABLE Editeur SI ELLE EXISTE*/
CREATE TABLE editeur (
	id int NOT NULL AUTO_INCREMENT,
	nom VARCHAR(60),
	PRIMARY KEY (id)
	)ENGINE=INNODB;

DROP TABLE IF EXISTS Auteur;
/*SUPPRESSION DE LA TABLE Auteur SI ELLE EXISTE*/
CREATE TABLE auteur (
	id int NOT NULL AUTO_INCREMENT,
	nom VARCHAR(60),
	PRIMARY KEY (id)
	)ENGINE=INNODB;

DROP TABLE IF EXISTS Livre;
/*SUPPRESSION DE LA TABLE Livre SI ELLE EXISTE*/
CREATE TABLE livre (
	id int NOT NULL AUTO_INCREMENT,
	titre VARCHAR(45),
	couverture VARCHAR(100),
	idAuteur int ,
	idEditeur int,
	PRIMARY KEY (id),
	FOREIGN KEY (idAuteur) REFERENCES Auteur(id),
	FOREIGN KEY (idEditeur) REFERENCES Editeur(id)
	)ENGINE=INNODB;

DROP TABLE IF EXISTS Rallye;
/*SUPPRESSION DE LA TABLE Rallye SI ELLE EXISTE*/
CREATE TABLE rallye (
	id int NOT NULL AUTO_INCREMENT,
	dateDebut date,
	duree int NOT NULL,
	theme VARCHAR (45),
	PRIMARY KEY (id)
	)ENGINE=INNODB;


DROP TABLE IF EXISTS Comporter;
/*SUPPRESSION DE LA TABLE Comporter SI ELLE EXISTE*/
CREATE TABLE comporter(
	idLivre int,
	idRallye int,
	FOREIGN KEY (idLivre) REFERENCES Livre(id),
	FOREIGN KEY (idRallye) REFERENCES Rallye(id)
	)ENGINE=INNODB;


DROP TABLE IF EXISTS Question;
/*SUPPRESSION DE LA TABLE Question SI ELLE EXISTE*/
CREATE TABLE question(
	id int NOT NULL AUTO_INCREMENT,
	question VARCHAR(255),
	points int,
	idLivre int,
	PRIMARY KEY(id),
	FOREIGN KEY (idLivre) REFERENCES Livre(id)
	)ENGINE=INNODB;


DROP TABLE IF EXISTS Proposition;
/*SUPPRESSION DE LA TABLE Proposition SI ELLE EXISTE*/
CREATE TABLE proposition (
	id int NOT NULL AUTO_INCREMENT,
	idQuestion int NOT NULL,
	proposition VARCHAR(255),
	solution int,
	PRIMARY KEY (id),
	FOREIGN KEY (idQuestion) REFERENCES Question(id)
	)ENGINE=INNODB;

DROP TABLE IF EXISTS Reponse;
/*SUPPRESSION DE LA TABLE Reponse SI ELLE EXISTE*/
CREATE TABLE reponse (
	idParticiperRally int NOT NULL,
	idParticiperEleve int NOT NULL,
	idQuestion int NOT NULL,
	idProposition int NOT NULL,
	FOREIGN KEY (idQuestion) REFERENCES Question(id),
	FOREIGN KEY (idProposition) REFERENCES Proposition(id)
	)ENGINE=INNODB;


CREATE TABLE enseignant(
id int NOT NULL AUTO_INCREMENT,
nom varchar (45),
prenom varchar (45),
login varchar (100),
idAuth int,
PRIMARY KEY (id) /* Declaration of the primary key (clé primaire)*/
)engine=innodb;



CREATE TABLE classe(
id int NOT NULL AUTO_INCREMENT,
idEnseignant int,
FOREIGN KEY (idEnseignant) REFERENCES enseignant(id),
anneeScolaire varchar (45),
idNiveau int,
FOREIGN KEY (idNiveau) REFERENCES Niveau(id),
PRIMARY KEY (id) /* Declaration of the primary key (clé primaire)*/
)engine=innodb;

/*Creation of table "niveau"*/
DROP TABLE if exists niveau; /*Removing the table "niveau" for supress, errors*/
CREATE TABLE niveau (
id int NOT NULL AUTO_INCREMENT,
niveauScolaire varchar (45),
PRIMARY KEY (id)
)engine=innodb;


DROP TABLE if exists Eleve;
/*Creation of table "eleve"*/
CREATE TABLE eleve (
id int NOT NULL AUTO_INCREMENT,
idClasse int NOT NULL,
FOREIGN KEY (idClasse) REFERENCES Classe(id),
nom varchar (45),
prenom varchar (45),
login varchar (100),
idAuth int,
PRIMARY KEY (id)
)engine=innodb;


DROP TABLE if exists Participer;
/*Creation of table "participer"*/
CREATE TABLE participer (
idRallye int,
idEleve int,
FOREIGN KEY (idRallye) REFERENCES Rallye(id),
FOREIGN KEY (idEleve) REFERENCES Eleve(id)
)engine=innodb;


/*
	Aauth SQL Table Structure
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `aauth_groups`
-- ----------------------------
DROP TABLE IF EXISTS `aauth_groups`;
CREATE TABLE `aauth_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100),
  `definition` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aauth_groups
-- ----------------------------
INSERT INTO `aauth_groups` VALUES ('1', 'Admin', 'Super Admin Group');
INSERT INTO `aauth_groups` VALUES ('2', 'Public', 'Public Access Group');
INSERT INTO `aauth_groups` VALUES ('3', 'Default', 'Default Access Group');

-- ----------------------------
-- Table structure for `aauth_perms`
-- ----------------------------
DROP TABLE IF EXISTS `aauth_perms`;
CREATE TABLE `aauth_perms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100),
  `definition` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aauth_perms
-- ----------------------------

-- ----------------------------
-- Table structure for `aauth_perm_to_group`
-- ----------------------------
DROP TABLE IF EXISTS `aauth_perm_to_group`;
CREATE TABLE `aauth_perm_to_group` (
  `perm_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`perm_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aauth_perm_to_group
-- ----------------------------

-- ----------------------------
-- Table structure for `aauth_perm_to_user`
-- ----------------------------
DROP TABLE IF EXISTS `aauth_perm_to_user`;
CREATE TABLE `aauth_perm_to_user` (
  `perm_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`perm_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aauth_perm_to_user
-- ----------------------------

-- ----------------------------
-- Table structure for `aauth_pms`
-- ----------------------------
DROP TABLE IF EXISTS `aauth_pms`;
CREATE TABLE `aauth_pms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) unsigned NOT NULL,
  `receiver_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text,
  `date_sent` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `pm_deleted_sender` int(1) DEFAULT NULL,
  `pm_deleted_receiver` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `full_index` (`id`,`sender_id`,`receiver_id`,`date_read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aauth_pms
-- ----------------------------

-- ----------------------------
-- Table structure for `aauth_users`
-- ----------------------------
DROP TABLE IF EXISTS `aauth_users`;
CREATE TABLE `aauth_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_general_ci NOT NULL,
  `pass` varchar(64) COLLATE utf8_general_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_general_ci,
  `banned` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `forgot_exp` text COLLATE utf8_general_ci,
  `remember_time` datetime DEFAULT NULL,
  `remember_exp` text COLLATE utf8_general_ci,
  `verification_code` text COLLATE utf8_general_ci,
  `totp_secret` varchar(16) COLLATE utf8_general_ci DEFAULT NULL,
  `ip_address` text COLLATE utf8_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of aauth_users
-- ----------------------------
INSERT INTO `aauth_users` VALUES ('1', 'admin@example.com', 'dd5073c93fb477a167fd69072e95455834acd93df8fed41a2c468c45b394bfe3', 'Admin', '0', null, null, null, null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for `aauth_user_to_group`
-- ----------------------------
DROP TABLE IF EXISTS `aauth_user_to_group`;
CREATE TABLE `aauth_user_to_group` (
  `user_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aauth_user_to_group
-- ----------------------------
INSERT INTO `aauth_user_to_group` VALUES ('1', '1');
INSERT INTO `aauth_user_to_group` VALUES ('1', '3');

-- ----------------------------
-- Table structure for `aauth_user_variables`
-- ----------------------------
DROP TABLE IF EXISTS `aauth_user_variables`;
CREATE TABLE `aauth_user_variables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `data_key` varchar(100) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aauth_user_variables
-- ----------------------------

-- ----------------------------
-- Table structure for `aauth_group_to_group`
-- ----------------------------
DROP TABLE IF EXISTS `aauth_group_to_group`;
CREATE TABLE `aauth_group_to_group` (
  `group_id` int(11) unsigned NOT NULL,
  `subgroup_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`subgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aauth_group_to_group
-- ----------------------------

-- ----------------------------
-- Table structure for `aauth_login_attempts`
-- ----------------------------

CREATE TABLE IF NOT EXISTS `aauth_login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(39) DEFAULT '0',
  `timestamp` datetime DEFAULT NULL,
  `login_attempts` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aauth_login_attempts
-- ----------------------------
