package com.yaokaiwen.bean;

import java.io.Serializable;
import java.util.Calendar;


public class Grade implements Serializable {
    //成绩表
    private  Integer gid ;	/*成绩id*/
    private  Integer gscore; /*分数*/
    private  String ganswer; /*学生答案*/
    private  String gendtime; /*结束时间*/
    private  Students sid;              /*学生外键*/
    private  Testpaper tid ;            /*试卷外键*/

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getGscore() {
        return gscore;
    }

    public void setGscore(Integer gscore) {
        this.gscore = gscore;
    }

    public String getGanswer() {
        return ganswer;
    }

    public void setGanswer(String ganswer) {
        this.ganswer = ganswer;
    }

    public String getGendtime() {
        return gendtime;
    }

    public void setGendtime(String gendtime) {
        this.gendtime = gendtime;
    }

    public Students getSid() {
        return sid;
    }

    public void setSid(Students sid) {
        this.sid = sid;
    }

    public Testpaper getTid() {
        return tid;
    }

    public void setTid(Testpaper tid) {
        this.tid = tid;
    }
}
