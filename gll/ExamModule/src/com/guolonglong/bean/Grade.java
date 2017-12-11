package com.guolonglong.bean;

import java.io.Serializable;
import java.sql.Date;

/**
 * Created by lenovo on 2017/11/23.
 */
public class Grade implements Serializable {
    private Integer gid;
    private Integer gscore;
    private String ganswer;
    private String gendtime;

    private Students students;
    private TestPaper testPaper;

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

    public String getGendtime() {
        return gendtime;
    }

    public void setGendtime(String gendtime) {
        this.gendtime = gendtime;
    }

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
    }

    public TestPaper getTestPaper() {
        return testPaper;
    }

    public void setTestPaper(TestPaper testPaper) {
        this.testPaper = testPaper;
    }
}
