package com.chengshuai.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Administrator on 2017/12/6.
 */
public class Testpaper implements Serializable {
    private Integer tid;
    private Integer suid;
    private String ttype;
    private String ttitle;
    private String ttime;
    private String tstate;
    private String tsum;
    private String teachscore;

    private Set<Questionbank> questionbankSet =new HashSet<Questionbank>();

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getSuid() {
        return suid;
    }

    public void setSuid(Integer suid) {
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

    public String getTsum() {
        return tsum;
    }

    public void setTsum(String tsum) {
        this.tsum = tsum;
    }

    public String getTeachscore() {
        return teachscore;
    }

    public void setTeachscore(String teachscore) {
        this.teachscore = teachscore;
    }

    public Set<Questionbank> getQuestionbankSet() {
        return questionbankSet;
    }

    public void setQuestionbankSet(Set<Questionbank> questionbankSet) {
        this.questionbankSet = questionbankSet;
    }
}
