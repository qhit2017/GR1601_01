package com.jiang.bean;

import java.io.Serializable;
import java.util.Set;

/**
 * 笔试题题库表
 * Created by dell on 2017/11/23.
 */
public class Questionbank implements Serializable {
    private Integer qid;       /*主键*/
    private Students students; /*外键*/
    private String qchapter;   /*对应章节*/
    private Integer qtype;     /*类型*/
    private String qcontent;   /*题目内容*/
    private String qa;         /*选项a*/
    private String qb;         /*选项b*/
    private String qc;         /*选项c*/
    private String qd;         /*选项d*/
    private String qanswer;    /*答案*/
    private String qdifficulty;/*难度*/
    private Set<Testpaper> testpapers;

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
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

    public Set<Testpaper> getTestpapers() {
        return testpapers;
    }

    public void setTestpapers(Set<Testpaper> testpapers) {
        this.testpapers = testpapers;
    }
}
