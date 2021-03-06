package com.yanlihua.bean;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Set;

/**
 * Created by 晏利花 on 2017/11/22.
 */
public class Classes implements Serializable{
    /*班级id*/
    private Integer cid;
    /*班级代号*/
    private String cnumber;
    /*班级名称*/
    private String cname;
    /*所属方向*/
    private String cdirection;
    /*开班日期*/
    private String cbegin;
    /*G1开班人数*/
    private Integer cg1;
    /*G2开班人数*/
    private Integer cg2;
    /*G3开班人数*/
    private Integer cg3;
    /*状态*/
    private Integer cstate;
    /*备注*/
    private String cremark;

// =================================外键关系==============================
   /* 讲师外键
    private Integer tidl;*/
    //一个班级一个讲师
    private Teachers teachersl;
    /*班主任外键
    private Integer tidh;*/
    //一个班级一个班主任
    private Teachers teachersh;
//======================================类关系===================================
    //一个班级中有多个学生
    private Set<Students> studentsSet;


    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCnumber() {
        return cnumber;
    }

    public void setCnumber(String cnumber) {
        this.cnumber = cnumber;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCdirection() {
        return cdirection;
    }

    public void setCdirection(String cdirection) {
        this.cdirection = cdirection;
    }

    public String getCbegin() {
        return cbegin;
    }

    public void setCbegin(String cbegin) {
        this.cbegin = cbegin;
    }

    public Integer getCg1() {
        return cg1;
    }

    public void setCg1(Integer cg1) {
        this.cg1 = cg1;
    }

    public Integer getCg2() {
        return cg2;
    }

    public void setCg2(Integer cg2) {
        this.cg2 = cg2;
    }

    public Integer getCg3() {
        return cg3;
    }

    public void setCg3(Integer cg3) {
        this.cg3 = cg3;
    }

    public Integer getCstate() {
        return cstate;
    }

    public void setCstate(Integer cstate) {
        this.cstate = cstate;
    }

    public String getCremark() {
        return cremark;
    }

    public void setCremark(String cremark) {
        this.cremark = cremark;
    }

    public Teachers getTeachersl() {
        return teachersl;
    }

    public void setTeachersl(Teachers teachersl) {
        this.teachersl = teachersl;
    }

    public Teachers getTeachersh() {
        return teachersh;
    }

    public void setTeachersh(Teachers teachersh) {
        this.teachersh = teachersh;
    }

    public Set<Students> getStudentsSet() {
        return studentsSet;
    }

    public void setStudentsSet(Set<Students> studentsSet) {
        this.studentsSet = studentsSet;
    }
}
