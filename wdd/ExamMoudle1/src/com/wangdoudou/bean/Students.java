package com.wangdoudou.bean;

import java.io.Serializable;
import java.util.Set;

/**
 * Created by 王豆豆 on 2017/11/23.
 */
public class Students implements Serializable {
    private Integer sid;
    private String snumber;
    private String sname;
    private String ssex;
    private Double senter;
    //private Integer cid;
    private Double sbirthday;
    private String sidnumber;
    private String sprovince;
    private String smahor;
    private String stel;
    private String sdormitory;
    private String spolitics;
    private String scity;
    private String sattend;
    private String saddress;
    private String srelation;
    private String sbasicinfo;
    private Integer sdnumber;
    private String seducation;
    private String sphoto;
    private String spassword;
    private Integer srole;
    //一个学生属于一个班级
    private Classes classes;
    //一个学生有多个成绩
     private Set<Grade> gradeSet;




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

    public Double getSenter() {
        return senter;
    }

    public void setSenter(Double senter) {
        this.senter = senter;
    }



    public Double getSbirthday() {
        return sbirthday;
    }

    public void setSbirthday(Double sbirthday) {
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

    public Classes getClasses() {
        return classes;
    }

    public void setClasses(Classes classes) {
        this.classes = classes;
    }

    public Set<Grade> getGradeSet() {
        return gradeSet;
    }

    public void setGradeSet(Set<Grade> gradeSet) {
        this.gradeSet = gradeSet;
    }
}
