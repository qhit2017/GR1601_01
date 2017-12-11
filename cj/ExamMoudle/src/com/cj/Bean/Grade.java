package com.cj.Bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by cj on 2017/11/23.
 */
public class Grade implements Serializable {
    private Integer gid;
    private Integer gscore;
    private  String  ganswer;
    private Date gendtime;
    private Students students;
    private Teachers teachers;


    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
    }

    public Teachers getTeachers() {
        return teachers;
    }

    public void setTeachers(Teachers teachers) {
        this.teachers = teachers;
    }

    public Date getGendtime() {
        return gendtime;
    }

    public void setGendtime(Date gendtime) {
        this.gendtime = gendtime;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getGscore() {
        return gscore;
    }

    public void setGscore(Integer gscore) {
        this.gscore = gscore;
    }

    public String getGanswer() {
        return ganswer;
    }

    public void setGanswer(String ganswer) {
        this.ganswer = ganswer;
    }


}
