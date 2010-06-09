/*DROP TABLE `privacy_types`;*/

CREATE TABLE `privacy_types` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*DROP TABLE `privacy_friends`;*/

CREATE TABLE `privacy_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO privacy_types (id,description) VALUES (1,'Privado');
INSERT INTO privacy_types (id,description) VALUES (2,'Público');
INSERT INTO privacy_types (id,description) VALUES (3,'Amigo');


ALTER TABLE users add privacy_type_id int(11) default 1 null;
UPDATE users SET privacy_type_id=1;

ALTER TABLE matches add privacy_type_id int(11) default 1 null;
UPDATE users SET privacy_type_id=1;

