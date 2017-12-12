package com.wangdoudou.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.wangdoudou.bean.Students;
import com.wangdoudou.bean.Teachers;
import com.wangdoudou.service.LoginService;
import com.wangdoudou.service.LoginServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 王豆豆 on 2017/11/23.
 */
public class LoginController extends ActionSupport {
    //用户名
private String name;
//密码
private String password;
//角色
private String role;
//登陆
private String login;

public   LoginService loginService=new LoginServiceImpl();
    public JSONObject jsonObject = new JSONObject();
    private JSONArray jsonArray = new JSONArray();

    public String texts(){
      /*  System.out.println("texts");
        System.out.println(name);
        System.out.println(password);
        System.out.println(role);*/
        HttpSession session= ServletActionContext.getRequest().getSession();
        if(role.equals("0")){
            if(name=="admin"&& password=="admin"){
                jsonObject.put("info","1");
            }else {
                jsonObject.put("info","0");
            }
        }
        else if(role.equals("1")){
            Integer trole = Integer.valueOf(role);
            Teachers teachers = new Teachers();
            teachers.setTname(name);
            teachers.setTpassword(password);
            teachers.setTrole(trole);

            List<Teachers>teachersList=loginService.selectByUsers(name,password);
            if (teachersList==null||teachersList.size()==0){
                jsonObject.put("info", "0");
            } else {
                jsonObject.put("info", "1");
                Teachers teachers1=teachersList.get(0);
                session.setAttribute("loginuser",teachers);
            }

        }
        else if (role.equals("2")){
            Integer srole = Integer.valueOf(role);
                   Students students = new Students();
                    students.setSname(name);
                    students.setSpassword(password);
                    students.setSrole(srole);
            List<Students>studentsList=loginService.selectBy(name,password);
            for (Students s:studentsList){
                System.out.println(s.getSname());
            }

            if (studentsList==null||studentsList.size()==0){
                jsonObject.put("info", "0");
            }else {
                jsonObject.put("info", "1");
               /* Students students1=studentsList.get(0);
                session.setAttribute("loginuser",students);*/
            }

        }
        login= jsonObject.toString();
        return "success";
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

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }
}
