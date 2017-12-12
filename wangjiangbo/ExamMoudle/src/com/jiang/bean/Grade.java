package com.jiang.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 分数表
 * Created by dell on 2017/11/23.
 */
public class Grade implements Serializable {
    private Integer gid;        /*主键*/
    private Integer gscore;     /*分数（每个人的分数）*/
    private String ganswer;     /*学生答案*/
    private String gendtime;    /*结束时间*/
    private Students students;  /*学生外键*/
    private Testpaper testpaper;//试卷外键

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

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
    }

    public Testpaper getTestpaper() {
        return testpaper;
    }

    public void setTestpaper(Testpaper testpaper) {
        this.testpaper = testpaper;
    }
}
