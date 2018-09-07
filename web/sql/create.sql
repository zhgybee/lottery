


CREATE TABLE T_USER
(
 ID                             VARCHAR(32),
 CODE                           VARCHAR(32),
 ICON                           VARCHAR(64),
 NAME                           VARCHAR(16),
 LOGINNAME                      VARCHAR(16),
 PASSWORD                       VARCHAR(16),
 ROLE                           VARCHAR(32),
 CREATE_DATE                    DATETIME,
 CONSTRAINT T_USER_PK PRIMARY KEY(ID)
);

INSERT INTO T_USER(ID, CODE, ICON, NAME, LOGINNAME, PASSWORD, ROLE, CREATE_DATE) VALUES('1', '', '', 'π‹¿Ì‘±', 'admin', '1', '', CURRENT_TIMESTAMP);
