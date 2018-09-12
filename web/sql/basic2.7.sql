alter table `ss_friendlinks` ADD COLUMN i_order int(5) not null default '0' after create_time;
alter table `ss_menu_items` ADD COLUMN url varchar(255) default '' after title;
alter table `ss_menu_items` ADD COLUMN content_id int(11) default '0' after url;
alter table `ss_messages` ADD COLUMN param text null after message;
alter table `ss_online_qqs` ADD COLUMN i_order int(3) not null default '0' after category;
alter table `ss_static_contents` ADD COLUMN flag varchar(45) not null default 'static' after for_roles;
alter table `ss_user_extends` ADD COLUMN total_point int(11) null after user_id;
alter table `ss_marquees` ADD COLUMN i_order int(5) not null default '0' after link;
alter table `ss_marquees` ADD COLUMN create_time varchar(20) not null after i_order;
delete from `ss_module_blocks` where module='mod_static' and action='custom_html' and alias='mb_foot' and s_pos='footer' and s_param like '%www.sitestar.cn%';
INSERT INTO `ss_parameters` (`id`, `key`, `val`) VALUES (NULL, 'INIT3', '0'),(NULL, 'QQ_SHOW_TYPE', '1');
ALTER TABLE `ss_users` CHANGE gender gender VARCHAR(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL;
ALTER TABLE `ss_users` CHANGE birthday birthday VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL;
CREATE TABLE `ss_msg_fields` (
  `id` int(11) NOT NULL auto_increment,
  `field_type` int(11) NOT NULL,
  `showinlist` enum('0','1') NOT NULL default '0',
  `required` enum('0','1') NOT NULL default '0',
  `i_order` int(11) NOT NULL,
  `label` text NOT NULL,
  `options` text,
  PRIMARY KEY  (`id`),
  KEY `i_order` (`i_order`),
  KEY `list_with_order` (`showinlist`,`i_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

INSERT INTO `ss_msg_fields` VALUES (1, 0, '1', '1', 1, 'username', NULL);
INSERT INTO `ss_msg_fields` VALUES (2, 0, '1', '1', 2, 'email', NULL);
INSERT INTO `ss_msg_fields` VALUES (3, 0, '1', '1', 3, 'tele', NULL);
INSERT INTO `ss_msg_fields` VALUES (4, 0, '1', '1', 4, 'message', NULL);

CREATE TABLE `ss_users_points` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '0',
  `orderid` int(11) NOT NULL default '0',
  `type` varchar(5) collate utf8_unicode_ci NOT NULL default 'in',
  `point` int(11) NOT NULL default '0',
  `momo` varchar(255) collate utf8_unicode_ci default NULL,
  `create_time` bigint(8) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;