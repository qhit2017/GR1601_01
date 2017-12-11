package com.jinmengjie.bean;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class  Students implements Serializable {
    //学生表
    private  Integer sid ;    /*主键*/
    private  String snumber; /*学号*/
    private  String sname;  /*姓名*/
    private  String ssex;  /*性别*/
    private  String senter;  /*入学年份*/
    private  Classes cid;            /*班级外键*/
    private  String sbirthday;/*生日*/
    private  String sidnumber;/*身份证号*/
    private  String sprovince ;/*省份*/
    private  String smahor  ;/*专业简称*/
    private  String stel ;/*联系电话*/
    private  String sptel ;/*家长电话*/
    private  String sdormitory ;/*宿舍*/
    private  String spolitics  ;/*政治面貌*/
    private  String scity   ;/*城市*/
    private  String sattend  ;/*就读方向*/
    private  String saddress ;/*家庭住址*/
    private  String srelation ;/*监护人关系*/
    private  String sbasicinfo ;/*基本情况*/
    private  Integer sdnumber  ;/*宿舍号*/
    private  String seducation ;/*教育背景*/
    private  String sphoto     ;/*照片*/
    private  String spassword   ;/*登录密码*/
    private  Integer srole       ;/*角色*/

    private Set<Grade> grades = new HashSet<Grade>();//维护成绩表

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSnumber() {
        return snumber;
    }

    public void setSnumber(String snumber) {
        this.snumber = snumber;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSsex() {
        return ssex;
    }

    public void setSsex(String ssex) {
        this.ssex = ssex;
    }

    public String getSenter() {
        return senter;
    }

    public void setSenter(String senter) {
        this.senter = senter;
    }

    public Classes getCid() {
        return cid;
    }

    public void setCid(Classes cid) {
        this.cid = cid;
    }

    public String getSbirthday() {
        return sbirthday;
    }

    public void setSbirthday(String sbirthday) {
        this.sbirthday = sbirthday;
    }

    public String getSidnumber() {
        return sidnumber;
    }

    public void setSidnumber(String sidnumber) {
        this.sidnumber = sidnumber;
    }

    public String getSprovince() {
        return sprovince;
    }

    public void setSprovince(String sprovince) {
        this.sprovince = sprovince;
    }

    public String getSmahor() {
        return smahor;
    }

    public void setSmahor(String smahor) {
        this.smahor = smahor;
    }

    public String getStel() {
        return stel;
    }

    public void setStel(String stel) {
        this.stel = stel;
    }

    public String getSptel() {
        return sptel;
    }

    public void setSptel(String sptel) {
        this.sptel = sptel;
    }

    public String getSdormitory() {
        return sdormitory;
    }

    public void setSdormitory(String sdormitory) {
        this.sdormitory = sdormitory;
    }

    public String getSpolitics() {
        return spolitics;
    }

    public void setSpolitics(String spolitics) {
        this.spolitics = spolitics;
    }

    public String getScity() {
        return scity;
    }

    public void setScity(String scity) {
        this.scity = scity;
    }

    public String getSattend() {
        return sattend;
    }

    public void setSattend(String sattend) {
        this.sattend = sattend;
    }

    public String getSaddress() {
        return saddress;
    }

    public void setSaddress(String saddress) {
        this.saddress = saddress;
    }

    public String getSrelation() {
        return srelation;
    }

    public void setSrelation(String srelation) {
        this.srelation = srelation;
    }

    public String getSbasicinfo() {
        return sbasicinfo;
    }

    public void setSbasicinfo(String sbasicinfo) {
        this.sbasicinfo = sbasicinfo;
    }

    public Integer getSdnumber() {
        return sdnumber;
    }

    public void setSdnumber(Integer sdnumber) {
        this.sdnumber = sdnumber;
    }

    public String getSeducation() {
        return seducation;
    }

    public void setSeducation(String seducation) {
        this.seducation = seducation;
    }

    public String getSphoto() {
        return sphoto;
    }

    public void setSphoto(String sphoto) {
        this.sphoto = sphoto;
    }

    public String getSpassword() {
        return spassword;
    }

    public void setSpassword(String spassword) {
        this.spassword = spassword;
    }

    public Integer getSrole() {
        return srole;
    }

    public void setSrole(Integer srole) {
        this.srole = srole;
    }

    public Set<Grade> getGrades() {
        return grades;
    }

    public void setGrades(Set<Grade> grades) {
        this.grades = grades;
    }
}
