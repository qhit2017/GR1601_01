package com.yaokaiwen.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yaokaiwen.bean.Students;
import com.yaokaiwen.bean.Teachers;
import com.yaokaiwen.service.LoginService;

import com.yaokaiwen.service.TeachersService;
import com.yaokaiwen.service.impl.LoginServiceImpl;

import com.yaokaiwen.service.impl.TeachersServiceImpl;
import com.yaokaiwen.util.Page;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by DELL on 2017/11/24.
 */
public class LoginController extends ActionSupport{
    private String name;
    private String password;
    private String rola;
    private LoginService loginService = new LoginServiceImpl();
    private JSONArray jsonArray;
    private JSONObject jsonObject;
    private String jsonstring;
    private String jsonpage;
    private Integer pageindex;
    private List<Teachers> teachersList = loginService.selectTeachersAllService();
    private HttpSession httpSession = ServletActionContext.getRequest().getSession();
    private Page p = new Page();
    //登录查询
    public String login(){
        String return1 = "";
       switch (rola){
           case "0":
               if(name.equals("admin")&&password.equals("666666")){
                   return1 = "index";
                   httpSession.setAttribute("name",name);
                   httpSession.setAttribute("rola",rola);
               }else {
                   return1 = "login";
               }
                break;
           case "1":
               Teachers teachers = new Teachers();
               teachers.setTname(name);
               teachers.setTpassword(password);
               teachers.setTnumber(name);
               Boolean stbs = loginService.selectTeachersByNameandpasswordService(teachers);
               if(stbs==true){
                   return1 = "teacherlist";
                   httpSession.setAttribute("name",name);
                   httpSession.setAttribute("rola",rola);
               }else {
                   return1 = "login";
               }
               break;
          default:
              Students students = new Students();
              students.setSname(name);
              students.setSnumber(name);
              students.setSpassword(password);
              Boolean ss =  loginService.selectStudentsByNameandpasswordService(students);
              if(ss==true){
                  return1 = "onlinetest";
                  httpSession.setAttribute("name",name);
                  httpSession.setAttribute("rola",rola);
              }else {
                  return1 = "login";
              }
            }
        return return1;
    }
    //显示所有教师信息
    public String teachersinfo(){
        if(teachersList.size()>0&&teachersList!=null){
            Integer totalCount = teachersList.size();
            if(pageindex==null){
                pageindex = 1;
            }
            p.page(totalCount,10,pageindex);
            ArrayList<Teachers> list = new ArrayList<Teachers>();
            for(int i=p.getDataStart()-1;i<p.getDataEnd();i++){
                Teachers t = teachersList.get(i);
                list.add(t);
            }
            jsonArray = JSONArray.fromObject(list);
        }
        httpSession.setAttribute("page",p);
        jsonstring = jsonArray.toString();
        return "jsonstring";
    }

    public String selectclassesallinfo() {
        p = (Page) httpSession.getAttribute("page");
        jsonpage = JSONObject.fromObject(p).toString();
        return "jsonpage";
    }

    /*public String syyteachers(){

        pageindex = pageindex-1;
        p.page(totalCount,10,pageindex);
        httpSession.setAttribute("pageindex",pageindex);
        httpSession.setAttribute("pagecount",p.getPageCount());
        httpSession.setAttribute("uppage",p.getUppage());
        httpSession.setAttribute("nextpage",p.getNextpage());
        ArrayList<Teachers> list = new ArrayList<Teachers>();
        for(int i=p.getDataStart()-1;i<p.getDataEnd();i++){
            Teachers t = teachersList.get(i);
            list.add(t);
        }
        jsonArray = JSONArray.fromObject(list);
        jsonstring = jsonArray.toString();
        System.out.println(jsonstring);
        return "jsonstring";
    }*/

    /*public String xyyteachers(){
        pageindex = pageindex+1;
        p.page(totalCount,10,pageindex);
        httpSession.setAttribute("pageindex",pageindex);
        httpSession.setAttribute("pagecount",p.getPageCount());
        httpSession.setAttribute("uppage",p.getUppage());
        httpSession.setAttribute("nextpage",p.getNextpage());
        ArrayList<Teachers> list = new ArrayList<Teachers>();
        for(int i=p.getDataStart()-1;i<p.getDataEnd();i++){
            Teachers t = teachersList.get(i);
            list.add(t);
        }
        jsonArray = JSONArray.fromObject(list);
        jsonstring = jsonArray.toString();
        System.out.println(jsonstring);
        return "jsonstring";
    }*/
    public String getJsonstring() {
        return jsonstring;
    }

    public void setJsonstring(String jsonstring) {
        this.jsonstring = jsonstring;
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

    public String getRola() {
        return rola;
    }

    public void setRola(String rola) {
        this.rola = rola;
    }

    public Integer getPageindex() {
        return pageindex;
    }

    public void setPageindex(Integer pageindex) {
        this.pageindex = pageindex;
    }

    public LoginService getLoginService() {
        return loginService;
    }

    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    public String getJsonpage() {
        return jsonpage;
    }

    public void setJsonpage(String jsonpage) {
        this.jsonpage = jsonpage;
    }


    public Page getP() {
        return p;
    }

    public void setP(Page p) {
        this.p = p;
    }
}

