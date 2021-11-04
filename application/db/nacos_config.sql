/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : nacos_config

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 30/10/2021 19:51:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (8, 'sca-common.yml', 'common', 'service:\n  group:\n    name: sca-parent\n  book:\n    port: 8010\n  portal:\n    port: 8020\n  order:\n    port: 8030\n  gateway:\n    port: 8000\n\nswagger:\n  service:\n  - value: sca-service-book\n    name: 书籍管理\n  - value: sca-service-order\n    name: 订单管理\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  ', 'aa42fefdddb0d1b9d0abc1ac379296b9', '2021-10-27 11:45:44', '2021-10-30 06:11:52', 'nacos', '0:0:0:0:0:0:0:1', '公用', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (17, 'sca-service-portal.yml', 'dev', 'name: maple', 'be5254c18cded2e369e3d6cf7d39d4c5', '2021-10-27 12:08:29', '2021-10-27 12:27:16', 'nacos', '0:0:0:0:0:0:0:1', 'sca-business-portal', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (22, 'sca-service-book.yml', 'dev', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/sca-book\n    username: root\n    password: 123456\n\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true\npagehelper:\n  helper-dialect: mysql\n  pageSizeZero: true\n  params: count=countSql\n  reasonable: true\n  support-methods-arguments: true', 'be69d6ba2047d48e29d8011e3a1c0375', '2021-10-27 12:27:50', '2021-10-27 15:31:40', 'nacos', '0:0:0:0:0:0:0:1', 'sca-business-book', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (28, 'sca-service-order.yml', 'dev', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/sca-order\n    username: root\n    password: 123456\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true\n\npagehelper:\n  helper-dialect: mysql\n  pageSizeZero: true\n  params: count=countSql\n  reasonable: true\n  support-methods-arguments: true', 'fee7505b7f349ae926320ecf037eddc9', '2021-10-27 13:52:30', '2021-10-27 15:34:33', 'nacos', '0:0:0:0:0:0:0:1', 'sca-business-order', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (37, 'sca-gateway.yml', 'dev', 'name: maple', 'be5254c18cded2e369e3d6cf7d39d4c5', '2021-10-28 15:01:00', '2021-10-30 02:45:02', 'nacos', '0:0:0:0:0:0:0:1', 'sca-gateway', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (48, 'sca-gateway.json', 'dev', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            \"Path=/sca-service-book/**\"\n        ],\n        \"filters\": [\n            \"StripPrefix=1\"\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    },\n    {\n        \"id\": \"sca-service-order\",\n        \"predicates\": [\n            \"Path=/sca-service-order/**\"\n        ],\n        \"filters\": [\n            \"StripPrefix=1\"\n        ],\n        \"uri\": \"lb://sca-service-order\"\n    }\n]', '22231265f86fb0aaaa349cc6d5c8605d', '2021-10-30 02:44:31', '2021-10-30 06:12:40', 'nacos', '0:0:0:0:0:0:0:1', 'sca-gateway', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', '', '', '', 'json', '');
INSERT INTO `config_info` VALUES (93, 'service.vgroupMapping.sca-service-book', 'DEFAULT_GROUP', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2021-10-30 11:35:11', '2021-10-30 11:35:11', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (94, 'service.vgroupMapping.sca-service-order', 'DEFAULT_GROUP', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2021-10-30 11:35:12', '2021-10-30 11:35:12', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (95, 'store.mode', 'DEFAULT_GROUP', 'db', 'd77d5e503ad1439f585ac494268b351b', '2021-10-30 11:35:13', '2021-10-30 11:35:13', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (96, 'store.db.datasource', 'DEFAULT_GROUP', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2021-10-30 11:35:13', '2021-10-30 11:35:13', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (97, 'store.db.dbType', 'DEFAULT_GROUP', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2021-10-30 11:35:14', '2021-10-30 11:35:14', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (98, 'store.db.driverClassName', 'DEFAULT_GROUP', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2021-10-30 11:35:15', '2021-10-30 11:35:15', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (99, 'store.db.url', 'DEFAULT_GROUP', 'jdbc:mysql://127.0.0.1:3306/seata?useUnicode=true&rewriteBatchedStatements=true', '030ea5ff5c2ef043adf9826c70570b0b', '2021-10-30 11:35:16', '2021-10-30 11:35:16', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (100, 'store.db.user', 'DEFAULT_GROUP', 'root', '63a9f0ea7bb98050796b649e85481845', '2021-10-30 11:35:17', '2021-10-30 11:35:17', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (101, 'store.db.password', 'DEFAULT_GROUP', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2021-10-30 11:35:18', '2021-10-30 11:35:18', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (102, 'store.db.minConn', 'DEFAULT_GROUP', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2021-10-30 11:35:19', '2021-10-30 11:35:19', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (103, 'store.db.maxConn', 'DEFAULT_GROUP', '30', '34173cb38f07f89ddbebc2ac9128303f', '2021-10-30 11:35:20', '2021-10-30 11:35:20', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (104, 'store.db.globalTable', 'DEFAULT_GROUP', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2021-10-30 11:35:21', '2021-10-30 11:35:21', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (105, 'store.db.branchTable', 'DEFAULT_GROUP', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2021-10-30 11:35:21', '2021-10-30 11:35:21', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (106, 'store.db.queryLimit', 'DEFAULT_GROUP', '100', 'f899139df5e1059396431415e770c6dd', '2021-10-30 11:35:22', '2021-10-30 11:35:22', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (107, 'store.db.lockTable', 'DEFAULT_GROUP', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2021-10-30 11:35:23', '2021-10-30 11:35:23', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (108, 'store.db.maxWait', 'DEFAULT_GROUP', '5000', 'a35fe7f7fe8217b4369a0af4244d1fca', '2021-10-30 11:35:24', '2021-10-30 11:35:24', 'nacos', '127.0.0.1', '', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', NULL, NULL, NULL, 'text', NULL);

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint UNSIGNED NOT NULL,
  `nid` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'sca-common.yml', 'DEFAULT_GROUP', 'common', 'dubbo.packages=com', 'acb8a4875fc13020b461429fc9c05566', '2021-10-27 19:03:48', '2021-10-27 11:03:48', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (1, 2, 'sca-common.yml', 'DEFAULT_GROUP', 'common', 'dubbo.packages=com', 'acb8a4875fc13020b461429fc9c05566', '2021-10-27 19:04:16', '2021-10-27 11:04:17', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 3, 'sca-common.yml', 'DEV', '', 'name=maple', '49b0cefa0930c9bbefa9d5e890f405b1', '2021-10-27 19:16:42', '2021-10-27 11:16:43', NULL, '0:0:0:0:0:0:0:1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (2, 4, 'sca-common.yml', 'DEV', '', 'name=maple', '49b0cefa0930c9bbefa9d5e890f405b1', '2021-10-27 19:16:59', '2021-10-27 11:17:00', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (2, 5, 'sca-common.yml', 'DEV', '公用', 'name=maple', '49b0cefa0930c9bbefa9d5e890f405b1', '2021-10-27 19:20:10', '2021-10-27 11:20:11', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 6, 'sca-common.yml', 'dev', '公用', 'name: maple', 'be5254c18cded2e369e3d6cf7d39d4c5', '2021-10-27 19:21:05', '2021-10-27 11:21:06', NULL, '0:0:0:0:0:0:0:1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (4, 7, 'sca-common.yml', 'dev', '公用', 'name: maple', 'be5254c18cded2e369e3d6cf7d39d4c5', '2021-10-27 19:24:42', '2021-10-27 11:24:43', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (4, 8, 'sca-common.yml', 'dev', '公用', 'name: maple\nspring:\n    profiles:\n        active: dev', 'b57f8383fd9b44f9360979125b7fb38b', '2021-10-27 19:25:01', '2021-10-27 11:25:01', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (4, 9, 'sca-common.yml', 'dev', '公用', 'name: maple\nspring:\n  profiles:\n    active: dev\n', '8e32bc8b7fc4428c5c56b2419eb9a1e0', '2021-10-27 19:43:40', '2021-10-27 11:43:40', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 10, 'sca-cmmmon.yml', 'COMMON', '', 'name: maple\r\nspring:\r\n  profiles:\r\n    active: dev', 'ef78f074fb8d040c846a4b7612ea4b4e', '2021-10-27 19:43:58', '2021-10-27 11:43:59', NULL, '0:0:0:0:0:0:0:1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (7, 11, 'sca-cmmmon.yml', 'COMMON', '', 'name: maple\r\nspring:\r\n  profiles:\r\n    active: dev', 'ef78f074fb8d040c846a4b7612ea4b4e', '2021-10-27 19:45:13', '2021-10-27 11:45:14', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 12, 'sca-common.yml', 'common', '公用', 'name: maple\r\nspring:\r\n  profiles:\r\n    active: dev', 'ef78f074fb8d040c846a4b7612ea4b4e', '2021-10-27 19:45:43', '2021-10-27 11:45:44', NULL, '0:0:0:0:0:0:0:1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 13, 'sca-common.yml', 'common', '公用', 'name: maple\r\nspring:\r\n  profiles:\r\n    active: dev', 'ef78f074fb8d040c846a4b7612ea4b4e', '2021-10-27 19:46:36', '2021-10-27 11:46:36', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 14, 'sca-common.yml', 'common', '公用', 'spring:\n  profiles:\n    active: test', 'b3a597f34f08ea70a32711ec14564e92', '2021-10-27 19:47:05', '2021-10-27 11:47:05', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 15, 'sca-common.yml', 'common', '公用', 'spring:\n  profiles:\n    active: test\nname: maple', 'f59ba728b65c6bce3ede2fdcb7dd0bb7', '2021-10-27 19:48:24', '2021-10-27 11:48:25', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 16, 'sca-common.yml', 'common', '公用', 'service:\n  book:\n    port: 8089', 'b30e07fe77e866da56bfb9cdfc251ee6', '2021-10-27 19:49:37', '2021-10-27 11:49:37', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 17, 'sca-common.yml', 'common', '公用', 'service:\n  book:\n    port: 8010', 'e71ec99f8ae48323751635130bdceb4d', '2021-10-27 19:49:47', '2021-10-27 11:49:47', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 18, 'sca-common.yml', 'common', '公用', 'service:\n  book:\n    port: 0', 'f5f6b0318697dc97646d056ecb6e9758', '2021-10-27 19:57:05', '2021-10-27 11:57:05', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 19, 'sca-portal', 'dev', 'sca-business-portal', 'name: maple', 'be5254c18cded2e369e3d6cf7d39d4c5', '2021-10-27 20:06:24', '2021-10-27 12:06:24', NULL, '0:0:0:0:0:0:0:1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (15, 20, 'sca-portal', 'dev', 'sca-business-portal', 'name: maple', 'be5254c18cded2e369e3d6cf7d39d4c5', '2021-10-27 20:07:00', '2021-10-27 12:07:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 21, 'sca-business-portal', 'dev', 'sca-business-portal', 'name: maple', 'be5254c18cded2e369e3d6cf7d39d4c5', '2021-10-27 20:07:19', '2021-10-27 12:07:20', NULL, '0:0:0:0:0:0:0:1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (16, 22, 'sca-business-portal', 'dev', 'sca-business-portal', 'name: maple', 'be5254c18cded2e369e3d6cf7d39d4c5', '2021-10-27 20:08:07', '2021-10-27 12:08:08', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 23, 'sca-business-portal.yml', 'dev', 'sca-business-portal', 'name: maple', 'be5254c18cded2e369e3d6cf7d39d4c5', '2021-10-27 20:08:29', '2021-10-27 12:08:29', NULL, '0:0:0:0:0:0:0:1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 24, 'sca-common.yml', 'common', '公用', 'service:\n  group:\n    name: sca-parent\n  book:\n    port: 0\n  ', 'a5bd8c98c10249056f54f1ad2206ac44', '2021-10-27 20:10:29', '2021-10-27 12:10:29', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 25, 'sca-common.yml', 'common', '公用', 'service:\n  group:\n    name: sca-parent\n  book:\n    port: 0\n  portal:\n    port: 0\n  ', '551bbca7582f610ad9c684c9f4b6902f', '2021-10-27 20:20:28', '2021-10-27 12:20:28', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (17, 26, 'sca-business-portal.yml', 'dev', 'sca-business-portal', 'name: maple', 'be5254c18cded2e369e3d6cf7d39d4c5', '2021-10-27 20:27:03', '2021-10-27 12:27:03', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (17, 27, 'sca-business-portal.yml', 'dev', 'sca-business-portal', 'spring:\n  datasource:\n    driver-class-name: com.mysql.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/sca-book\n    username: root\n    password: 123456\n  jpa:\n    hibernate:\n      ddl-auto: create', '622ef204f0afd5ae4387766eced6d589', '2021-10-27 20:27:15', '2021-10-27 12:27:16', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 28, 'sca-business-book.yml', 'dev', '', 'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/sca-book\r\n    username: root\r\n    password: 123456\r\n  jpa:\r\n    hibernate:\r\n      ddl-auto: create', 'cdff3f7a37318f086f1f269ba5bb3ca2', '2021-10-27 20:27:50', '2021-10-27 12:27:50', NULL, '0:0:0:0:0:0:0:1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (22, 29, 'sca-business-book.yml', 'dev', '', 'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/sca-book\r\n    username: root\r\n    password: 123456\r\n  jpa:\r\n    hibernate:\r\n      ddl-auto: create', 'cdff3f7a37318f086f1f269ba5bb3ca2', '2021-10-27 20:28:00', '2021-10-27 12:28:00', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (22, 30, 'sca-business-book.yml', 'dev', 'sca-business-book', 'spring:\n  datasource:\n    driver-class-name: com.mysql.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/sca-book\n    username: root\n    password: 123456\n  jpa:\n    hibernate:\n      ddl-auto: create', '622ef204f0afd5ae4387766eced6d589', '2021-10-27 20:28:38', '2021-10-27 12:28:38', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (22, 31, 'sca-business-book.yml', 'dev', 'sca-business-book', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/sca-book\n    username: root\n    password: 123456\n  jpa:\n    hibernate:\n      ddl-auto: create', '1e36cb345f2520bab8758738fe89b009', '2021-10-27 20:31:09', '2021-10-27 12:31:09', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 32, 'sca-common.yml', 'common', '公用', 'service:\n  group:\n    name: sca-parent\n  book:\n    port: 0\n  portal:\n    port: 0\n\n  ', '3c383f395d87efc7d093416965e63a65', '2021-10-27 21:16:59', '2021-10-27 13:17:00', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 33, 'sca-common.yml', 'common', '公用', 'service:\n  group:\n    name: sca-parent\n  book:\n    port: 8010\n  portal:\n    port: 0\n\n  ', '72731ebfd4bb8acc29e6792f12a8f009', '2021-10-27 21:51:58', '2021-10-27 13:51:58', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 34, 'sca-business-order.yml', 'dev', 'sca-business-order', 'name: ok', '3efd7e8b28f1e0f689202f97c5f1dcb7', '2021-10-27 21:52:30', '2021-10-27 13:52:30', NULL, '0:0:0:0:0:0:0:1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (28, 35, 'sca-business-order.yml', 'dev', 'sca-business-order', 'name: ok', '3efd7e8b28f1e0f689202f97c5f1dcb7', '2021-10-27 21:55:04', '2021-10-27 13:55:05', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (28, 36, 'sca-business-order.yml', 'dev', 'sca-business-order', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/sca-book\n    username: root\n    password: 123456\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true', '7ba656ec45b4b5ac2ec921bc0740759a', '2021-10-27 21:55:13', '2021-10-27 13:55:13', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (22, 37, 'sca-business-book.yml', 'dev', 'sca-business-book', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/sca-book\n    username: root\n    password: 123456\n  jpa:\n    hibernate:\n      ddl-auto: update', '6d39b7d945498957e151925370abd443', '2021-10-27 22:47:34', '2021-10-27 14:47:34', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (22, 38, 'sca-business-book.yml', 'dev', 'sca-business-book', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/sca-book\n    username: root\n    password: 123456', '4b7239cf424f8a1439da87afe61ba624', '2021-10-27 22:47:50', '2021-10-27 14:47:51', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (22, 39, 'sca-business-book.yml', 'dev', 'sca-business-book', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/sca-book\n    username: root\n    password: 123456\n\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true', 'eb623bf9cddf0a8819238dc9edd2ff53', '2021-10-27 23:31:39', '2021-10-27 15:31:40', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (28, 40, 'sca-business-order.yml', 'dev', 'sca-business-order', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/sca-order\n    username: root\n    password: 123456\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true', '0b6da2dc8c86bd0a1da7fdfa2a123e3f', '2021-10-27 23:34:33', '2021-10-27 15:34:33', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 41, 'sca-common.yml', 'common', '公用', 'service:\n  group:\n    name: sca-parent\n  book:\n    port: 8010\n  portal:\n    port: 8020\n  order:\n    port: 8030\n\n  ', '251a2cffe181aba3b15a11ce857ce751', '2021-10-28 22:03:27', '2021-10-28 14:03:27', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 42, 'sca-common.yml', 'common', '公用', 'service:\n  group:\n    name: sca-parent\n  book:\n    port: 8010\n  portal:\n    port: 8020\n  order:\n    port: 8030\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  ', 'c2eadb641a1daf38eaf1daf41b6ba416', '2021-10-28 22:40:12', '2021-10-28 14:40:12', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 43, 'sca-gateway.yml', 'dev', 'sca-gateway', 'name: maple', 'be5254c18cded2e369e3d6cf7d39d4c5', '2021-10-28 23:01:00', '2021-10-28 15:01:00', NULL, '0:0:0:0:0:0:0:1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 44, 'sca-common.yml', 'common', '公用', 'service:\n  group:\n    name: sca-parent\n  book:\n    port: 8010\n  portal:\n    port: 8020\n  order:\n    port: 8030\n  gateway:\n  port: 8000\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  ', '89172b522911ccfcd2dd3b7a92c70d1f', '2021-10-28 23:15:25', '2021-10-28 15:15:26', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (37, 45, 'sca-gateway.yml', 'dev', 'sca-gateway', 'name: maple', 'be5254c18cded2e369e3d6cf7d39d4c5', '2021-10-28 23:20:43', '2021-10-28 15:20:43', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (37, 46, 'sca-gateway.yml', 'dev', 'sca-gateway', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/sca-gateway\n    username: root\n    password: 123456\n\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    map-underscore-to-camel-case: true\npagehelper:\n  helper-dialect: mysql\n  pageSizeZero: true\n  params: count=countSql\n  reasonable: true\n  support-methods-arguments: true', '8aa281d09a07aabe35c5d6d36c10d900', '2021-10-28 23:31:51', '2021-10-28 15:31:51', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (37, 47, 'sca-gateway.yml', 'dev', 'sca-gateway', 'name: maple', 'be5254c18cded2e369e3d6cf7d39d4c5', '2021-10-30 09:15:26', '2021-10-30 01:15:27', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 48, 'sca-common.yml', 'common', '公用', 'service:\n  group:\n    name: sca-parent\n  book:\n    port: 8010\n  portal:\n    port: 8020\n  order:\n    port: 8030\n  gateway:\n    port: 8000\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  ', 'f1cc52aa13f10311120dfcb47e9b92cc', '2021-10-30 10:17:38', '2021-10-30 02:17:39', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (37, 49, 'sca-gateway.yml', 'dev', 'sca-gateway', 'swagger:\n  serivces: sca-business-book', 'a5ca17473542b74c6ba4390dde82f89f', '2021-10-30 10:18:55', '2021-10-30 02:18:55', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (37, 50, 'sca-gateway.yml', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-business-book\",\n        \"order\": 0,\n        \"predicates\": [\n            {\n                \"name\": \"sca-business-book\"\n            }\n        ],\n        \"uri\": \"lb://sca-business-book\"\n    }\n]', '9a7f08d8cf59ef9ba5edb358ca0919c2', '2021-10-30 10:23:26', '2021-10-30 02:23:26', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (37, 51, 'sca-gateway.yml', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-business-book\",\n        \"order\": 0,\n        \"predicates\": [\n            {\n                \"pattern\": \"sca-business-book\"\n            }\n        ],\n        \"uri\": \"lb://sca-business-book\"\n    }\n]', '3e7d88e6538d3b2d904651c42ba28ea3', '2021-10-30 10:24:29', '2021-10-30 02:24:29', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 52, 'sca-common.yml', 'common', '公用', 'service:\n  group:\n    name: sca-parent\n  book:\n    name: 书籍管理\n    value: sca-book\n    port: 8010\n  portal:\n    port: 8020\n  order:\n    port: 8030\n  gateway:\n    port: 8000\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  ', '636737cf9e1aefa7c0312ca6978e60b6', '2021-10-30 10:31:12', '2021-10-30 02:31:12', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (37, 53, 'sca-gateway.yml', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-business-book\",\n        \"order\": 0,\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-business-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"uri\": \"lb://sca-business-book\"\n    }\n]', '7f51490ec85fcba6ca8834429ba096c2', '2021-10-30 10:31:47', '2021-10-30 02:31:48', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 54, 'sca-gateway.json', 'dev', 'sca-gateway', '{}', '99914b932bd37a50b983c5e7c90ae93b', '2021-10-30 10:44:30', '2021-10-30 02:44:31', NULL, '0:0:0:0:0:0:0:1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (37, 55, 'sca-gateway.yml', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"order\": 0,\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', 'c15996887ab837e17793869499a7f03b', '2021-10-30 10:45:02', '2021-10-30 02:45:02', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 56, 'sca-gateway.json', 'dev', 'sca-gateway', '{}', '99914b932bd37a50b983c5e7c90ae93b', '2021-10-30 10:45:13', '2021-10-30 02:45:14', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 57, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', '781e0e46c86674049224a2369574cb2d', '2021-10-30 10:50:07', '2021-10-30 02:50:08', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 58, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"uri\": \"http://localhost:8010/sca-service-book\"\n    }\n]', '822361913cc368d196afbfc0ded9ed00', '2021-10-30 10:50:57', '2021-10-30 02:50:57', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 59, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"uri\": \"http://localhost:8010/\"\n    }\n]', '81b4314a90029334e353279ba098b55b', '2021-10-30 10:51:07', '2021-10-30 02:51:08', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 60, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"uri\": \"http://localhost:8010\"\n    }\n]', 'b86328a5fd8be18cd36970950d11d5c6', '2021-10-30 11:21:57', '2021-10-30 03:21:57', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 61, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"filters\": [\n            {\n                \"args\": {\n                    \"value\": \"1\"\n                },\n                \"name\": \"StripPrefix\"\n            }\n        ],\n        \"uri\": \"http://localhost:8010\"\n    }\n]', '00982173fd94e5905a4655cbca2f514c', '2021-10-30 11:30:08', '2021-10-30 03:30:09', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 62, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"filters\": [\n            {\n                \"args\": {\n                    \"pattern\": \"1\"\n                },\n                \"name\": \"StripPrefix\"\n            }\n        ],\n        \"uri\": \"http://localhost:8010\"\n    }\n]', '267860df15186988b13b5c20f91e14f1', '2021-10-30 11:37:02', '2021-10-30 03:37:02', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 63, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"filters\": [\n            {\n                \"args\": {\n                    \"pattern\": \"1\"\n                },\n                \"name\": \"StripPrefix\"\n            }\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', 'eeed38258b678b5477e12cde8381e36b', '2021-10-30 11:54:28', '2021-10-30 03:54:29', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 64, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', '781e0e46c86674049224a2369574cb2d', '2021-10-30 12:01:36', '2021-10-30 04:01:37', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 65, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"filters\": [\n            {\n                \"StripPrefix\": 1\n            }\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', 'da960c50632ef629b08b488c795a84ae', '2021-10-30 12:02:47', '2021-10-30 04:02:48', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 66, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"filters\": [\n            {\n                \"name\": \"StripPrefix\",\n                \"args\": {\n                    \"StripPrefix\": 1\n                }\n            }\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', '431c0219ffe58e322a352ecf530955b4', '2021-10-30 12:03:24', '2021-10-30 04:03:24', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 67, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"filters\": [\n            {\n                \"name\": \"StripPrefix\",\n                \"args\": {\n                    \"StripPrefix\": true\n                }\n            }\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', '4021245b096dca8a757b89cf14cf5b3a', '2021-10-30 12:07:46', '2021-10-30 04:07:47', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 68, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"filters\": [\n            {\n                \"name\": \"StripPrefix\",\n                \"args\": {\n                    \"StripPrefix\": 1\n                }\n            }\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', '431c0219ffe58e322a352ecf530955b4', '2021-10-30 12:11:24', '2021-10-30 04:11:24', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 69, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"filters\": [\n            {\n                \"name\": \"StripPrefix\",\n                \"args\": {\n                    \"StripPrefix\": true\n                }\n            }\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', '4021245b096dca8a757b89cf14cf5b3a', '2021-10-30 12:14:54', '2021-10-30 04:14:54', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 70, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"filters\": [\n            {\n                \"name\": \"StripPrefix\",\n                \"args\": {\n                    \"StripPrefix\": 1\n                }\n            }\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', '431c0219ffe58e322a352ecf530955b4', '2021-10-30 13:11:25', '2021-10-30 05:11:25', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 71, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            {\n                \"args\": {\n                    \"pattern\": \"/sca-service-book/**\"\n                },\n                \"name\": \"Path\"\n            }\n        ],\n        \"filters\": [\n            {\n                \"name\": \"StripPrefix\",\n                \"args\": {\n                    \"StripPrefix\": 1\n                }\n            }\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', '431c0219ffe58e322a352ecf530955b4', '2021-10-30 13:20:08', '2021-10-30 05:20:08', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 72, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            \"Path=/sca-service-book/**\"\n        ],\n        \"filters\": [\n            \"StripPrefix=1\"\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', 'f5bc668bd8caab26e49be67dfbeb38f9', '2021-10-30 13:45:47', '2021-10-30 05:45:48', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 73, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            \"Path=/sca-service-book/**\"\n        ],\n        \"filters\": [\n            \"StripPrefix=0\"\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', '9321d6ee8680ffc8374f1ae426bd40d8', '2021-10-30 13:46:01', '2021-10-30 05:46:02', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 74, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            \"Path=/sca-service-book/**\"\n        ],\n        \n        \"uri\": \"lb://sca-service-book\"\n    }\n]', '7db2cf86f890d399a169c6698163d536', '2021-10-30 13:48:08', '2021-10-30 05:48:08', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 75, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            \"Path=/sca-service-book/**\"\n        ],\n        \"filters\": [\n            \"StripPrefix=1\"\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', 'f5bc668bd8caab26e49be67dfbeb38f9', '2021-10-30 13:51:01', '2021-10-30 05:51:02', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 76, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            \"Path=/sca-service-book/**\"\n        ],\n        \"filters\": [\n            \"StripPrefix=1\"\n        ],\n        \"metadata\":{\n            \"name\": \"maple\"\n        },\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', 'b30659237030bc78c112660f5fd7b688', '2021-10-30 13:53:04', '2021-10-30 05:53:04', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 77, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            \"Path=/sca-service-book/**\"\n        ],\n        \"filters\": [\n            \"StripPrefix=1\"\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', 'f5bc668bd8caab26e49be67dfbeb38f9', '2021-10-30 13:53:59', '2021-10-30 05:53:59', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 78, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            \"Path=/sca-service-book/**\"\n        ],\n        \n        \"uri\": \"lb://sca-service-book\"\n    }\n]', '7db2cf86f890d399a169c6698163d536', '2021-10-30 13:54:07', '2021-10-30 05:54:07', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 79, 'sca-common.yml', 'common', '公用', 'service:\n  group:\n    name: sca-parent\n  book:\n    name: 书籍管理\n    value: sca-service-book\n    port: 8010\n  portal:\n    port: 8020\n  order:\n    port: 8030\n  gateway:\n    port: 8000\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  ', 'f88bc7e72f4c6c479d6436d6a4a62550', '2021-10-30 14:02:46', '2021-10-30 06:02:46', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 80, 'sca-common.yml', 'common', '公用', 'service:\n  group:\n    name: sca-parent\n  book:\n    port: 8010\n  portal:\n    port: 8020\n  order:\n    port: 8030\n  gateway:\n    port: 8000\n\nservice:\n  - value: sca-service-book\n    name: 书籍管理\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  ', 'b3295f63db54f23bb8b4766c516f5c2c', '2021-10-30 14:04:46', '2021-10-30 06:04:47', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (8, 81, 'sca-common.yml', 'common', '公用', 'service:\n  group:\n    name: sca-parent\n  book:\n    port: 8010\n  portal:\n    port: 8020\n  order:\n    port: 8030\n  gateway:\n    port: 8000\n\nswagger:\n  service:\n  - value: sca-service-book\n    name: 书籍管理\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  ', '56b7c9b85cda0b5413d6bd7afa16618f', '2021-10-30 14:11:52', '2021-10-30 06:11:52', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (48, 82, 'sca-gateway.json', 'dev', 'sca-gateway', '[\n    {\n        \"id\": \"sca-service-book\",\n        \"predicates\": [\n            \"Path=/sca-service-book/**\"\n        ],\n        \"filters\": [\n            \"StripPrefix=1\"\n        ],\n        \"uri\": \"lb://sca-service-book\"\n    }\n]', 'f5bc668bd8caab26e49be67dfbeb38f9', '2021-10-30 14:12:40', '2021-10-30 06:12:40', 'nacos', '0:0:0:0:0:0:0:1', 'U', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 83, 'service.vgroupMapping.system-server-group', 'SEATA_GROUP', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2021-10-30 16:06:48', '2021-10-30 08:06:48', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 84, 'service.vgroupMapping.product-server-group', 'SEATA_GROUP', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2021-10-30 16:06:49', '2021-10-30 08:06:49', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 85, 'store.mode', 'SEATA_GROUP', '', 'db', 'd77d5e503ad1439f585ac494268b351b', '2021-10-30 16:06:50', '2021-10-30 08:06:50', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 86, 'store.db.datasource', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2021-10-30 16:06:51', '2021-10-30 08:06:51', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 87, 'store.db.dbType', 'SEATA_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2021-10-30 16:06:52', '2021-10-30 08:06:52', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 88, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2021-10-30 16:06:52', '2021-10-30 08:06:53', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 89, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://localhost:3306/seata?serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf8&useSSL=true', '3553bc090302f505f6edb643ccfec938', '2021-10-30 16:06:53', '2021-10-30 08:06:54', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 90, 'store.db.user', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845', '2021-10-30 16:06:54', '2021-10-30 08:06:55', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 91, 'store.db.password', 'SEATA_GROUP', '', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2021-10-30 16:06:55', '2021-10-30 08:06:56', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 92, 'store.db.minConn', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2021-10-30 16:06:56', '2021-10-30 08:06:57', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 93, 'store.db.maxConn', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2021-10-30 16:06:57', '2021-10-30 08:06:58', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 94, 'store.db.globalTable', 'SEATA_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2021-10-30 16:06:58', '2021-10-30 08:06:58', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 95, 'store.db.branchTable', 'SEATA_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2021-10-30 16:06:59', '2021-10-30 08:06:59', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 96, 'store.db.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd', '2021-10-30 16:07:00', '2021-10-30 08:07:00', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 97, 'store.db.lockTable', 'SEATA_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2021-10-30 16:07:01', '2021-10-30 08:07:01', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (0, 98, 'store.db.maxWait', 'SEATA_GROUP', '', '5000', 'a35fe7f7fe8217b4369a0af4244d1fca', '2021-10-30 16:07:01', '2021-10-30 08:07:02', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-');
INSERT INTO `his_config_info` VALUES (77, 99, 'service.vgroupMapping.sca-service-book', 'DEFAULT_GROUP', 'seata', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2021-10-30 19:33:13', '2021-10-30 11:33:13', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (79, 100, 'store.mode', 'DEFAULT_GROUP', 'seata', 'db', 'd77d5e503ad1439f585ac494268b351b', '2021-10-30 19:33:13', '2021-10-30 11:33:13', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (80, 101, 'store.db.datasource', 'DEFAULT_GROUP', 'seata', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2021-10-30 19:33:13', '2021-10-30 11:33:13', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (81, 102, 'store.db.dbType', 'DEFAULT_GROUP', 'seata', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2021-10-30 19:33:13', '2021-10-30 11:33:13', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (82, 103, 'store.db.driverClassName', 'DEFAULT_GROUP', 'seata', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2021-10-30 19:33:13', '2021-10-30 11:33:13', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (83, 104, 'store.db.url', 'DEFAULT_GROUP', 'seata', 'jdbc:mysql://localhost:3306/seata?serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf8&useSSL=true', '3553bc090302f505f6edb643ccfec938', '2021-10-30 19:33:13', '2021-10-30 11:33:13', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (84, 105, 'store.db.user', 'DEFAULT_GROUP', 'seata', 'root', '63a9f0ea7bb98050796b649e85481845', '2021-10-30 19:33:13', '2021-10-30 11:33:13', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (85, 106, 'store.db.password', 'DEFAULT_GROUP', 'seata', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2021-10-30 19:33:13', '2021-10-30 11:33:13', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (86, 107, 'store.db.minConn', 'DEFAULT_GROUP', 'seata', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2021-10-30 19:33:13', '2021-10-30 11:33:13', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (87, 108, 'store.db.maxConn', 'DEFAULT_GROUP', 'seata', '30', '34173cb38f07f89ddbebc2ac9128303f', '2021-10-30 19:33:13', '2021-10-30 11:33:13', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (88, 109, 'store.db.globalTable', 'DEFAULT_GROUP', 'seata', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2021-10-30 19:33:20', '2021-10-30 11:33:21', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (89, 110, 'store.db.branchTable', 'DEFAULT_GROUP', 'seata', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2021-10-30 19:33:20', '2021-10-30 11:33:21', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (90, 111, 'store.db.queryLimit', 'DEFAULT_GROUP', 'seata', '100', 'f899139df5e1059396431415e770c6dd', '2021-10-30 19:33:20', '2021-10-30 11:33:21', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (91, 112, 'store.db.lockTable', 'DEFAULT_GROUP', 'seata', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2021-10-30 19:33:20', '2021-10-30 11:33:21', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (92, 113, 'store.db.maxWait', 'DEFAULT_GROUP', 'seata', '5000', 'a35fe7f7fe8217b4369a0af4244d1fca', '2021-10-30 19:33:20', '2021-10-30 11:33:21', NULL, '0:0:0:0:0:0:0:1', 'D', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 114, 'service.vgroupMapping.sca-service-book', 'DEFAULT_GROUP', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2021-10-30 19:35:10', '2021-10-30 11:35:11', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 115, 'service.vgroupMapping.sca-service-order', 'DEFAULT_GROUP', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2021-10-30 19:35:11', '2021-10-30 11:35:12', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 116, 'store.mode', 'DEFAULT_GROUP', '', 'db', 'd77d5e503ad1439f585ac494268b351b', '2021-10-30 19:35:12', '2021-10-30 11:35:13', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 117, 'store.db.datasource', 'DEFAULT_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2021-10-30 19:35:13', '2021-10-30 11:35:13', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 118, 'store.db.dbType', 'DEFAULT_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2021-10-30 19:35:14', '2021-10-30 11:35:14', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 119, 'store.db.driverClassName', 'DEFAULT_GROUP', '', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4', '2021-10-30 19:35:15', '2021-10-30 11:35:15', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 120, 'store.db.url', 'DEFAULT_GROUP', '', 'jdbc:mysql://127.0.0.1:3306/seata?useUnicode=true&rewriteBatchedStatements=true', '030ea5ff5c2ef043adf9826c70570b0b', '2021-10-30 19:35:16', '2021-10-30 11:35:16', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 121, 'store.db.user', 'DEFAULT_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845', '2021-10-30 19:35:17', '2021-10-30 11:35:17', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 122, 'store.db.password', 'DEFAULT_GROUP', '', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2021-10-30 19:35:17', '2021-10-30 11:35:18', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 123, 'store.db.minConn', 'DEFAULT_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2021-10-30 19:35:18', '2021-10-30 11:35:19', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 124, 'store.db.maxConn', 'DEFAULT_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2021-10-30 19:35:19', '2021-10-30 11:35:20', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 125, 'store.db.globalTable', 'DEFAULT_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2021-10-30 19:35:20', '2021-10-30 11:35:21', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 126, 'store.db.branchTable', 'DEFAULT_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2021-10-30 19:35:21', '2021-10-30 11:35:21', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 127, 'store.db.queryLimit', 'DEFAULT_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd', '2021-10-30 19:35:22', '2021-10-30 11:35:22', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 128, 'store.db.lockTable', 'DEFAULT_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2021-10-30 19:35:23', '2021-10-30 11:35:23', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');
INSERT INTO `his_config_info` VALUES (0, 129, 'store.db.maxWait', 'DEFAULT_GROUP', '', '5000', 'a35fe7f7fe8217b4369a0af4244d1fca', '2021-10-30 19:35:24', '2021-10-30 11:35:24', 'nacos', '127.0.0.1', 'I', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `action` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', 'e51b0432-97f2-4e3e-9013-bb42b2aeda15', 'sca-parent', 'sca-parent命名空间', 'nacos', 1635332935972, 1635335927668);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
