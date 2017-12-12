package com.zhangerhui.bean;

import java.io.Serializable;
import java.util.Set;

/**
 * Created by Administrator on 2017/11/23/023.
 */
public class Subject implements Serializable {

    /*科目id*/
    private Integer suid;
    /*方向*/
    private String sudirection;
    /*阶段*/
    private String sustage;
    /*科目*/
    private String sucourse;

    //=======================================类关系=====================================
    //一个科目对应很多试卷
    private Set<Testpaper> testpaperSet;
    //一个科目有多道题
    private Set<Questionbank> questionbankSet;

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

    public Set<Testpaper> getTestpaperSet() {
        return testpaperSet;
    }

    public void setTestpaperSet(Set<Testpaper> testpaperSet) {
        this.testpaperSet = testpaperSet;
    }

    public Set<Questionbank> getQuestionbankSet() {
        return questionbankSet;
    }

    public void setQuestionbankSet(Set<Questionbank> questionbankSet) {
        this.questionbankSet = questionbankSet;
    }
}
