package com.yaokaiwen.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yaokaiwen.bean.Teachers;
import com.yaokaiwen.service.LoginService;
import com.yaokaiwen.service.TeachersService;
import com.yaokaiwen.service.impl.LoginServiceImpl;
import com.yaokaiwen.service.impl.TeachersServiceImpl;
import com.yaokaiwen.util.Page;
import com.yaokaiwen.util.Tnumber;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by DELL on 2017/11/26.
 */
public class TeachersController extends ActionSupport implements ModelDriven{
    private Teachers teachers = new Teachers();
    private String number ;
    private String name ;
    private Integer job;
    private Integer id;
    private JSONArray jsonArray;
    private JSONObject jsonObject = new JSONObject();
    private String jsonstring;
    private TeachersService teachersService = new TeachersServiceImpl();
    private LoginService loginService = new LoginServiceImpl();
    private String jsonpage;
    private Integer pageindex;
    private List<Teachers> teachersList = loginService.selectTeachersAllService();
    private HttpSession httpSession = ServletActionContext.getRequest().getSession();
    private Page p = new Page();
//查询所有教师信息
    public String selectteachersinfo(){
        Teachers teachers = new Teachers();
        teachers.setTnumber(number);
        teachers.setTname(name);
        teachers.setTjob(job);

        List<Teachers> teachersList = teachersService.selectTeachersAllBy(teachers);
        if(teachersList!=null && teachersList.size()>0){
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
    //分页
    public String getPage() {
        p = (Page) httpSession.getAttribute("page");
        jsonpage = JSONObject.fromObject(p).toString();
        return "jsonpage";

    }
//生成教师账号
    public String generatetnumber(){
        Tnumber tn = new Tnumber();
        String stbd = teachersService.selectTeachersByDate(tn.date1());
        if(stbd==null){
            number = tn.date2();
        }else {
            Long l  =tn.date3(stbd);
            number = l.toString();
        }
        teachers.setTnumber(number);
        teachersService.insertOrUpdateTeachers(teachers); 
        teachers = teachersService.selectTeachersByTnumberService(number);
        jsonObject.put("t1",teachers.getTid());
        jsonObject.put("t2",teachers.getTnumber());
        jsonstring = jsonObject.toString();
        return "gtnumber";
    }
//添加教师
    public String insertOrUpdateTeachers(){
        teachers.setTpassword("123456");
        teachers.setTrole(1);
        teachersService.insertOrUpdateTeachers(teachers);
        return "insertOrUpdateTeachers";
    }
//根据cid获取教师信息
    public String editteacherinfo(){
        teachers = teachersService.selectTeachersByTidService(id);
        return "editteacherinfo";
    }
    //重置密码
    public String resetpwd(){
        teachers = teachersService.selectTeachersByTidService(id);
        teachers.setTpassword("111111");
        teachersService.insertOrUpdateTeachers(teachers);
        return "resetpwd";
    }
    //删除
    public String delectteacher(){
        System.out.println(id);
        teachers = teachersService.selectTeachersByTidService(id);
        teachersService.daleteteachersService(teachers);
        return "delectteacher";
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getJob() {
        return job;
    }

    public void setJob(Integer job) {
        this.job = job;
    }

    public String getJsonstring() {
        return jsonstring;
    }

    public void setJsonstring(String jsonstring) {
        this.jsonstring = jsonstring;
    }

    public Teachers getTeachers() {
        return teachers;
    }

    public void setTeachers(Teachers teachers) {
        this.teachers = teachers;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getJsonpage() {
        return jsonpage;
    }

    public void setJsonpage(String jsonpage) {
        this.jsonpage = jsonpage;
    }

    public Integer getPageindex() {
        return pageindex;
    }

    public void setPageindex(Integer pageindex) {
        this.pageindex = pageindex;
    }

    public Page getP() {
        return p;
    }

    public void setP(Page p) {
        this.p = p;
    }

    @Override
    public Object getModel() {
        return teachers;
    }
}
