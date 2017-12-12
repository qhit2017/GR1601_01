package com.jiang.bean;

import java.io.Serializable;

/**
 * 中间表
 * Created by dell on 2017/11/23.
 */
public class Middle implements Serializable {
    private Integer mid;
    private Questionbank questionbank;
    private Testpaper testpaper;

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

    public Testpaper getTestpaper() {
        return testpaper;
    }

    public void setTestpaper(Testpaper testpaper) {
        this.testpaper = testpaper;
    }
}
