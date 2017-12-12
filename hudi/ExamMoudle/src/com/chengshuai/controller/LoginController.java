package com.chengshuai.controller;

import com.chengshuai.bean.Students;
import com.chengshuai.bean.Teachers;
import com.chengshuai.service.LoginService;
import com.chengshuai.service.LoginServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import sun.net.httpserver.HttpsServerImpl;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/11/24.
 */
public class LoginController extends ActionSupport{

    private String username;
    private String pwd;
    private String role;

    private LoginService loginService =new LoginServiceImpl();

    public String login(){
        HttpSession session  = ServletActionContext.getRequest().getSession();


        if(role.equals("0")){

            //调用sesssion 管理员

            return "success";
        }
        else if(role.equals("1")){
           List<Teachers> teacherslist = loginService.loginTeacher(username,pwd);
           if(teacherslist ==null || teacherslist.size()==0){
               return "fail";
           }
           else{
               //调用sesssion teacher

               Teachers teachers = teacherslist.get(0);
               session.setAttribute("loginuser",teachers);
               return "success";
           }
        }
        else if(role.equals("2")){
            List<Students> studentsList = loginService.loginStudent(username,pwd);
            if(studentsList == null || studentsList.size()==0){
                return "fail";
            }
            else{
                //调用sesssion students
                Students students = studentsList.get(0);
                session.setAttribute("loginuser",students);
                return "success";
            }
        }
        return "";
    }

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
}
