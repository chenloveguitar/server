/*
Navicat MySQL Data Transfer

Source Server         : 泸州app
Source Server Version : 50554
Source Host           : 122.152.216.95:3306
Source Database       : sjlz

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-11-22 14:37:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(255) NOT NULL,
  `admin_user` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin_leixing` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `picture` longtext,
  `admin_Tag` int(11) DEFAULT '0',
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin123456', '1', '超级管理员', '13000000000', 'http://122.152.216.95:8080/mServer/FileDownLoadServlet?absolutePath=zwtp.png', '0', '2017-11-20 15:06:46');

-- ----------------------------
-- Table structure for admin_xinxi
-- ----------------------------
DROP TABLE IF EXISTS `admin_xinxi`;
CREATE TABLE `admin_xinxi` (
  `id` varchar(50) NOT NULL,
  `touxiang_picture` longtext,
  `name` varchar(50) DEFAULT NULL,
  `weichat` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `qianming` varchar(255) DEFAULT NULL,
  `shouhuo_address` varchar(100) DEFAULT NULL,
  `shouhuo_name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `qianbao` double DEFAULT '1',
  `yonghu_Tag` tinyint(4) DEFAULT NULL,
  `classify` int(11) DEFAULT '0',
  `fensi` int(11) DEFAULT '0',
  `guanzhu` int(11) DEFAULT '0',
  `shuoshuo` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for advertisement
-- ----------------------------
DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement` (
  `id` varchar(255) NOT NULL,
  `picture` longtext,
  `guanggao_id` varchar(255) DEFAULT NULL COMMENT '广告id 对应信息id包括(头条[toutiao],发现[faxian],商品[commodity],去处[quchu],服务[fuwu]) 的id',
  `fenlei_Tag` tinyint(4) DEFAULT NULL COMMENT '广告分类 1头条 2发现 3去处 4逛街',
  `guangjie_fenlei_Tag` tinyint(4) DEFAULT NULL COMMENT '当广告分类为4时 逛街分类 1为商品commodity 2为服务 fuwu',
  `muban_Tag` tinyint(4) DEFAULT '4',
  `time` timestamp NULL DEFAULT NULL,
  `shangjia_Tag` tinyint(4) DEFAULT NULL COMMENT '上架状态 1已上架 2已下架',
  `url` varchar(255) DEFAULT NULL,
  `dianji_count` int(11) DEFAULT '0',
  `guanggao_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Apk
-- ----------------------------
DROP TABLE IF EXISTS `Apk`;
CREATE TABLE `Apk` (
  `id` varchar(255) NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `download_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for buy_sell
-- ----------------------------
DROP TABLE IF EXISTS `buy_sell`;
CREATE TABLE `buy_sell` (
  `id` varchar(255) NOT NULL,
  `seller_id` varchar(255) DEFAULT NULL,
  `duixiang_id` varchar(255) DEFAULT NULL,
  `guangjie_fenlei_Tag` tinyint(4) DEFAULT NULL,
  `buyer_id` varchar(255) DEFAULT 'null',
  `buyer_zhuangtai_Tag` tinyint(4) DEFAULT '1',
  `seller_zhuangtai_Tag` tinyint(4) DEFAULT '1',
  `transaction_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` double(255,2) DEFAULT '0.00',
  `unit` varchar(255) DEFAULT NULL,
  `shuliang` tinyint(255) DEFAULT NULL,
  `freight` double(255,0) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `picture` longtext,
  `content` longtext,
  `seller_id` varchar(255) DEFAULT NULL,
  `buyer_id` varchar(255) DEFAULT 'null',
  `releaser_id` varchar(255) DEFAULT NULL,
  `seller_name` varchar(255) DEFAULT NULL,
  `buyer_name` varchar(255) DEFAULT 'null',
  `releaser_name` varchar(255) DEFAULT NULL,
  `shenhe` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `dingdan_number` varchar(255) DEFAULT NULL,
  `guangjie_fenlei_Tag` int(11) DEFAULT '1',
  `yuedu` int(11) DEFAULT '0',
  `dianpu_id` varchar(255) DEFAULT NULL,
  `biaoqian` varchar(255) DEFAULT NULL,
  `shoucang_Tag` int(11) DEFAULT NULL,
  `guanggao_url` varchar(255) DEFAULT NULL,
  `muban_Tag` varchar(32) DEFAULT NULL,
  `described` text,
  `share_count` int(11) DEFAULT '0',
  `publish_date` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for core_file_upload
-- ----------------------------
DROP TABLE IF EXISTS `core_file_upload`;
CREATE TABLE `core_file_upload` (
  `id` int(11) NOT NULL,
  `bid` varchar(12) DEFAULT NULL,
  `filename` varchar(128) DEFAULT NULL,
  `item_id` varchar(32) DEFAULT NULL,
  `file_ext` varchar(12) DEFAULT NULL,
  `upload_time` varchar(255) DEFAULT NULL,
  `upload_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dashang
-- ----------------------------
DROP TABLE IF EXISTS `dashang`;
CREATE TABLE `dashang` (
  `id` varchar(255) NOT NULL,
  `tiaomu_id` varchar(255) DEFAULT NULL,
  `my_id` varchar(255) DEFAULT NULL,
  `friend_id` varchar(255) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `fenlei_Tag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dianpu
-- ----------------------------
DROP TABLE IF EXISTS `dianpu`;
CREATE TABLE `dianpu` (
  `id` varchar(255) NOT NULL,
  `touxiang` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `renzheng_Tag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dianzan_list
-- ----------------------------
DROP TABLE IF EXISTS `dianzan_list`;
CREATE TABLE `dianzan_list` (
  `id` varchar(255) NOT NULL,
  `tiaomu_id` varchar(255) DEFAULT NULL,
  `yonghu_id` varchar(255) DEFAULT NULL,
  `dianzan_Tag` tinyint(4) DEFAULT NULL,
  `dianzan_touxiang` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dianzan_push
-- ----------------------------
DROP TABLE IF EXISTS `dianzan_push`;
CREATE TABLE `dianzan_push` (
  `id` varchar(255) NOT NULL,
  `yonghu_id` varchar(255) DEFAULT NULL,
  `tiaomu_id` varchar(255) DEFAULT NULL,
  `dianzan_Tag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dingdan
-- ----------------------------
DROP TABLE IF EXISTS `dingdan`;
CREATE TABLE `dingdan` (
  `id` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `price` double DEFAULT '0',
  `time` timestamp NULL DEFAULT NULL,
  `tiaomu_id` varchar(255) DEFAULT NULL,
  `shuliang` tinyint(4) DEFAULT '0',
  `total_price` double DEFAULT '0',
  `freight` tinyint(4) DEFAULT '0',
  `seller_id` varchar(255) DEFAULT NULL,
  `buyer_id` varchar(255) DEFAULT NULL,
  `buyer_name` varchar(255) DEFAULT NULL,
  `buyer_phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `beizhu` varchar(255) DEFAULT NULL,
  `buyer_zhuangtai` tinyint(4) DEFAULT NULL,
  `seller_zhuangtai` tinyint(4) DEFAULT NULL,
  `guangjie_fenlei_Tag` tinyint(4) DEFAULT '0',
  `tuikuan_message` longtext,
  `see_time` timestamp NULL DEFAULT NULL,
  `now_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pay_time` timestamp NULL DEFAULT NULL ,
  `pay_end_time` timestamp NULL DEFAULT NULL ,
  `jiedan_time` timestamp NULL DEFAULT NULL,
  `jiedan_end_time` timestamp NULL DEFAULT NULL,
  `fahuo_time` timestamp NULL DEFAULT NULL,
  `fahuo_end_time` timestamp NULL DEFAULT NULL,
  `express_time` timestamp NULL DEFAULT NULL,
  `express_end_time` timestamp NULL DEFAULT NULL,
  `pingjia_time` timestamp NULL DEFAULT NULL,
  `pingjia_end_time` timestamp NULL DEFAULT NULL,
  `complain_time` timestamp NULL DEFAULT NULL,
  `complain_end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fangke
-- ----------------------------
DROP TABLE IF EXISTS `fangke`;
CREATE TABLE `fangke` (
  `id` varchar(255) NOT NULL,
  `my_id` varchar(255) DEFAULT NULL,
  `fangke_id` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for faxian
-- ----------------------------
DROP TABLE IF EXISTS `faxian`;
CREATE TABLE `faxian` (
  `id` varchar(255) NOT NULL,
  `picture` longtext,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` longtext,
  `fufei_Tag` tinyint(4) DEFAULT NULL,
  `fenlei_Tag` tinyint(4) DEFAULT '1',
  `dianzan_count` tinyint(4) DEFAULT NULL,
  `pinglun_count` tinyint(4) DEFAULT NULL,
  `releaser_id` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `yuedu_count` int(11) DEFAULT '0',
  `dashang_count` tinyint(4) DEFAULT NULL,
  `shoucang_Tag` tinyint(4) DEFAULT NULL,
  `shenhe` varchar(255) DEFAULT NULL,
  `biaoqian` varchar(255) DEFAULT NULL,
  `muban_Tag` varchar(32) DEFAULT NULL,
  `described` text,
  `share_count` int(11) DEFAULT '0',
  `publish_date` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for faxian_tuijian
-- ----------------------------
DROP TABLE IF EXISTS `faxian_tuijian`;
CREATE TABLE `faxian_tuijian` (
  `id` varchar(255) NOT NULL,
  `tuijian_id` varchar(255) DEFAULT NULL,
  `tuijian_Tag` tinyint(4) DEFAULT NULL,
  `fufei_Tag` tinyint(4) DEFAULT NULL,
  `guangjie_fenlei_Tag` tinyint(4) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for file_management
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=606 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fuwu
-- ----------------------------
  DROP TABLE IF EXISTS `fuwu`;
  CREATE TABLE `fuwu` (
    `id` varchar(255) NOT NULL,
    `title` varchar(255) DEFAULT NULL,
    `price` double DEFAULT '0',
    `unit` varchar(255) DEFAULT NULL,
    `phone` varchar(255) DEFAULT NULL,
    `picture` longtext,
    `content` longtext,
    `shenhe` varchar(255) DEFAULT NULL,
    `releaser_id` varchar(255) DEFAULT NULL,
    `time` timestamp NULL DEFAULT NULL,
    `guangjie_fenlei_Tag` int(11) DEFAULT '2',
    `yuedu` int(11) DEFAULT '0',
    `dianpu_id` varchar(255) DEFAULT NULL,
    `biaoqian` varchar(255) DEFAULT NULL,
    `shoucang_Tag` tinyint(4) DEFAULT NULL,
    `guanggao_url` varchar(255) DEFAULT NULL,
    `muban_Tag` varchar(32) DEFAULT NULL,
    `described` text,
    `share_count` int(11) DEFAULT '0',
    `publish_date` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
    PRIMARY KEY (`id`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for guanzhu
-- ----------------------------
DROP TABLE IF EXISTS `guanzhu`;
CREATE TABLE `guanzhu` (
  `id` varchar(255) NOT NULL,
  `my_id` varchar(255) DEFAULT NULL,
  `friend_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for heimingdan
-- ----------------------------
DROP TABLE IF EXISTS `heimingdan`;
CREATE TABLE `heimingdan` (
  `id` varchar(255) NOT NULL,
  `my_id` varchar(255) DEFAULT NULL,
  `yonghu_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hongbao
-- ----------------------------
DROP TABLE IF EXISTS `hongbao`;
CREATE TABLE `hongbao` (
  `id` varchar(255) NOT NULL,
  `tiaomu_id` varchar(255) DEFAULT NULL,
  `hongbao_count` double(4,0) DEFAULT NULL,
  `hongbao_price` double DEFAULT NULL,
  `hongbao_Tag` tinyint(4) DEFAULT NULL,
  `my_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hongbao_list
-- ----------------------------
DROP TABLE IF EXISTS `hongbao_list`;
CREATE TABLE `hongbao_list` (
  `id` varchar(255) NOT NULL,
  `lingquer_id` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `hongbao_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for huifu
-- ----------------------------
DROP TABLE IF EXISTS `huifu`;
CREATE TABLE `huifu` (
  `id` varchar(255) NOT NULL,
  `pinglun_id` varchar(255) DEFAULT NULL,
  `huifuer_id` varchar(255) DEFAULT NULL,
  `huifu_content` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jubao
-- ----------------------------
DROP TABLE IF EXISTS `jubao`;
CREATE TABLE `jubao` (
  `id` varchar(255) NOT NULL,
  `reporter_id` varchar(255) DEFAULT NULL,
  `tiaomu_id` varchar(255) DEFAULT NULL,
  `fenlei_Tag` tinyint(4) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `see_time` timestamp NULL DEFAULT NULL,
  `now_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` varchar(255) NOT NULL,
  `my_id` varchar(255) DEFAULT NULL,
  `releaser_id` varchar(255) DEFAULT NULL,
  `tiaomu_id` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_list
-- ----------------------------
DROP TABLE IF EXISTS `pay_list`;
CREATE TABLE `pay_list` (
  `id` varchar(255) NOT NULL,
  `yonghu_id` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `pay_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` varchar(255) NOT NULL,
  `picture` longtext,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pinglun
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `id` varchar(255) NOT NULL,
  `tiaomu_id` varchar(255) DEFAULT NULL,
  `pingluner_id` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `dianzan_count` tinyint(4) DEFAULT '0',
  `see_time` timestamp NULL DEFAULT NULL,
  `now_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qianbao_list
-- ----------------------------
DROP TABLE IF EXISTS `qianbao_list`;
CREATE TABLE `qianbao_list` (
  `id` varchar(255) NOT NULL,
  `my_id` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `buy_name` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for quchu
-- ----------------------------
DROP TABLE IF EXISTS `quchu`;
CREATE TABLE `quchu` (
  `id` varchar(255) NOT NULL,
  `picture` longtext,
  `title` varchar(255) DEFAULT NULL,
  `dashang_count` tinyint(4) DEFAULT NULL,
  `dianpu_touxiang` longtext,
  `dianpu_name` varchar(255) DEFAULT NULL,
  `dianpu_address` varchar(255) DEFAULT NULL,
  `renzheng_Tag` tinyint(4) DEFAULT NULL,
  `content` longtext,
  `shoucang_Tag` tinyint(4) DEFAULT NULL,
  `biaoqian` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `shenhe` varchar(255) DEFAULT NULL,
  `fenlei_Tag` tinyint(4) DEFAULT '2',
  `time` timestamp NULL DEFAULT NULL,
  `dianzhan_count` tinyint(4) DEFAULT NULL,
  `guanggao_url` varchar(255) DEFAULT NULL,
  `releaser_id` varchar(255) DEFAULT NULL,
  `yuedu` int(11) DEFAULT '0',
  `muban_Tag` varchar(32) DEFAULT NULL,
  `described` text,
  `share_count` int(11) DEFAULT '0',
  `publish_date` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for renzheng
-- ----------------------------
DROP TABLE IF EXISTS `renzheng`;
CREATE TABLE `renzheng` (
  `id` varchar(255) NOT NULL,
  `my_id` varchar(255) DEFAULT NULL,
  `picture` longtext,
  `name` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `renzheng_Tag` varchar(255) DEFAULT NULL,
  `leixing_Tag` varchar(255) DEFAULT NULL,
  `see_time` timestamp NULL DEFAULT NULL,
  `now_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shoucang
-- ----------------------------
DROP TABLE IF EXISTS `shoucang`;
CREATE TABLE `shoucang` (
  `id` varchar(255) NOT NULL,
  `my_id` varchar(255) DEFAULT NULL,
  `quchu_id` varchar(255) DEFAULT NULL,
  `commodity_id` varchar(255) DEFAULT NULL,
  `toutiao_id` varchar(255) DEFAULT NULL,
  `faxian_id` varchar(255) DEFAULT NULL,
  `guangjie_fenlei_Tag` tinyint(4) DEFAULT NULL,
  `picture` longtext,
  `title` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `muban_Tag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shuoshuo
-- ----------------------------
DROP TABLE IF EXISTS `shuoshuo`;
CREATE TABLE `shuoshuo` (
  `id` varchar(255) NOT NULL,
  `releaser_id` varchar(255) DEFAULT NULL,
  `picture` longtext,
  `content` longtext,
  `guanzhu_Tag` tinyint(4) DEFAULT NULL,
  `muban_Tag` tinyint(4) DEFAULT NULL,
  `dianzan_count` tinyint(4) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `see_time` timestamp NULL DEFAULT NULL,
  `now_time` timestamp NULL DEFAULT NULL,
  `yuedu` int(11) DEFAULT '0',
  `share_count` int(11) DEFAULT '0',
  `tuijian_Tag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sousuo
-- ----------------------------
DROP TABLE IF EXISTS `sousuo`;
CREATE TABLE `sousuo` (
  `id` varchar(255) NOT NULL,
  `str` varchar(255) DEFAULT NULL,
  `count` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tixian_list
-- ----------------------------
DROP TABLE IF EXISTS `tixian_list`;
CREATE TABLE `tixian_list` (
  `id` varchar(255) NOT NULL,
  `weichat_name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `my_id` varchar(255) DEFAULT NULL,
  `zhuangtai` varchar(255) DEFAULT '未处理',
  `see_time` timestamp NULL DEFAULT NULL,
  `now_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for toutiao
-- ----------------------------
DROP TABLE IF EXISTS `toutiao`;
CREATE TABLE `toutiao` (
  `id` varchar(255) NOT NULL,
  `picture` longtext,
  `title` varchar(255) DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `content` longtext,
  `fufei_Tag` tinyint(4) DEFAULT NULL,
  `fenlei_Tag` tinyint(4) DEFAULT NULL,
  `muban_Tag` tinyint(4) DEFAULT NULL,
  `laiyuan` varchar(255) DEFAULT NULL,
  `dianzan_count` tinyint(4) DEFAULT NULL,
  `pinglun_count` tinyint(4) DEFAULT NULL,
  `releaser_id` varchar(255) DEFAULT NULL,
  `releaser_name` varchar(255) DEFAULT NULL,
  `releaser_touxiang` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `yuedu_count` int(11) DEFAULT '0',
  `dashang_count` tinyint(4) DEFAULT NULL,
  `shoucang_Tag` tinyint(4) DEFAULT NULL,
  `shenhe` varchar(255) DEFAULT NULL,
  `biaoqian` varchar(255) DEFAULT NULL,
  `described` text,
  `share_count` int(11) DEFAULT '0',
  `publish_date` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tuijian_list
-- ----------------------------
DROP TABLE IF EXISTS `tuijian_list`;
CREATE TABLE `tuijian_list` (
  `id` varchar(255) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `now_time` timestamp NULL DEFAULT NULL,
  `tiaomu_id` varchar(255) DEFAULT NULL,
  `tuijian_user` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tuijian_user
-- ----------------------------
DROP TABLE IF EXISTS `tuijian_user`;
CREATE TABLE `tuijian_user` (
  `id` varchar(255) NOT NULL,
  `tuijian_user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tuikuan
-- ----------------------------
DROP TABLE IF EXISTS `tuikuan`;
CREATE TABLE `tuikuan` (
  `id` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `content` longtext,
  `releaser_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for update
-- ----------------------------
DROP TABLE IF EXISTS `update`;
CREATE TABLE `update` (
  `id` varchar(255) NOT NULL,
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `url` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zuji
-- ----------------------------
DROP TABLE IF EXISTS `zuji`;
CREATE TABLE `zuji` (
  `id` varchar(255) NOT NULL,
  `my_id` varchar(255) DEFAULT NULL,
  `commodity_id` varchar(255) DEFAULT NULL,
  `quchu_id` varchar(255) DEFAULT NULL,
  `faxian_id` varchar(255) DEFAULT NULL,
  `toutiao_id` varchar(255) DEFAULT NULL,
  `fuwu_id` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `guangjie_fenlei_Tag` varchar(255) DEFAULT NULL,
  `picture` longtext,
  `title` varchar(255) DEFAULT NULL,
  `muban_Tag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



