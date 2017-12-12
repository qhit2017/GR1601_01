package com.zhangerhui.controller;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.annotations.SourceType;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/12/3/003.
 */
public class TestController extends ActionSupport {

    private String name;
    private String resultName = new String();


    public  String  test(){

        System.out.println(name);

        HttpSession session = ServletActionContext.getRequest().getSession();
        session.setAttribute("sessionvalue",name);

        resultName = name;


        return "";

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getResultName() {
        return resultName;
    }

    public void setResultName(String resultName) {
        this.resultName = resultName;
    }
}
