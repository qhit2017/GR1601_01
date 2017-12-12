package com.yanlihua.controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.yanlihua.bean.Students;
import com.yanlihua.bean.Teachers;
import com.yanlihua.service.LoginService;
import com.yanlihua.service.impl.LoginServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.StrutsStatics;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by 晏利花 on 2017/11/23.
 */
public class LoginController extends ActionSupport {
    private String name;
    private String password;
    private String role;
    private String loginwayresult;
    private Boolean tret;
    public JSONObject jsonObject = new JSONObject();
    public List<Teachers> teachersList;
    public List<Students> studentsList;

    public String loginway() {
        //数据存储空间
        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
        HttpSession httpSession = request.getSession();

        System.out.println("loginway" + name + " " + password + " " + role);
        LoginService loginService = new LoginServiceImpl();
        if (role.equals("1")) {
            teachersList = loginService.selectTeachersLoginInfoBynamepwdroleLoginService(name, password);

            if (teachersList == null || teachersList.size() == 0) {
                tret = false;
            } else {
                //调用session  存一个信息
                for (Teachers teachers : teachersList) {
                    String name = teachers.getTname();
                    httpSession.setAttribute("name", name);
                }
                Teachers teachers=teachersList.get(0);
                httpSession.setAttribute("teachers", teachers);
                tret = true;
            }
        } else if (role.equals("2")) {
            studentsList = loginService.selectStudentsLoginInfoBynamepwdroleLoginService(name, password);
            if (studentsList == null || studentsList.size() == 0) {
                tret = false;
            } else {
                //调用session  存一个信息
                for (Students students : studentsList) {
                    String name = students.getSname();
                    httpSession.setAttribute("name", name);
                }
                Students students=studentsList.get(0);
                httpSession.setAttribute("students", students);
                tret = true;
            }
        } else {
            if (name.equals("tom") && password.equals("123456")&&role.equals("0")) {
                //if (name.equals("tom")&&password.equals("123456")&&role.equals("0")){
                httpSession.setAttribute("name", "tom");
                tret = true;
            } else {
                tret = false;
            }
        }

        if (tret == true) {

            jsonObject.put("info", "true");
        } else {
            jsonObject.put("info", "false");
        }
        loginwayresult = jsonObject.toString();
        return "allresult";

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

    public String getLoginwayresult() {
        return loginwayresult;
    }

    public void setLoginwayresult(String loginwayresult) {
        this.loginwayresult = loginwayresult;
    }

    public Boolean getTret() {
        return tret;
    }

    public void setTret(Boolean tret) {
        this.tret = tret;
    }

    public List<Teachers> getTeachersList() {
        return teachersList;
    }

    public void setTeachersList(List<Teachers> teachersList) {
        this.teachersList = teachersList;
    }

    public List<Students> getStudentsList() {
        return studentsList;
    }

    public void setStudentsList(List<Students> studentsList) {
        this.studentsList = studentsList;
    }


}
