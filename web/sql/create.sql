DROP TABLE "T_USER";
DROP TABLE "T_11X5";


CREATE TABLE T_USER
(
 ID                             VARCHAR(32),
 CODE                           VARCHAR(32),
 ICON                           VARCHAR(64),
 NAME                           VARCHAR(16),
 LOGINNAME                      VARCHAR(16),
 PASSWORD                       VARCHAR(16),
 PHONE                          VARCHAR(32),
 ROLE                           VARCHAR(32),
 STATUS                         VARCHAR(1),    /*  1:锁定 */
 SECRETKEY                      VARCHAR(128),
 DESCRIPTION                    VARCHAR(1024),
 OPENID                         VARCHAR(64),
 CREATE_DATE                    DATETIME,
 CONSTRAINT T_USER_PK PRIMARY KEY(ID)
);

INSERT INTO T_USER(ID, CODE, ICON, NAME, LOGINNAME, PASSWORD, ROLE, CREATE_DATE) VALUES('1', '001', '', '张大山', '', '', '10000000', CURRENT_TIMESTAMP);


CREATE TABLE T_11X5
(
 ID                             VARCHAR(32),
 TYPE                           VARCHAR(32),
 PHASE                          VARCHAR(12),
 CODE                           VARCHAR(64),
 TIME                           VARCHAR(64),
 CREATE_DATE                    DATETIME,
 CONSTRAINT T_11X5_PK PRIMARY KEY(ID)
);

CREATE TABLE T_11X5_RECOMMEND
(
 ID                             VARCHAR(32),
 TYPE                           VARCHAR(32),
 PHASE                          VARCHAR(12),
 CONTENT                        VARCHAR(2048),
 TIME                           VARCHAR(64),
 CREATE_DATE                    DATETIME,
 CONSTRAINT T_11X5_RECOMMEND_PK PRIMARY KEY(ID)
);

CREATE TABLE T_AGENT
(
 ID                             VARCHAR(32),
 NAME                           VARCHAR(128),
 CONTACTS                       VARCHAR(32),
 PHONE                          VARCHAR(32),
 ADDRESS                        VARCHAR(256),
 CREATE_DATE                    DATETIME,
 CONSTRAINT T_AGENT_PK PRIMARY KEY(ID)
);


CREATE TABLE T_BET
(
 ID                             VARCHAR(32),
 MODE                           VARCHAR(2),        /* 玩法：任选2(2), 任选3(3), 任选4(4), 任选5(5), 任选6(6), 任选7(7), 任选8(8) */
 PHASE                          VARCHAR(12),       /* 期数 */
 CODE                           VARCHAR(max),      /* 号码 */
 MULTIPLE                       INT,               /* 倍数 */
 CHIP                           INT,               /* 投注金额 */
 BONUS                          INT,               /* 中奖金额 */
 TYPE                           VARCHAR(2),        /* 类型：任选(1)，做号(2) */
 RESULT                         VARCHAR(64),       /* 开奖号码 */
 BINGO                          VARCHAR(2),        /* 是否中奖 */
 CREATE_USER_ID                 VARCHAR(32),       /* 创建人 */
 CREATE_DATE                    DATETIME,          /* 创建时间 */
 CONSTRAINT T_BET_PK PRIMARY KEY(ID)
);


ALTER TABLE T_USER ADD CHIP INT;