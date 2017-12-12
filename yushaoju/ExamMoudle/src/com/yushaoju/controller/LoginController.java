package com.yushaoju.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.yushaoju.bean.Teachers;
import com.yushaoju.service.TeachersService;
import com.yushaoju.service.impl.TeachersServiceImpl;

import java.util.List;

/**
 * Created by Svip on 2017/11/26.
 */
public class LoginController extends ActionSupport {
    private String name;
    private String pass;
    private String select;
    private TeachersService teachersService = new TeachersServiceImpl();
    public String teacher(){
        List<Teachers> teachersList = teachersService.insertLand(name,pass);
        //管理员
        if (select.equals("0")) {
            return "";
        }
        //教师
        else if (select.equals("1")) {

            if (teachersList == null || teachersList.size() == 0) {
                System.out.println(select);
                return "login";
            } else {
                System.out.println(select);
                return "homepage";
            }
        }
        //学生
        else if (select.equals("2")) {
            //管理员的查询
            if (teachersList == null || teachersList.size() == 0) {
                System.out.println(select);
                return "login";
            } else {
                System.out.println(select);
                return "addingstudents ";
            }
        }
        return "";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getSelect() {
        return select;
    }

    public void setSelect(String select) {
        this.select = select;
    }
}
