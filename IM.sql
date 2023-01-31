/*

 Source Database       : webim

 */
SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
-- Table structure for bevy  群组表，可以加上群公告字段
-- ----------------------------
DROP TABLE IF EXISTS `bevy`;
CREATE TABLE `bevy` (
  `id` varchar(255) NOT NULL COMMENT '群的topic',
  `groupname` varchar(255) DEFAULT NULL COMMENT '群名称',
  `belong` varchar(255) DEFAULT NULL COMMENT '群主',
  `avatar` varchar(255) DEFAULT NULL COMMENT '群头像',
  `des` varchar(255) DEFAULT NULL COMMENT '群简介描述',
  `status` varchar(255) DEFAULT NULL COMMENT '群状态 是否禁言',
  `number` int(11) DEFAULT NULL COMMENT '群人数上线',
  `timestamp` bigint(255) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- ----------------------------
-- Table structure for bevymember 群成员
-- ----------------------------
DROP TABLE IF EXISTS `bevymember`;
CREATE TABLE `bevymember` (
  `id` varchar(255) NOT NULL,
  `bevyId` varchar(255) DEFAULT NULL COMMENT '群id',
  `useId` varchar(255) DEFAULT NULL COMMENT '群成员id',
  `remark` varchar(255) DEFAULT NULL COMMENT '成员备注，添加好友时默认备注为好友最新名字',
  `timestamp` bigint(255) DEFAULT NULL COMMENT '进群时间',
  `status` int(255) DEFAULT NULL COMMENT '1：正常，0：禁言',
  `type` int(11) DEFAULT NULL COMMENT '1 群主  2 管理员 0 普通',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- ----------------------------
-- Table structure for chat 聊天记录，好友聊天记录和群聊天记录表没有分开
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` varchar(255) NOT NULL,
  `fromId` varchar(255) DEFAULT NULL,
  `toId` varchar(255) DEFAULT NULL,
  `content` text COMMENT '根据消息类型存储不同格式，图片和文件可以存连接地址，文字消息可以直接存，等等',
  `groupId` varchar(255) DEFAULT NULL,
  `timestamp` bigint(255) DEFAULT NULL,
  `msgType` varchar(255) DEFAULT NULL COMMENT '消息类型：文字、图片、文件、语音、定位等',
  `status` int(11) DEFAULT NULL COMMENT '消息状态：已读，未读，发成成功等，用于上线收到未读消息',
  `extend` PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `id` varchar(255) NOT NULL,
  `groupId` varchar(255) DEFAULT NULL COMMENT '分组id',
  `userId` varchar(255) DEFAULT NULL COMMENT '用户id',
  `remark` varchar(255) DEFAULT NULL COMMENT '好友备注',
  `timestamp` bigint(255) DEFAULT NULL,
  `belong` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- ----------------------------
-- Table structure for group  好友分组列表
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` varchar(255) NOT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `ownerId` varchar(255) DEFAULT NULL,
  `createUser` varchar(255) DEFAULT NULL,
  `createTime` varchar(255) DEFAULT NULL,
  `announcement` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- ----------------------------
-- MQ安全验证需要的表，mqtt这个表可以不用,只是用来验证mqtt服务器连接的
-- ----------------------------
DROP TABLE IF EXISTS `mqttacl`;
CREATE TABLE `mqttacl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `allow` int(1) DEFAULT NULL COMMENT '0: deny, 1: allow',
  `ipaddr` varchar(60) DEFAULT NULL COMMENT 'IpAddress',
  `username` varchar(100) DEFAULT NULL COMMENT 'Username',
  `clientId` varchar(100) DEFAULT NULL COMMENT 'ClientId',
  `access` int(2) NOT NULL COMMENT '1: subscribe, 2: publish, 3: pubsub',
  `topic` varchar(100) NOT NULL DEFAULT '' COMMENT 'Topic Filter',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8;
-- ----------------------------
-- Table structure for notify  添加好友或群通知，也可以删除好友或者退群通知
-- ----------------------------
DROP TABLE IF EXISTS `notify`;
CREATE TABLE `notify` (
  `id` varchar(255) NOT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1为请求添加用户2为系统消息（添加好友）3为请求加群 4为系统消息（添加群） 5 全体会员消息''',
  `from` varchar(255) DEFAULT NULL COMMENT '''消息发送者 0表示为系统消息''',
  `to` varchar(255) DEFAULT NULL COMMENT '''消息接收者 0表示全体会员'',',
  `status` int(11) DEFAULT NULL COMMENT '''1未处理 2同意 3拒绝 4同意且返回消息已读 5拒绝且返回消息已读 6全部消息已读'',',
  `remark` varchar(255) DEFAULT NULL COMMENT '''附加消息'',',
  `timestamp` varchar(255) DEFAULT NULL COMMENT '''发送消息时间'',',
  `handlerId` varchar(255) DEFAULT NULL COMMENT '处理该请求的管理员id',
  `groupId` varchar(255) DEFAULT NULL COMMENT '好友添加：好友分组id，群添加：群id',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- ----------------------------
-- Table structure for user，最好加上ip，用户表和账户表没有分开，用户的账号密码默认也是MQ的账号密码
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL COMMENT '手机就是账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `username` varchar(255) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `sign` varchar(255) DEFAULT NULL COMMENT '签名',
  `status` varchar(255) DEFAULT NULL,
  `gender` int(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `wechat` varchar(255) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `is_superuser` varchar(255) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `quittime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;