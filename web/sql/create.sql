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
 STATUS                         VARCHAR(1),    /*  1:���� */
 SECRETKEY                      VARCHAR(128),
 DESCRIPTION                    VARCHAR(1024),
 OPENID                         VARCHAR(64),
 CREATE_DATE                    DATETIME,
 CONSTRAINT T_USER_PK PRIMARY KEY(ID)
);

INSERT INTO T_USER(ID, CODE, ICON, NAME, LOGINNAME, PASSWORD, ROLE, CREATE_DATE) VALUES('1', '001', '', '�Ŵ�ɽ', '', '', '10000000', CURRENT_TIMESTAMP);


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

DROP TABLE "T_BET";
CREATE TABLE T_BET
(
 ID                             VARCHAR(32),
 WAY                            VARCHAR(2),        /* �淨����ѡ2(2), ��ѡ3(3), ��ѡ4(4), ��ѡ5(5), ��ѡ6(6), ��ѡ7(7), ��ѡ8(8) */
 TYPE                           VARCHAR(32),
 PHASE                          VARCHAR(12),       /* ���� */
 CODE                           VARCHAR(8000),     /* ���� */
 COUNT                          INT,               /* Ͷעע�� */
 MULTIPLE                       INT,               /* ���� */
 CHIP                           INT,               /* Ͷע��� */
 BONUS                          INT,               /* ���� */
 ACTUALCODE                     VARCHAR(64),       /* �������� */
 IS_BINGO                       VARCHAR(2),        /* �Ƿ��н� */
 ACHIEVE                        INT,               /* �н����� */
 IS_FINISHED                    VARCHAR(2),        /* �Ƿ񿪽� */
 CREATE_USER_ID                 VARCHAR(32),       /* ������ */
 CREATE_DATE                    DATETIME,          /* ����ʱ�� */
 CONSTRAINT T_BET_PK PRIMARY KEY(ID)
);


ALTER TABLE T_USER ADD CHIP INT;