package com.chengshuai.bean;

import java.io.Serializable;

/**
 * Created by king on 12/5/2017.
 */
public class users  implements Serializable {
    private   Integer uid ;
    private   String uname ;
    private   String upassword ;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }
}
