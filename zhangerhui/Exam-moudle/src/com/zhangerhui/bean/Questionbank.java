package com.zhangerhui.bean;

import javax.security.auth.Subject;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by Administrator on 2017/11/23/023.
 */
public class Questionbank implements Serializable {

    /*题库id*/
    private Integer qid;
    /*对应章节*/
    private String qchapter;
    /*类型*/
    private Integer qtype;
    /*题目内容*/
    private String qcontent;
    /*选项A*/
    private String qa;
    /*选项B*/
    private String qb;
    /*选项C*/
    private String qc;
    /*选项D*/
    private String qd;
    /*答案*/
    private String qanswer;
    /*难度*/
    private String qdifficulty;

    //==================================外键关系=============================================
    /*//条件id
    private Integer suid;*/
    //一个科目有多道题
    private Subject subject;

    //==================================类关系==========================================
    //一道题中可以被多道题使用(类中忽略了中间表Middle)
    private Set<Testpaper> testpaperSet;

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
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

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Set<Testpaper> getTestpaperSet() {
        return testpaperSet;
    }

    public void setTestpaperSet(Set<Testpaper> testpaperSet) {
        this.testpaperSet = testpaperSet;
    }
}
