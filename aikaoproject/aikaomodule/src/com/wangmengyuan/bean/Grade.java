package com.wangmengyuan.bean;

import java.util.Date;

/**
 * Created by Administrator on 2017/11/23.
 */
public class Grade {
    private Integer gid;
    private Integer gscore;
    private String ganswer;
    private Date gendtime;
    private String sid;
    private Integer tid;

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

    public Date getGendtime() {
        return gendtime;
    }

    public void setGendtime(Date gendtime) {
        this.gendtime = gendtime;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }
}
