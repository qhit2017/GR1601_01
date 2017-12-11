package com.wangmengyuan.bean;

import java.io.Serializable;
import java.sql.Date;
import java.util.Set;

/**
 * Created by Administrator on 2017/11/23.
 */
public class Classes implements Serializable {
    private Integer cid;
    private String cnumber;
    private String cname;
    private String cdirection;
    private Integer tidl;
    private Integer tidh;
    private String cbegin;
    private Integer cg1;
    private Integer cg2;
    private Integer cg3;
    private Integer cstate;
    private String cremark;

    private Teachers teachersl;
    private Teachers teachersh;
    private Set<Students> studentsSet;

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

    public Integer getTidl() {
        return tidl;
    }

    public void setTidl(Integer tidl) {
        this.tidl = tidl;
    }

    public Integer getTidh() {
        return tidh;
    }

    public void setTidh(Integer tidh) {
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
}
