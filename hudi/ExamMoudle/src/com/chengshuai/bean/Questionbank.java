package com.chengshuai.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Administrator on 2017/12/6.
 */
public class Questionbank implements Serializable {
    private Integer qid;
    private Integer suid;
    private String qchapter;
    private Integer qtype;
    private String qcontent;
    private String qa;
    private String qb;
    private String qc;
    private String qd;
    private String qanswer;
    private String qdifficulty;

    private Set<Testpaper> testpaperSet = new HashSet<Testpaper>();

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public Integer getSuid() {
        return suid;
    }

    public void setSuid(Integer suid) {
        this.suid = suid;
    }

    public String getQchapter() {
        return qchapter;
    }

    public void setQchapter(String qchapter) {
        this.qchapter = qchapter;
    }

    public Integer getQtype() {
        return qtype;
    }

    public void setQtype(Integer qtype) {
        this.qtype = qtype;
    }

    public String getQcontent() {
        return qcontent;
    }

    public void setQcontent(String qcontent) {
        this.qcontent = qcontent;
    }

    public String getQa() {
        return qa;
    }

    public void setQa(String qa) {
        this.qa = qa;
    }

    public String getQb() {
        return qb;
    }

    public void setQb(String qb) {
        this.qb = qb;
    }

    public String getQc() {
        return qc;
    }

    public void setQc(String qc) {
        this.qc = qc;
    }

    public String getQd() {
        return qd;
    }

    public void setQd(String qd) {
        this.qd = qd;
    }

    public String getQanswer() {
        return qanswer;
    }

    public void setQanswer(String qanswer) {
        this.qanswer = qanswer;
    }

    public String getQdifficulty() {
        return qdifficulty;
    }

    public void setQdifficulty(String qdifficulty) {
        this.qdifficulty = qdifficulty;
    }

    public Set<Testpaper> getTestpaperSet() {
        return testpaperSet;
    }

    public void setTestpaperSet(Set<Testpaper> testpaperSet) {
        this.testpaperSet = testpaperSet;
    }
}
