package com.jiang.bean;

import java.io.Serializable;

/**
 * 教师表
 * Created by dell on 2017/11/23.
 */
public class Teachers implements Serializable {
    private Integer tid;          /*主键*/
    private String tnumber;       /*编号*/
    private String tname;         /*姓名*/
    private String tsex;          /*性别*/
    private String tbirthday;     /*生日*/
    private String tphone;        /*联系电话*/
    private String ttel;          /*学历*/
    private Integer tjob;         /*岗位*/
    private String tpassword;     /*密码*/
    private Integer trole;        /*角色*/
    private String tremark;       /*备注*/

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
}
