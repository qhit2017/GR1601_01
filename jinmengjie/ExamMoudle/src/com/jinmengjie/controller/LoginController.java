package com.jinmengjie.controller;

import com.jinmengjie.bean.Students;
import com.jinmengjie.bean.Teachers;
import com.jinmengjie.service.StudentServiceDao;
import com.jinmengjie.service.TeachersServiceDao;
import com.jinmengjie.service.impl.StudentServiceDaoImpl;
import com.jinmengjie.service.impl.TeachersServiceDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.classic.Session;


import javax.servlet.http.HttpSession;


/**
 * Created by 金梦杰 on 2017/11/23/023.
 */

public class LoginController extends ActionSupport {
    //当implements ModelDriven时，就要生成getmodel（）方法，返回一个json字符串

    //传参数
    private String username;
    private String pwd;
    private String role;
      private  Students students = new Students();

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    //和struts2有关
    public String login() {
        String s = "";

        //先获取session
        HttpSession httpSession = ServletActionContext.getRequest().getSession();

        if ("0".equals(role)) {
            if ("admin".equals(username) && "1234".equals(pwd)) {
                s = "teachermanager";
            } else {
                s = "login";
            }
        } else if (role.equals("1")) {
            TeachersServiceDao teachersServiceDao = new TeachersServiceDaoImpl();
            //传参数
            boolean tea = teachersServiceDao.selectteachers(username, pwd);
            if (tea == true) {
                s = "teachermanager";
            } else {

                //httpSession.setAttribute("role",role);

                s = "login";
            }

        } else if (role.equals("2")) {

            StudentServiceDao studentServiceDao = new StudentServiceDaoImpl();
            //因为在dao是基于整个类去查询的，所以要先new个类出来，再放对象进去
            Students st = studentServiceDao.selectstudents(students);
            if (st == null){
                s = "studentmanage";


            }
            else {
                s = "login";


            }






        }
        return s;

    }


}

