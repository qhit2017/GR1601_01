package com.jiang.bean;

import java.io.Serializable;
import java.util.Set;

/**
 * 试卷表
 * Created by dell on 2017/11/23.
 */
public class Testpaper implements Serializable {
    private Integer tid;       /*主键*/
    private Students students; /*（外键）*/
    private String ttype;      /*类型（笔试 机试）*/
    private String ttitle;     /*标题*/
    private String ttime;      /*考试时间*/
    private String tstate;     /*状态*/
    private Integer tsum;      /*总题数*/
    private Integer teachscore;/*每题分数*/
    private Set<Questionbank> questionbanks;
    private Set<Grade> grades;

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
    }

    public String getTtype() {
        return ttype;
    }

    public void setTtype(String ttype) {
        this.ttype = ttype;
    }

    public String getTtitle() {
        return ttitle;
    }

    public void setTtitle(String ttitle) {
        this.ttitle = ttitle;
    }

    public String getTtime() {
        return ttime;
    }

    public void setTtime(String ttime) {
        this.ttime = ttime;
    }

    public String getTstate() {
        return tstate;
    }

    public void setTstate(String tstate) {
        this.tstate = tstate;
    }

    public Integer getTsum() {
        return tsum;
    }

    public void setTsum(Integer tsum) {
        this.tsum = tsum;
    }

    public Integer getTeachscore() {
        return teachscore;
    }

    public void setTeachscore(Integer teachscore) {
        this.teachscore = teachscore;
    }

    public Set<Questionbank> getQuestionbanks() {
        return questionbanks;
    }

    public void setQuestionbanks(Set<Questionbank> questionbanks) {
        this.questionbanks = questionbanks;
    }

    public Set<Grade> getGrades() {
        return grades;
    }

    public void setGrades(Set<Grade> grades) {
        this.grades = grades;
    }
}
