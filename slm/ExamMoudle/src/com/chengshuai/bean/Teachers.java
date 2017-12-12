package com.chengshuai.bean;

import java.io.Serializable;
import java.util.Set;

/**
 * Created by 晏利花 on 2017/11/22.
 */
public class Teachers implements Serializable {
    /*教师id*/
    private Integer tid;
    /*编号*/
    private String tnumber;
    /*姓名*/
    private String tname;
    /*性别*/
    private String tsex;
    /*生日*/
    private String tbirthday;
    /*学历*/
    private String tphone;
    /*联系电话*/
    private String ttel;
    /*岗位*/
    private Integer tjob;
    /*登录密码*/
    private String tpassword;
    /*角色*/
    private Integer trole;
    /*备注*/
    private String tremark;

//===============================类关系==================================================
    //一个讲师多个班级
    private Set<Classes> classesSetl;
    //班主任多个班级
    private Set<Classes> classesSeth;

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTnumber() {
        return tnumber;
    }

    public void setTnumber(String tnumber) {
        this.tnumber = tnumber;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
        this.tsex = tsex;
    }

    public String getTbirthday() {
        return tbirthday;
    }

    public void setTbirthday(String tbirthday) {
        this.tbirthday = tbirthday;
    }

    public String getTphone() {
        return tphone;
    }

    public void setTphone(String tphone) {
        this.tphone = tphone;
    }

    public String getTtel() {
        return ttel;
    }

    public void setTtel(String ttel) {
        this.ttel = ttel;
    }

    public Integer getTjob() {
        return tjob;
    }

    public void setTjob(Integer tjob) {
        this.tjob = tjob;
    }

    public String getTpassword() {
        return tpassword;
    }

    public void setTpassword(String tpassword) {
        this.tpassword = tpassword;
    }

    public Integer getTrole() {
        return trole;
    }

    public void setTrole(Integer trole) {
        this.trole = trole;
    }

    public String getTremark() {
        return tremark;
    }

    public void setTremark(String tremark) {
        this.tremark = tremark;
    }

    public Set<Classes> getClassesSetl() {
        return classesSetl;
    }

    public void setClassesSetl(Set<Classes> classesSetl) {
        this.classesSetl = classesSetl;
    }

    public Set<Classes> getClassesSeth() {
        return classesSeth;
    }

    public void setClassesSeth(Set<Classes> classesSeth) {
        this.classesSeth = classesSeth;
    }

    @Override
    public String toString() {
        return "Teachers{" +
                "tid=" + tid +
                ", tnumber='" + tnumber + '\'' +
                ", tname='" + tname + '\'' +
                ", tsex='" + tsex + '\'' +
                ", tbirthday='" + tbirthday + '\'' +
                ", tphone='" + tphone + '\'' +
                ", ttel='" + ttel + '\'' +
                ", tjob=" + tjob +
                ", tpassword='" + tpassword + '\'' +
                ", trole=" + trole +
                ", tremark='" + tremark + '\'' +
                ", classesSetl=" + classesSetl +
                ", classesSeth=" + classesSeth +
                '}';
    }
}
