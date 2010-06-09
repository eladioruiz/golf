/*CREATE TABLE `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
*/
CREATE TABLE `rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_allowed` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

insert into rights (user_id,controller,action,action_allowed) values (1,'matches','index',1);
insert into rights (user_id,controller,action,action_allowed) values (1,'matches','show',1);
insert into rights (user_id,controller,action,action_allowed) values (1,'matches','new',1);
insert into rights (user_id,controller,action,action_allowed) values (1,'matches','edit',1);
insert into rights (user_id,controller,action,action_allowed) values (1,'matches','create',1);
insert into rights (user_id,controller,action,action_allowed) values (1,'matches','update',1);
insert into rights (user_id,controller,action,action_allowed) values (1,'matches','destroy',1);
insert into rights (user_id,controller,action,action_allowed) values (1,'matches','print',1);
