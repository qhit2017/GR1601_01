package com.chengshuai.controller;

import com.chengshuai.bean.Students;
import com.chengshuai.bean.Teachers;
import com.chengshuai.service.Studentsservice;
import com.chengshuai.service.Teachersservice;
import com.chengshuai.service.impl.Studentsserviceimpl;
import com.chengshuai.service.impl.Teachersserviceimpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by slm on 2017/11/23.
 */
public class loginController extends ActionSupport {

    private String name;
    private String password;
    private String js;
    private String loginlo;
    private Teachersservice teachersservice = new Teachersserviceimpl();
    private Studentsservice studentsservice = new Studentsserviceimpl();
    public JSONObject jsonObject = new JSONObject();
    public JSONArray jsonArray = new JSONArray();


    public String text() {
        System.out.println(js);
        /*判断一下界面传过来的角色值*/
        /*如果角色值为0  */
        if (js.equals("0")) {
               /*判断一下用户名密码是否是指定账号  如果是返回1不是就是登录失败 返回0*/
            if (name == "admin" && password == "admin") {
                jsonObject.put("info", "1");
            } else {
                jsonObject.put("info", "0");
            }
        }

        if (js.equals("1")) {
                /*如果角色值为1 */

            Integer trole = Integer.valueOf(js);
            Teachers teachers = new Teachers();
            teachers.setTname(name);
            teachers.setTpassword(password);
            teachers.setTrole(trole);
        /*调用数据库 查询教师表中的数据  判断返回结果*/
            List<Teachers> teachersList = teachersservice.selectByTnameandTpwd(teachers);

            if (teachersList == null || teachersList.size() == 0) {
                jsonObject.put("info", "0");
            } else {
                jsonObject.put("info", "1");
            }
        }
        if (js.equals("2")) {
       /*如果角色值为2 */
            Integer srole = Integer.valueOf(js);
            Students students = new Students();
            students.setSname(name);
            students.setSpassword(password);
            students.setSrole(srole);
         /*调用数据库 查询学生表表中的数据  判断返回结果*/
            List<Students> studentsList = studentsservice.selectBysnameAndpwd(students);
            for (Students s : studentsList) {
                System.out.println(s.getSname());
            }
            if (studentsList == null || studentsList.size() == 0) {
                jsonObject.put("info", "0");
            } else {
                jsonObject.put("info", "1");
            }
        /*获取session*/
            HttpSession session = ServletActionContext.getRequest().getSession();

            Students students1 = studentsList.get(0);

            session.setAttribute("students1", students1);//定义一个session
        }
        loginlo = jsonObject.toString();


        return "allre";
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

    public String getJs() {
        return js;
    }

    public void setJs(String js) {
        this.js = js;
    }

    public String getLoginlo() {
        return loginlo;
    }

    public void setLoginlo(String loginlo) {
        this.loginlo = loginlo;
    }
}
