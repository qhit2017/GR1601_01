package com.chengshuai.controller;

import com.chengshuai.bean.users;
import com.chengshuai.service.LoginService;
import com.chengshuai.service.LoginServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

/**
 * Created by king on 12/5/2017.
 */
public class LoginController  extends ActionSupport {
    private String name ;
    private String password ;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


        public String login(){

            LoginService service = new LoginServiceImpl();
            List<users> list = service.SelectAllbyUnameAndUpassword(name,password);
        if (list.size() <= 0 || list == null) {
            return "error";
        } else {

            return "ok";
        }

    }

    }

