package com.jiang.controller;
import com.jiang.bean.Students;
import com.jiang.bean.Teachers;
import com.jiang.service.*;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 登录控制器
 * Created by dell on 2017/11/23.
 */
public class LoginController extends ActionSupport {
    /*登录变量*/
    private String username;
    private String pwd;
    private String role;
    /*连接的服务*/
    private TeachersService teachersService = new TeachersServiceImpl();
    private StudentsService studentsService = new StudentsServiceImpl();
    /*自定义登录方法*/
    public String login() {
        /*获取session*/
        /*HttpSession session = ServletActionContext.*/

        if (role.equals("0") && (username.equals("admin") && (pwd.equals("1234")))) {
            return "students";
        } else if (role.equals("1")){
         List<Teachers> list = teachersService.selectTeachersInfoByTnameAndTpassword(username,pwd);
          if (list==null || list.size()<=0){
              return "login";
          }else {
            return "teachers";
          }
        }else if (role.equals("2")){
           List<Students> list = studentsService.selectStudentsInfoBySnameAndSpassword(username,pwd);
           if(list==null || list.size()<=0){
               return "login";
           }else {
               return "students";
           }
        }
       return "login";
    }


    public TeachersService getTeachersService() {
        return teachersService;
    }

    public void setTeachersService(TeachersService teachersService) {
        this.teachersService = teachersService;
    }

    public StudentsService getStudentsService() {
        return studentsService;
    }

    public void setStudentsService(StudentsService studentsService) {
        this.studentsService = studentsService;
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
