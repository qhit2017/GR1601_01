package com.zhanglong.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zhanglong.bean.Students;
import com.zhanglong.bean.Teachers;
import com.zhanglong.service.LoginService;

import com.zhanglong.service.impl.LoginServiceImpl;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/11/23 0023.
 */
public class LoginController extends ActionSupport {
    private String name;
    private String password;
    private String role;
    public JSONObject jsonObject=new JSONObject();

    HttpSession session= ServletActionContext.getRequest().getSession();

    public String teacherstudent(){
        LoginService service =new LoginServiceImpl();
        String s1 = "";
        if (role.equals("1")){
           List<Teachers> teacherlist=service.selectBytnameandtpassword(name,password);
           if (teacherlist.size()==0||teacherlist==null){
               s1 ="role";

        }
           else {
               s1 ="teacher";
               session.setAttribute("name",name);
               session.setAttribute("password",password);
           }
        }
        else if (role.equals("2")){
            List<Students> studentsList=service.selectBysnameandspassword(name,password);
            if (studentsList.size()==0||studentsList==null) {
                s1 ="role";
            }
            else {
                s1 ="student";
                session.setAttribute("name",name);
                session.setAttribute("password",password);
            }
        }
        else if(role.equals("0")&&(name.equals("admin"))&&(password.equals("1234"))){
            s1 ="teacher";
        }
        return s1;

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

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }
}
