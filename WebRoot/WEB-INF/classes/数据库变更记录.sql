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
#content

#为所有信息新增字段发布日期
ALTER TABLE toutiao ADD COLUMN publish_date VARCHAR(32);
ALTER TABLE faxian ADD COLUMN publish_date VARCHAR(32);
ALTER TABLE fuwu ADD COLUMN publish_date VARCHAR(32);
ALTER TABLE commodity ADD COLUMN publish_date VARCHAR(32);
ALTER TABLE quchu ADD COLUMN publish_date VARCHAR(32);