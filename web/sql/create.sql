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
 CREATE_DATE                    DATETIME,
 CONSTRAINT T_USER_PK PRIMARY KEY(ID)
);

INSERT INTO T_USER(ID, CODE, ICON, NAME, LOGINNAME, PASSWORD, ROLE, CREATE_DATE) VALUES('1', '001', '', '’≈¥Û…Ω', '', '', '10000000', CURRENT_TIMESTAMP);


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