LOCK TABLES `ss_static_contents` WRITE;
UPDATE `ss_static_contents` SET `flag` = 'company' WHERE `id` = '2';
UNLOCK TABLES;
LOCK TABLES `ss_static_contents` WRITE;
UPDATE `ss_static_contents` SET `flag` = 'contact' WHERE `id` = '1';
UNLOCK TABLES;