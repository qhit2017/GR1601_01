package com.jinmengjie.bean;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class Classes implements Serializable {

    //班级表
    private  Integer cid;       /*班级id*/
    private  String cnumber;    /*班级代号*/
    private  String cname;      /*班级名称*/
    private  String cdirection; /*所属方向*/
    private  Teachers tidl;             /*讲师外键*/
    private  Teachers tidh;             /*班主任外键*/
    private  String cbegin;  /*开班日期*///入学年份
    private  Integer cg1;     /*G1开班人数*/
    private  Integer cg2;     /*G2开班人数*/
    private  Integer cg3 ;    /*G3开班人数*/
    private  Integer cstate;  /*状态*/
    private  String cremark ; /*备注*/

    private Set<Students> studentss = new HashSet<Students>();//维护学生表
	
	
	
	
	
	

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

    public Teachers getTidl() {
        return tidl;
    }

    public void setTidl(Teachers tidl) {
        this.tidl = tidl;
    }

    public Teachers getTidh() {
        return tidh;
    }

    public void setTidh(Teachers tidh) {
        this.tidh = tidh;
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

    public Set<Students> getStudentss() {
        return studentss;
    }

    public void setStudentss(Set<Students> studentss) {
        this.studentss = studentss;
    }
}
