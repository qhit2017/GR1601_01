package com.zhanglong.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zhanglong.bean.Teachers;
import com.zhanglong.service.TeacherService;

import com.zhanglong.service.impl.TeacherServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * Created by Administrator on 2017/11/26 0026.
 */
public class TeacherController extends ActionSupport implements ModelDriven {
    private TeacherService service=new TeacherServiceImpl();
    private JSONArray teacherjson;
    private String jsonStr;
    private String tnumber;
    private String tname;
    private String tjob;
    private Teachers chateachers=new Teachers();
    private JSONObject jsonObject=new JSONObject();
    private String teacherInfo;
    private String tid;
    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Teachers getChateachers() {
        return chateachers;
    }

    public void setChateachers(Teachers chateachers) {
        this.chateachers = chateachers;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public String getTeacherInfo() {
        return teacherInfo;
    }

    public void setTeacherInfo(String teacherInfo) {
        this.teacherInfo = teacherInfo;
    }

    public String showteacherlist(){
        List<Teachers>teachersList=service.queryteacherlist();
        if (teachersList!=null&&teachersList.size()!=0){
            teacherjson= JSONArray.fromObject(teachersList);
        }
        jsonStr=teacherjson.toString();
        System.out.println(jsonStr);
        return "success";
    }
   //添加教师
    public String saveorupdateteacher(){

       /* Integer id=Integer.valueOf(tid);*/

        Integer id=chateachers.getTid();

        System.out.println("id========"+id);
        Teachers teachers=service.SelectTeachersByTid(id);
        System.out.println(teachers.getTnumber());

        System.out.println(chateachers.getTnumber());
        System.out.println(chateachers.getTbirthday());
        System.out.println(chateachers.getTedu());
        System.out.println(chateachers.getTjob());
        System.out.println(chateachers.getTremark());

        //teachers.setTid(chateachers.getTid());

        teachers.setTbirthday(chateachers.getTbirthday());
        teachers.setTedu(chateachers.getTedu());
        teachers.setTname(chateachers.getTname());
        teachers.setTremark(chateachers.getTremark());
        teachers.setTsex(chateachers.getTsex());
        teachers.setTjob(chateachers.getTjob());
        teachers.setTtel(chateachers.getTtel());
        service.SaveOrUpdate(teachers);
        jsonObject.put("result","true");

        jsonStr=jsonObject.toString();
        System.out.println();
       return "saveorupdateteacher";


    }

    //根据账号，姓名，岗位查询
    public String selectname(){
        List<Teachers>teachersList=service.queryteacherByTnumberTnameTrole(chateachers.getTnumber(),chateachers.getTname(),chateachers.getTjob());
        if (teachersList!=null&&teachersList.size()>0){
            teacherjson= JSONArray.fromObject(teachersList);
        }
        jsonStr=teacherjson.toString();
        /*System.out.println(jsonStr);*/
        return "selectname";

   }

   /*//根据ID进行查询 编辑显示页面
    public String selectid(){
       *//* Integer id=chateachers.getTid();
        Teachers teachers= service.SelectTeachersByTid(id);
        jsonObject.put("teachers",teachers);
        jsonStr=jsonObject.toString();
        System.out.println("jsonStr"+jsonStr);*//*
        Teachers teachers = new Teachers();
       TeacherService  service=new TeacherServiceImpl();
       service.SaveOrUpdate(teachers);
        return "selectid";

    }*/

    //编辑显示页面
    public String addteacher1(){
        TeacherService service=new TeacherServiceImpl();
        chateachers =service.SelectTeachersByTid(id);
        System.out.println("+==========="+id);
        return "addteacher1";
    }
    /*public String getTnumber1(){
        Date date=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat();
        String strDate=simpleDateFormat.format(date);


    }*/
    //添加放number
    public  String addteachernumber(){
        Teachers teachers =service.queryTeacherNumber();
        System.out.println("117="+teachers.getTnumber());

        jsonObject.put("teachers",teachers.getTnumber());
        jsonObject.put("teachers1",teachers.getTid());
        jsonStr = jsonObject.toString();
        System.out.println("121="+jsonStr);
        /*HttpSession session= ServletActionContext.getRequest().getSession();
        session.setAttribute("chateachers",chateachers);
*/
        return "addteachernumber";
    }
    //根据ID进行删除
      public String shanchu(){
        Integer id=chateachers.getTid();
        Teachers teachers=service.SelectTeachersByTid(id);
        service.deleteTeacherById(teachers);
        jsonObject.put("result","true");
        jsonStr=jsonObject.toString();
        return "shanchu";

    }

    //重置密码（重置成统一的密码）
    public String chongzhi(){
        Integer id=chateachers.getTid();

        Teachers teachers=service.SelectTeachersByTid(id);

        teachers.setTpassword("1234");
        service.SaveOrUpdate(teachers);

        jsonObject.put("result","true");
        jsonStr=jsonObject.toString();
        return "chongzhi";
    }


    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getTnumber() {
        return tnumber;
    }

    public void setTnumber(String tnumber) {
        this.tnumber = tnumber;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTjob() {
        return tjob;
    }

    public void setTjob(String tjob) {
        this.tjob = tjob;
    }

    public TeacherService getService() {
        return service;
    }

    public void setService(TeacherService service) {
        this.service = service;
    }

    public JSONArray getTeacherjson() {
        return teacherjson;
    }

    public void setTeacherjson(JSONArray teacherjson) {
        this.teacherjson = teacherjson;
    }

    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
    }

    @Override
    public Object getModel() {
        return chateachers;
    }
}
