/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/11/22 20:35:56                          */
/*==============================================================*/


DROP TABLE IF EXISTS Middle;

DROP TABLE IF EXISTS classes;

DROP TABLE IF EXISTS grade;

DROP TABLE IF EXISTS questionbank;

DROP TABLE IF EXISTS students;

DROP TABLE IF EXISTS SUBJECT;

DROP TABLE IF EXISTS teachers;

DROP TABLE IF EXISTS testpaper;

/*==============================================================*/
/* Table: Middle                                                */
/*==============================================================*/
CREATE TABLE Middle
(
   MID                  INT NOT NULL AUTO_INCREMENT,
   qid                  INT,
   tid                  INT,
   PRIMARY KEY (MID)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: classes                                               */
/*==============================================================*/
CREATE TABLE classes
(
   cid                  INT NOT NULL AUTO_INCREMENT,
   cnumber              VARCHAR(255),
   cname                VARCHAR(255),
   cdirection           VARCHAR(255),
   tidl                 INT,
   tidh                 INT,
   cbegin               STRING,
   cg1                  INT,
   cg2                  INT,
   cg3                  INT,
   cstate               INT,
   cremark              VARCHAR(255),
   PRIMARY KEY (cid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: grade                                                 */
/*==============================================================*/
CREATE TABLE grade
(
   gid                  INT NOT NULL AUTO_INCREMENT,
   gscore               INT,
   ganswer              VARCHAR(1024),
   gendtime             DATETIME,
   sid                  INT,
   tid                  INT,
   PRIMARY KEY (gid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: questionbank                                          */
/*==============================================================*/
CREATE TABLE questionbank
(
   qid                  INT NOT NULL AUTO_INCREMENT,
   suid                 INT,
   qchapter             VARCHAR(255),
   qtype                INT,
   qcontent             VARCHAR(255),
   qa                   CHAR(50),
   qb                   CHAR(50),
   qc                   CHAR(50),
   qd                   CHAR(50),
   qanswer              CHAR(50),
   qdifficulty          VARCHAR(255),
   PRIMARY KEY (qid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: students                                              */
/*==============================================================*/
CREATE TABLE students
(
   sid                  INT NOT NULL AUTO_INCREMENT,
   snumber              VARCHAR(255),
   sname                VARCHAR(255),
   ssex                 VARCHAR(255),
   senter               DATETIME,
   cid                  INT,
   sbirthday            DATETIME,
   sidnumber            VARCHAR(255),
   sprovince            VARCHAR(255),
   smahor               VARCHAR(255),
   stel                 VARCHAR(255),
   sptel                VARCHAR(255),
   sdormitory           VARCHAR(255),
   spolitics            VARCHAR(255),
   scity                VARCHAR(255),
   sattend              VARCHAR(255),
   saddress             VARCHAR(255),
   srelation            VARCHAR(255),
   sbasicinfo           VARCHAR(255),
   sdnumber             INT,
   seducation           VARCHAR(255),
   sphoto               VARCHAR(255),
   spassword            VARCHAR(255),
   srole                INT,
   PRIMARY KEY (sid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: subject                                               */
/*==============================================================*/
CREATE TABLE SUBJECT
(
   suid                 INT NOT NULL AUTO_INCREMENT,
   sudirection          VARCHAR(255),
   sustage              VARCHAR(255),
   sucourse             VARCHAR(255),
   PRIMARY KEY (suid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: teachers                                              */
/*==============================================================*/
CREATE TABLE teachers
(
   tid                  INT NOT NULL AUTO_INCREMENT,
   tnumber              VARCHAR(255),
   tname                VARCHAR(255),
   tsex                 VARCHAR(255),
   tbirthday            VARCHAR(255),
   teducation           VARCHAR(255),
   ttel                 VARCHAR(255),
   tjob                 INT,
   tpassword            VARCHAR(255),
   trole                INT,
   tremark              VARCHAR(255),
   PRIMARY KEY (tid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: testpaper                                             */
/*==============================================================*/
CREATE TABLE testpaper
(
   tid                  INT NOT NULL AUTO_INCREMENT,
   suid                 INT,
   ttype                VARCHAR(255),
   ttitle               VARCHAR(255),
   ttime                DATETIME,
   tstate               VARCHAR(255),
   tsum                 INT,
   teachscore           INT,
   PRIMARY KEY (tid)
)
AUTO_INCREMENT = 1;

ALTER TABLE Middle ADD CONSTRAINT FK_Reference_8 FOREIGN KEY (qid)
      REFERENCES questionbank (qid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Middle ADD CONSTRAINT FK_Reference_9 FOREIGN KEY (tid)
      REFERENCES testpaper (tid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE classes ADD CONSTRAINT FK_Reference_1 FOREIGN KEY (tidl)
      REFERENCES teachers (tid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE classes ADD CONSTRAINT FK_Reference_2 FOREIGN KEY (tidh)
      REFERENCES teachers (tid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE grade ADD CONSTRAINT FK_Reference_6 FOREIGN KEY (tid)
      REFERENCES testpaper (tid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE grade ADD CONSTRAINT FK_Reference_7 FOREIGN KEY (sid)
      REFERENCES students (sid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE questionbank ADD CONSTRAINT FK_Reference_3 FOREIGN KEY (suid)
      REFERENCES SUBJECT (suid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE students ADD CONSTRAINT FK_Reference_5 FOREIGN KEY (cid)
      REFERENCES classes (cid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE testpaper ADD CONSTRAINT FK_Reference_4 FOREIGN KEY (suid)
      REFERENCES SUBJECT (suid) ON DELETE RESTRICT ON UPDATE RESTRICT;

