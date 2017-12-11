package com.wangyinghao.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by 王英豪 on 2017/11/23.
 */
public class Testpaper implements Serializable {
    private  Integer tid;
    private  Integer suid;
    private  String ttype;
    private  String ttitle;
    private Date ttime;
    private  String tstate;
    private  Integer tsum;
    private  Integer teachscore;

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

    public Date getTtime() {
        return ttime;
    }

    public void setTtime(Date ttime) {
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
}
