package com.yaokaiwen.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;


public class Subject implements Serializable {
    //科目表
    private Integer suid  ;	/*主键*/
    private String sudirection ;/*方向*/
    private String  sustage    ;/*阶段*/
    private String sucourse   ;/*科目*/

    private Set<Questionbank> questionbankSet = new HashSet<Questionbank>();//维护题目表
    private Set<Testpaper> testpaperSet = new HashSet<Testpaper>();//维护试卷表

    public Integer getSuid() {
        return suid;
    }

    public void setSuid(Integer suid) {
        this.suid = suid;
    }

    public String getSudirection() {
        return sudirection;
    }

    public void setSudirection(String sudirection) {
        this.sudirection = sudirection;
    }

    public String getSustage() {
        return sustage;
    }

    public void setSustage(String sustage) {
        this.sustage = sustage;
    }

    public String getSucourse() {
        return sucourse;
    }

    public void setSucourse(String sucourse) {
        this.sucourse = sucourse;
    }

    public Set<Questionbank> getQuestionbankSet() {
        return questionbankSet;
    }

    public void setQuestionbankSet(Set<Questionbank> questionbankSet) {
        this.questionbankSet = questionbankSet;
    }

    public Set<Testpaper> getTestpaperSet() {
        return testpaperSet;
    }

    public void setTestpaperSet(Set<Testpaper> testpaperSet) {
        this.testpaperSet = testpaperSet;
    }
}
