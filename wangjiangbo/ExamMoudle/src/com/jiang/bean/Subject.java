package com.jiang.bean;

import java.io.Serializable;

/**
 * 科目表
 * Created by dell on 2017/11/23.
 */
public class Subject implements Serializable {
    private Integer suid;         /*主键*/
    private String sudirection;   /*方向*/
    private String sustage;       /*阶段*/
    private String sucourse;      /*科目*/

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
}
