package com.cj.Controller;

import com.cj.Bean.Students;
import com.cj.Bean.Teachers;
import com.cj.Service.StudentsSerciceImpl;
import com.cj.Service.StudentsService;

import com.cj.Service.TeachersService;
import com.cj.Service.TeachersServiceImpl;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;


import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by cj on 2017/11/23.
 */
public class Logincontroller extends ActionSupport {
    TeachersService teachersservice = new TeachersServiceImpl();
    StudentsService studentservice = new StudentsSerciceImpl();
    private String name;
    private String password;
    private String select;
HttpSession session= ServletActionContext.getRequest().getSession();


//登陆
    public String logininfo() {

        if (select.equals("0")) {
            if (select.equals("0") && name.equals("gl") && password.equals("999")) {

                    return "teacher";

            }
        } else if (select.equals("1")) {
            List<Teachers> teacherslist = teachersservice.selectTeacher(name,password);
            //老师
            if (teacherslist == null || teacherslist.size() == 0) {

                return "login";
            }
            else {
                session.setAttribute("teacher",teacherslist);
                return "teacher";
            }
        } else if (select.equals("2")) {
            //学生
            List<Students> studentsList = studentservice.selectStudents(name,password);
            for (Students students : studentsList) {
                System.out.println("controller" + students.getSname());
            }
            if (studentsList == null || studentsList.size() == 0) {
                return "login";
            } else {
               session.setAttribute("student",studentsList);
                return "student";

            }
        }

            return "login";

    }



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

    public String getSelect() {
        return select;
    }

    public void setSelect(String select) {
        this.select = select;
    }


    public TeachersService getTeachersservice() {
        return teachersservice;
    }

    public void setTeachersservice(TeachersService teachersservice) {
        this.teachersservice = teachersservice;
    }

    public StudentsService getStudentservice() {
        return studentservice;
    }

    public void setStudentservice(StudentsService studentservice) {
        this.studentservice = studentservice;
    }



}
