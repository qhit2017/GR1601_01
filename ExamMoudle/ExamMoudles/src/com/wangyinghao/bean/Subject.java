package com.wangyinghao.bean;

import java.io.Serializable;

/**
 * Created by 王英豪 on 2017/11/23.
 */
public class Subject implements Serializable {
    private Integer suid;
    private  String sudirection;
    private  String sustage;
    private  String sucourse;

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
