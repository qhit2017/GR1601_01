package com.cj.Bean;

import java.io.Serializable;

/**
 * Created by cj on 2017/11/23.
 */
public class Middle implements Serializable {
    private  Integer mid;
    private  Questionbank questionbank;
    private Teachers teachers;

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Questionbank getQuestionbank() {
        return questionbank;
    }

    public void setQuestionbank(Questionbank questionbank) {
        this.questionbank = questionbank;
    }

    public Teachers getTeachers() {
        return teachers;
    }

    public void setTeachers(Teachers teachers) {
        this.teachers = teachers;
    }
}
