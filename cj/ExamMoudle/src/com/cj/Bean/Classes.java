package com.cj.Bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by cj on 2017/11/23.
 */
public class Classes implements Serializable {
 private Integer cid;
 // 班级代号
 private String cnumber;
 private String cname;
 // 所属方向
 private  String  cdirection;
    //开班日期
 private Date cbegin ;
 private Integer cg1;
 private Integer cg2;
 private Integer cg3;
 //状态（启动0 禁用1）
 private Integer cstate;
 private  String  cremark;
//一个班级一个班主任
    private Teachers teachersl ;
//一个班级一个讲师
private Teachers teachersh ;



    public void setTeachersl(Teachers teachersl) {
        this.teachersl = teachersl;
    }

    public Teachers getTeachersl() {
        return teachersl;
    }

    public Teachers getTeachersh() {
        return teachersh;
    }

    public void setTeachersh(Teachers teachersh) {
        this.teachersh = teachersh;
    }

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


    public Date getCbegin() {
        return cbegin;
    }

    public void setCbegin(Date cbegin) {
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
}
