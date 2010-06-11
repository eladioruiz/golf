CREATE TABLE `audit_trails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=469 DEFAULT CHARSET=latin1;

CREATE TABLE `card_strokes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL,
  `hole_id` int(11) DEFAULT NULL,
  `strokes` int(11) DEFAULT NULL,
  `putts` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=latin1;

CREATE TABLE `cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `match_id` int(11) DEFAULT NULL,
  `strokes_total` int(11) DEFAULT NULL,
  `strokes_first_9` int(11) DEFAULT NULL,
  `strokes_second_9` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

CREATE TABLE `charts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `course_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `principal` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `course_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `handicap` int(11) DEFAULT NULL,
  `length_white` int(11) DEFAULT NULL,
  `length_blue` int(11) DEFAULT NULL,
  `length_yellow` int(11) DEFAULT NULL,
  `length_red` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `n_holes` int(11) DEFAULT '18',
  `short_description` varchar(250) DEFAULT NULL,
  `long_description` varchar(1000) DEFAULT NULL,
  `founded` varchar(100) DEFAULT NULL,
  `designer` varchar(100) DEFAULT NULL,
  `course_type_id` int(11) DEFAULT NULL,
  `ability_recommended` int(11) DEFAULT NULL,
  `maintance` int(11) DEFAULT NULL,
  `relief` int(11) DEFAULT NULL,
  `wind` int(11) DEFAULT NULL,
  `water_in_play` int(11) DEFAULT NULL,
  `trees_in_play` int(11) DEFAULT NULL,
  `location_latitude` varchar(255) DEFAULT NULL,
  `location_longitude` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `dummies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fool_text` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `holes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `par` int(11) DEFAULT NULL,
  `handicap` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `length_red` int(11) DEFAULT NULL,
  `length_yellow` int(11) DEFAULT NULL,
  `length_blue` int(11) DEFAULT NULL,
  `length_white` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

CREATE TABLE `matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `date_hour_match` datetime DEFAULT NULL,
  `holes` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `privacy_type_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `match_id` int(11) DEFAULT NULL,
  `tee_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `handicap` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

CREATE TABLE `plugin_schema_info` (
  `plugin_name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `privacy_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

CREATE TABLE `privacy_types` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `isadmin` tinyint(1) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_allowed` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barras` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `crypted_password` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `handicap` decimal(10,0) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `privacy_type_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO schema_migrations (version) VALUES ('20090808175148');

INSERT INTO schema_migrations (version) VALUES ('20090808181139');

INSERT INTO schema_migrations (version) VALUES ('20090808182043');

INSERT INTO schema_migrations (version) VALUES ('20090808182228');

INSERT INTO schema_migrations (version) VALUES ('20090808183823');

INSERT INTO schema_migrations (version) VALUES ('20090822090239');

INSERT INTO schema_migrations (version) VALUES ('20090905153253');

INSERT INTO schema_migrations (version) VALUES ('20091023182617');

INSERT INTO schema_migrations (version) VALUES ('20091024083626');

INSERT INTO schema_migrations (version) VALUES ('20091109194451');

INSERT INTO schema_migrations (version) VALUES ('20091109194704');

INSERT INTO schema_migrations (version) VALUES ('20091208110619');

INSERT INTO schema_migrations (version) VALUES ('20091231192020');

INSERT INTO schema_migrations (version) VALUES ('20100304194438');

INSERT INTO schema_migrations (version) VALUES ('20100304195342');

INSERT INTO schema_migrations (version) VALUES ('20100306130853');

INSERT INTO schema_migrations (version) VALUES ('20100307153455');

INSERT INTO schema_migrations (version) VALUES ('20100417173859');

INSERT INTO schema_migrations (version) VALUES ('20100417174003');

INSERT INTO schema_migrations (version) VALUES ('20100419203405');

INSERT INTO schema_migrations (version) VALUES ('20100419210649');

INSERT INTO schema_migrations (version) VALUES ('20100420185020');

INSERT INTO schema_migrations (version) VALUES ('20100420185103');

INSERT INTO schema_migrations (version) VALUES ('20100424181031');