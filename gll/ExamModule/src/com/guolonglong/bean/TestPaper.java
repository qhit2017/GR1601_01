package com.guolonglong.bean;

import java.io.Serializable;
import java.sql.Date;


/**
 * Created by lenovo on 2017/11/23.
 */
public class TestPaper implements Serializable {
    private Integer tid;
    private String ttype;
    private String ttitle;
    private String ttime;
    private String tstate;
    private Integer tsum;
    private Integer teachscore;
    private Subject subject;

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

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }
}
