package com.zhangerhui.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zhangerhui.bean.Students;
import com.zhangerhui.bean.Teachers;
import com.zhangerhui.service.StudentService;
import com.zhangerhui.service.TeacherService;
import com.zhangerhui.service.impl.StudentServiceImpl;
import com.zhangerhui.service.impl.TeacherServiceImpl;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/11/23/023.
 */
public class LoginController extends ActionSupport {

    private String username;
    private String password;
    private String role;

    public String login() {

        TeacherService teacherService = new TeacherServiceImpl();
        StudentService studentService = new StudentServiceImpl();
        //ActionContext ac = ActionContext.getContext();
        HttpSession session = ServletActionContext.getRequest().getSession();
        if (role.equals("1")) {
            List<Teachers> teachersList = teacherService.selectTeachersBytnameAndtpassword(username, password);
            if (teachersList.size() <= 0 || teachersList == null) {
                return "index";
            } else {
                session.setAttribute("username", username);
                //session.setAttribute("role", role);
                return "teacher";
            }
        } else if (role.equals("2")) {
            List<Students> studentsList = studentService.selectStudentsBysnameAndspassword(username, password);
            if (studentsList.size() <= 0 || studentService == null) {
                return "index";
            } else {
                session.setAttribute("username", username);
                //session.setAttribute("role", role);
                return "student";
            }
        } else if ((role.equals("0") && (username.equals("admin")) && (password.equals("123456")))) {
            //session.setAttribute("username", username);
            return "teacher";
        }
        return "index";
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}

