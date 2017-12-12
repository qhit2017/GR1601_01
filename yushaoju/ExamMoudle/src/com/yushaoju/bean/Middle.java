package com.yushaoju.bean;

import java.io.Serializable;

/**
 * Created by Svip on 2017/11/23.
 */
public class Middle implements Serializable {
    private  Integer mid;
    private  Integer qid;
    private  Integer tid;

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }
}
