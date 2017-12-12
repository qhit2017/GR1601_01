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
/* Table: Middle               �м��                           */
/*==============================================================*/
CREATE TABLE Middle
(
   MID                  INT NOT NULL AUTO_INCREMENT,	/*����id*/
   qid                  INT,			    	/*������*/
   tid                  INT,				/*�Ծ����*/
   PRIMARY KEY (MID)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: classes               �༶��                          */
/*==============================================================*/
CREATE TABLE classes
(
   cid                  INT NOT NULL AUTO_INCREMENT,	/*�༶id*/
   cnumber              VARCHAR(255),			/*�༶����*/
   cname                VARCHAR(255),			/*�༶����*/
   cdirection           VARCHAR(255),			/*��������*/
   tidl                 INT,				/*��ʦ���*/
   tidh                 INT,				/*���������*/
   cbegin               DATETIME,			/*��������*/
   cg1                  INT,				/*G1��������*/
   cg2                  INT,				/*G2��������*/
   cg3                  INT,				/*G3��������*/
   cstate               INT,				/*״̬*/
   cremark              VARCHAR(255),			/*��ע*/
   PRIMARY KEY (cid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: grade                 �ɼ���                          */
/*==============================================================*/
CREATE TABLE grade
(
   gid                  INT NOT NULL AUTO_INCREMENT,	/*�ɼ�id*/
   gscore               INT,				/*����*/
   ganswer              VARCHAR(1024),			/*ѧ����*/
   gendtime             DATETIME,			/*����ʱ��*/
   sid                  INT,				/*�Ծ����*/
   tid                  INT,				/*ѧ�����*/
   PRIMARY KEY (gid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: questionbank           ����                         */
/*==============================================================*/
CREATE TABLE questionbank
(
   qid                  INT NOT NULL AUTO_INCREMENT,	/*���id*/
   suid                 INT,				/*����id*/
   qchapter             VARCHAR(255),			/*��Ӧ�½�*/
   qtype                INT,				/*����*/
   qcontent             VARCHAR(255),			/*��Ŀ*/
   qa                   CHAR(50),			/*ѡ��A*/
   qb                   CHAR(50),			/*ѡ��B*/
   qc                   CHAR(50),			/*ѡ��C*/
   qd                   CHAR(50),			/*ѡ��D*/
   qanswer              CHAR(50),			/*��*/
   qdifficulty          VARCHAR(255),			/*�Ѷ�*/
   PRIMARY KEY (qid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: students                  ѧ����                      */
/*==============================================================*/
CREATE TABLE students
(
   sid                  INT NOT NULL AUTO_INCREMENT,	/*����*/
   snumber              VARCHAR(255),			/*ѧ��*/
   sname                VARCHAR(255),			/*����*/
   ssex                 VARCHAR(255),			/*�Ա�*/
   senter               DATETIME,			/*��ѧ���*/
   cid                  INT,				/*�༶���*/
   sbirthday            DATETIME,			/*����*/
   sidnumber            VARCHAR(255),			/*ʡ��֤��*/
   sprovince            VARCHAR(255),			/*ʡ��*/
   smahor               VARCHAR(255),			/*רҵ���*/
   stel                 VARCHAR(255),			/*��ϵ�绰*/
   sptel                VARCHAR(255),			/*�ҳ��绰*/
   sdormitory           VARCHAR(255),			/*����*/
   spolitics            VARCHAR(255),			/*������ò*/
   scity                VARCHAR(255),			/*����*/
   sattend              VARCHAR(255),			/*�Ͷ�����*/
   saddress             VARCHAR(255),			/*��ͥסַ*/
   srelation            VARCHAR(255),			/*�໤�˹�ϵ*/
   sbasicinfo           VARCHAR(255),			/*�������*/
   sdnumber             INT,				/*�����*/
   seducation           VARCHAR(255),			/*��������*/
   sphoto               VARCHAR(255),			/*��Ƭ*/
   spassword            VARCHAR(255),			/*��¼����*/
   srole                INT,				/*��ɫ*/
   PRIMARY KEY (sid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: subject               ��Ŀ��                          */
/*==============================================================*/
CREATE TABLE SUBJECT
(
   suid                 INT NOT NULL AUTO_INCREMENT,	/*����*/
   sudirection          VARCHAR(255),			/*����*/
   sustage              VARCHAR(255),			/*�׶�*/
   sucourse             VARCHAR(255),			/*��Ŀ*/	
   PRIMARY KEY (suid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: teachers                 ��ʦ��                       */
/*==============================================================*/
CREATE TABLE teachers
(
   tid                  INT NOT NULL AUTO_INCREMENT,	/*����*/
   tnumber              VARCHAR(255),			/*���*/
   tname                VARCHAR(255),			/*����*/
   tsex                 VARCHAR(255),			/*�Ա�*/
   tbirthday            VARCHAR(255),			/*����*/
   tphone               VARCHAR(255),			/*ѧ��*/
   ttel                 VARCHAR(255),			/*��ϵ�绰*/
   tjob                 INT,				/*��λ*/
   tpassword            VARCHAR(255),			/*��¼����*/
   trole                INT,				/*��ɫ*/
   tremark              VARCHAR(255),			/*��ע*/
   PRIMARY KEY (tid)
)
AUTO_INCREMENT = 1;

/*==============================================================*/
/* Table: testpaper                  �Ծ��                     */
/*==============================================================*/
CREATE TABLE testpaper
(
   tid                  INT NOT NULL AUTO_INCREMENT,	/*����*/
   suid                 INT,				/*����id*/
   ttype               VARCHAR(255),			/*����*/
   ttitle               VARCHAR(255),			/*����*/
   ttime                DATETIME,			/*����ʱ��*/
   tstate               VARCHAR(255),			/*״̬*/
   tsum                 INT,				/*������*/
   teachscore           INT,				/*ÿ�����*/
   cname               VARCHAR(255),
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

