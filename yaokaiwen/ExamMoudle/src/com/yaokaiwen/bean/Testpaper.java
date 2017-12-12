package com.yaokaiwen.bean;

import java.io.Serializable;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;


public class Testpaper implements Serializable {
    //试卷表
    private  Integer tid;/*主键*/
    private  Subject suid;              /*条件id外键*/
    private  String ttype;/*类型*/
    private  String ttitle;/*标题*/
    private  String ttime ;/*考试时间*/
    private  String tstate;/*状态*/
    private  Integer tsum ;/*总题数*/
    private  Integer teachscore ;/*每题分数*/

    private Set<Questionbank> questionbankSet = new HashSet<Questionbank>();
    private Set<Grade> grades = new HashSet<Grade>();//维护成绩表

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Subject getSuid() {
        return suid;
    }

    public void setSuid(Subject suid) {
        this.suid = suid;
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

    public Set<Questionbank> getQuestionbankSet() {
        return questionbankSet;
    }

    public void setQuestionbankSet(Set<Questionbank> questionbankSet) {
        this.questionbankSet = questionbankSet;
    }

    public Set<Grade> getGrades() {
        return grades;
    }

    public void setGrades(Set<Grade> grades) {
        this.grades = grades;
    }
}
