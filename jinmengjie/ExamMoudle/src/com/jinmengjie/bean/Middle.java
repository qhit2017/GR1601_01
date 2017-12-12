package com.jinmengjie.bean;

import java.io.Serializable;


public class Middle implements Serializable {
    private  Integer Mid;//主键id
    private  Questionbank qid;//题库外键
    private  Testpaper tid;//试卷外键

    public Integer getMid() {
        return Mid;
    }

    public void setMid(Integer mid) {
        Mid = mid;
    }

    public Questionbank getQid() {
        return qid;
    }

    public void setQid(Questionbank qid) {
        this.qid = qid;
    }

    public Testpaper getTid() {
        return tid;
    }

    public void setTid(Testpaper tid) {
        this.tid = tid;
    }
}
