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
/* Table: Middle               中间表                           */
/*==============================================================*/
CREATE TABLE Middle
(
   MID                  INT NOT NULL AUTO_INCREMENT,	/*主键id*/
   qid                  INT,			    	/*题库外键*/
   tid                  INT,				/*试卷外键*/
   PRIMARY KEY (MID)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: classes               班级表                          */
/*==============================================================*/
CREATE TABLE classes
(
   cid                  INT NOT NULL AUTO_INCREMENT,	/*班级id*/
   cnumber              VARCHAR(255),			/*班级代号*/
   cname                VARCHAR(255),			/*班级名称*/
   cdirection           VARCHAR(255),			/*所属方向*/
   tidl                 INT,				/*讲师外键*/
   tidh                 INT,				/*班主任外键*/
   cbegin               DATETIME,			/*开班日期*/
   cg1                  INT,				/*G1开班人数*/
   cg2                  INT,				/*G2开班人数*/
   cg3                  INT,				/*G3开班人数*/
   cstate               INT,				/*状态*/
   cremark              VARCHAR(255),			/*备注*/
   PRIMARY KEY (cid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: grade                 成绩表                          */
/*==============================================================*/
CREATE TABLE grade
(
   gid                  INT NOT NULL AUTO_INCREMENT,	/*成绩id*/
   gscore               INT,				/*分数*/
   ganswer              VARCHAR(1024),			/*学生答案*/
   gendtime             DATETIME,			/*结束时间*/
   sid                  INT,				/*试卷外键*/
   tid                  INT,				/*学生外键*/
   PRIMARY KEY (gid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: questionbank           题库表                         */
/*==============================================================*/
CREATE TABLE questionbank
(
   qid                  INT NOT NULL AUTO_INCREMENT,	/*题库id*/
   suid                 INT,				/*条件id*/
   qchapter             VARCHAR(255),			/*对应章节*/
   qtype                INT,				/*类型*/
   qcontent             VARCHAR(255),			/*题目*/
   qa                   CHAR(50),			/*选项A*/
   qb                   CHAR(50),			/*选项B*/
   qc                   CHAR(50),			/*选项C*/
   qd                   CHAR(50),			/*选项D*/
   qanswer              CHAR(50),			/*答案*/
   qdifficulty          VARCHAR(255),			/*难度*/
   PRIMARY KEY (qid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: students                  学生表                      */
/*==============================================================*/
CREATE TABLE students
(
   sid                  INT NOT NULL AUTO_INCREMENT,	/*主键*/
   snumber              VARCHAR(255),			/*学号*/
   sname                VARCHAR(255),			/*姓名*/
   ssex                 VARCHAR(255),			/*性别*/
   senter               DATETIME,			/*入学年份*/
   cid                  INT,				/*班级外键*/
   sbirthday            DATETIME,			/*生日*/
   sidnumber            VARCHAR(255),			/*省份证号*/
   sprovince            VARCHAR(255),			/*省份*/
   smahor               VARCHAR(255),			/*专业简称*/
   stel                 VARCHAR(255),			/*联系电话*/
   sptel                VARCHAR(255),			/*家长电话*/
   sdormitory           VARCHAR(255),			/*宿舍*/
   spolitics            VARCHAR(255),			/*政治面貌*/
   scity                VARCHAR(255),			/*城市*/
   sattend              VARCHAR(255),			/*就读方向*/
   saddress             VARCHAR(255),			/*家庭住址*/
   srelation            VARCHAR(255),			/*监护人关系*/
   sbasicinfo           VARCHAR(255),			/*基本情况*/
   sdnumber             INT,				/*宿舍号*/
   seducation           VARCHAR(255),			/*教育背景*/
   sphoto               VARCHAR(255),			/*照片*/
   spassword            VARCHAR(255),			/*登录密码*/
   srole                INT,				/*角色*/
   PRIMARY KEY (sid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: subject               科目表                          */
/*==============================================================*/
CREATE TABLE SUBJECT
(
   suid                 INT NOT NULL AUTO_INCREMENT,	/*主键*/
   sudirection          VARCHAR(255),			/*方向*/
   sustage              VARCHAR(255),			/*阶段*/
   sucourse             VARCHAR(255),			/*科目*/	
   PRIMARY KEY (suid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: teachers                 教师表                       */
/*==============================================================*/
CREATE TABLE teachers
(
   tid                  INT NOT NULL AUTO_INCREMENT,	/*主键*/
   tnumber              VARCHAR(255),			/*编号*/
   tname                VARCHAR(255),			/*姓名*/
   tsex                 VARCHAR(255),			/*性别*/
   tbirthday            VARCHAR(255),			/*生日*/
   tphone               VARCHAR(255),			/*学历*/
   ttel                 VARCHAR(255),			/*联系电话*/
   tjob                 INT,				/*岗位*/
   tpassword            VARCHAR(255),			/*登录密码*/
   trole                INT,				/*角色*/
   tremark              VARCHAR(255),			/*备注*/
   PRIMARY KEY (tid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: testpaper                  试卷表                     */
/*==============================================================*/
CREATE TABLE testpaper
(
   tid                  INT NOT NULL AUTO_INCREMENT,	/*主键*/
   suid                 INT,				/*条件id*/
   ttype               VARCHAR(255),			/*类型*/
   ttitle               VARCHAR(255),			/*标题*/
   ttime                DATETIME,			/*考试时间*/
   tstate               VARCHAR(255),			/*状态*/
   tsum                 INT,				/*总题数*/
   teachscore           INT,				/*每题分数*/
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

