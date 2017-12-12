package com.chengshuai.controller;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/12/1.
 */
public class TestController extends ActionSupport {

    private String name;
    private String resultName =new String();


    public String test(){

        System.out.println(name);

        //session
        HttpSession session = ServletActionContext.getRequest().getSession();
        session.setAttribute("sessionvalue",name);
        //值栈
        resultName = name;


        //json

        return "result";
    }

    public String getResultName() {
        return resultName;
    }

    public void setResultName(String resultName) {
        this.resultName = resultName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
