package com.guolonglong.controller;

import com.guolonglong.bean.Students;
import com.guolonglong.bean.Teachers;
import com.guolonglong.service.LoginService;
import com.guolonglong.service.impl.LoginServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by lenovo on 2017/11/23.
 */
public class LoginController extends ActionSupport {
    private String name;
    private String password;
    private String role;


    private LoginService loginService = new LoginServiceImpl();

    public String login(){
        //取Session
        HttpSession session = ServletActionContext.getRequest().getSession();

        if (role.equals("0")&&(name.equals("tom"))&&(password.equals("123"))){
            return "main";
        }
        else if (role.equals("1")){

            List<Teachers> teachersList=loginService.selectTeachers(name,password);

            if (teachersList.size()!=0 && teachersList!=null){
                Teachers teachers = teachersList.get(0);
                /*ActionContext.getContext().getSession().put("teachers","teachers");*/
                session.setAttribute("loginuser",teachers);

                return "teachers";
            }
            else {
                return "login";
            }
        }
        else if (role.equals("2")){
            Students students = new Students();
            students.setSname(name);
            students.setSpassword(password);
            List<Students> studentsList=loginService.selectStudents(students);

            if (studentsList!=null || studentsList.size()!=0){

                return "students";
            }
            else {
                return "login";
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

    /*  public String studentsLogin(){


        *//*JSONObject object = new JSONObject();
        if (result==true){
            object.put("info","0");
            return "students";
        }
        else {
            object.put("info","1");
            return "login";
        }*//*
    }*/

}
