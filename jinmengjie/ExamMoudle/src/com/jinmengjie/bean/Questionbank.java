package com.jinmengjie.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;


public class Questionbank implements Serializable {
    //题库表
    private  Integer qid ;	/*题库id*/
    private  Subject suid;              /*条件id*/
    private  String qchapter;/*对应章节*/
    private  Integer qtype;    /*类型*/
    private  String qcontent;/*题目*/
    private  String qa;     /*选项A*/
    private  String qb;/*选项B*/
    private  String qc; /*选项C*/
    private  String qd; /*选项D*/
    private  String qanswer;/*答案*/
    private  String qdifficulty;/*难度*/

    private Set<Middle> middles = new HashSet<Middle>();//维护中间表

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public Subject getSuid() {
        return suid;
    }

    public void setSuid(Subject suid) {
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

    public Set<Middle> getMiddles() {
        return middles;
    }

    public void setMiddles(Set<Middle> middles) {
        this.middles = middles;
    }
}
