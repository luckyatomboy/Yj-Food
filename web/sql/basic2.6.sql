ALTER TABLE `ss_menu_items` CHANGE published published VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1';
ALTER TABLE `ss_products` CHANGE introduction introduction TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL;
ALTER TABLE `ss_articles` CHANGE intro intro TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL;
ALTER TABLE  `ss_users` CHANGE  email email VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
ALTER TABLE `ss_bulletins` CHANGE title title VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL;
alter table `ss_users` ADD COLUMN nickname VARCHAR(45);
alter table `ss_users` ADD COLUMN gender varchar(2);
alter table `ss_users` ADD COLUMN birthday varchar(20);
alter table `ss_users` ADD COLUMN country varchar(100);
alter table `ss_users` ADD COLUMN city varchar(100);
alter table `ss_users` ADD COLUMN addr1 varchar(255);
alter table `ss_users` ADD COLUMN addr2 VARCHAR(45);
alter table `ss_users` ADD COLUMN zipcode varchar(20);
alter table `ss_users` ADD COLUMN telphone varchar(50);
alter table `ss_users` ADD COLUMN params longtext;
CREATE TABLE `ss_user_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_type` int(11) NOT NULL,
  `showinlist` enum('0','1') NOT NULL DEFAULT '0',
  `required` enum('0','1') NOT NULL DEFAULT '0',
  `i_order` int(11) NOT NULL,
  `label` text NOT NULL,
  `options` text,
  PRIMARY KEY (`id`),
  KEY `i_order` (`i_order`),
  KEY `list_with_order` (`showinlist`,`i_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

INSERT INTO `ss_user_fields` (`id`, `field_type`, `showinlist`, `required`, `i_order`, `label`, `options`) VALUES (1, 0, '1', '0', 1, 'full_name', NULL),(2, 0, '0', '0', 3, 'nickname', NULL),(3, 0, '0', '0', 7, 'country', NULL),(4, 0, '0', '0', 8, 'city', NULL),(5, 0, '0', '0', 5, 'birthday', NULL),(6, 0, '0', '0', 9, 'addr1', NULL),(7, 0, '0', '0', 10, 'zipcode', NULL),(8, 0, '1', '0', 2, 'mobile', NULL),(9, 0, '0', '0', 4, 'gender', NULL),(10, 0, '0', '0', 6, 'telphone', NULL);
CREATE TABLE `ss_third_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` varchar(50) NOT NULL,
  `appid` varchar(100) NOT NULL DEFAULT '',
  `appsecret` varchar(100) NOT NULL DEFAULT '',
  `active` smallint(6) NOT NULL DEFAULT '0',
  `options` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_type` (`account_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `ss_user_oauths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `auth_type` varchar(50) NOT NULL,
  `auth_key` varchar(200) NOT NULL,
  `access_code` varchar(200) NOT NULL DEFAULT '',
  `nickname` varchar(200) NOT NULL DEFAULT '',
  `options` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_type` (`auth_type`,`auth_key`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `ss_emails` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(6) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `is_mail` tinyint(1) NOT NULL,
  `send_id` int(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `is_ok` tinyint(1) NOT NULL default '1',
  `create_time` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

ALTER TABLE  `ss_site_infos` CHANGE  site_name  site_name TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;