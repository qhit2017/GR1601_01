package com.yanlihua.bean;

import java.io.Serializable;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by 晏利花 on 2017/11/22.
 */
public class Testpaper implements Serializable {
    /*试卷id*/
    private Integer tid;
    /*类型*/
    private String ttype;
     /*标题*/
    private String ttitle;
    /*考试时间*/
    private Integer ttime;
    /*状态*/
    private String tstate;
    /*总题数*/
    private Integer tsum;
    /*每题分数*/
    private Integer teachscore;
    /*考试班级*/
    private String cname;

//======================================外键====================================================
   /* //外键
    private Integer suid;*/
    //多张卷子可以使同一类科目表
    private Subject subject;

 //==================================类关系==========================================
    //一张试卷有多个(学生)成绩
    private Set<Grade> gradeSet;
    //一张试卷中有多道题(类中忽略了中间表Middle)
    private Set<Questionbank> questionbankSet = new HashSet<Questionbank>();

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
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

    public Integer getTtime() {
        return ttime;
    }

    public void setTtime(Integer ttime) {
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

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Set<Grade> getGradeSet() {
        return gradeSet;
    }

    public void setGradeSet(Set<Grade> gradeSet) {
        this.gradeSet = gradeSet;
    }

    public Set<Questionbank> getQuestionbankSet() {
        return questionbankSet;
    }

    public void setQuestionbankSet(Set<Questionbank> questionbankSet) {
        this.questionbankSet = questionbankSet;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
}
