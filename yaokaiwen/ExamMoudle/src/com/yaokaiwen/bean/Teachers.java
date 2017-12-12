package com.yaokaiwen.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Teachers implements Serializable {
    //教师表
    private  Integer tid ;/*主键*/
    private  String  tnumber ;/*编号*/
    private  String tname;/*姓名*/
    private  String  tsex ;/*性别*/
    private  String tbirthday;/*生日*/
    private  String teducation;/*学历*/
    private  String ttel ;/*联系电话*/
    private  Integer tjob;/*岗位*/
    private  String tpassword;/*登录密码*/
    private  Integer trole ;/*角色*/
    private  String  tremark ;/*备注*/

    private  Set<Classes> classess = new HashSet<Classes>();//维护班级表

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

    public String getTeducation() {
        return teducation;
    }

    public void setTeducation(String teducation) {
        this.teducation = teducation;
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

    public Set<Classes> getClassess() {
        return classess;
    }

    public void setClassess(Set<Classes> classess) {
        this.classess = classess;
    }
}
