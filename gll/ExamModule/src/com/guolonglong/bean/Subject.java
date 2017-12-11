package com.guolonglong.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by lenovo on 2017/11/23.
 */
public class Subject implements Serializable {
    private Integer suid;
    private String sudirection;
    private String sustage;
    private String sucourse;
    private Set<QuestionBank> questionBankSet=new HashSet<QuestionBank>();

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

    public Set<QuestionBank> getQuestionBankSet() {
        return questionBankSet;
    }

    public void setQuestionBankSet(Set<QuestionBank> questionBankSet) {
        this.questionBankSet = questionBankSet;
    }
}
