
#新增表 file_management
DROP TABLE IF EXISTS `file_management`;
CREATE TABLE `file_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_folder` int(11) DEFAULT NULL,
  `absolute_path` varchar(255) DEFAULT NULL,
  `item_id` varchar(255) DEFAULT NULL,
  `type` varchar(32) DEFAULT 'upload',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=595 DEFAULT CHARSET=utf8;

#新增列模板标识
ALTER TABLE fuwu ADD COLUMN muban_Tag VARCHAR(32);
ALTER TABLE faxian ADD COLUMN muban_Tag VARCHAR(32);
ALTER TABLE commodity ADD COLUMN muban_Tag VARCHAR(32);
ALTER TABLE quchu ADD COLUMN muban_Tag VARCHAR(32);

#新增信息类文章描述消息字段
ALTER TABLE toutiao ADD COLUMN described text;
ALTER TABLE commodity ADD COLUMN described text;
ALTER TABLE fuwu ADD COLUMN described text;
ALTER TABLE faxian ADD COLUMN described text;
ALTER TABLE quchu ADD COLUMN described text;

ALTER TABLE toutiao ADD COLUMN share_count INT default 0;
ALTER TABLE commodity ADD COLUMN share_count INT default 0;
ALTER TABLE fuwu ADD COLUMN share_count INT default 0;
ALTER TABLE faxian ADD COLUMN share_count INT default 0;
ALTER TABLE quchu ADD COLUMN share_count INT default 0;

#推荐列表中新增推荐人字段
ALTER TABLE tuijian_list ADD COLUMN tuijian_user varchar(32);

#设置所有信息内容数据库类型为longtext
ALTER TABLE toutiao modify COLUMN content longtext;
ALTER TABLE commodity modify COLUMN content longtext;
ALTER TABLE fuwu modify COLUMN content longtext;
ALTER TABLE faxian modify COLUMN content longtext;
ALTER TABLE quchu modify COLUMN content longtext;
#为所有信息新增字段发布日期
ALTER TABLE toutiao ADD COLUMN publish_date VARCHAR(32);
ALTER TABLE faxian ADD COLUMN publish_date VARCHAR(32);
ALTER TABLE fuwu ADD COLUMN publish_date VARCHAR(32);
ALTER TABLE commodity ADD COLUMN publish_date VARCHAR(32);
ALTER TABLE quchu ADD COLUMN publish_date VARCHAR(32);

#新增用户分类字段
ALTER TABLE admin_xinxi ADD COLUMN classify int(11) default 0; #1:个人已加v，2:第三方注册，3:手机注册
ALTER TABLE admin_xinxi ADD COLUMN fensi int(11) default 0;#粉丝数量
ALTER TABLE admin_xinxi ADD COLUMN guanzhu int(11) default 0;#关注数量
ALTER TABLE admin_xinxi ADD COLUMN shuoshuo int(11) default 0;#说说数量