package com.wangdoudou.bean;

import java.util.Date;

/**
 * Created by 王豆豆 on 2017/11/23.
 */
public class Grade {
    private Integer gid;
    private Integer gscore;
    private String ganswer;
    private Date gendtime;
    private Integer sid;
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

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }
}
