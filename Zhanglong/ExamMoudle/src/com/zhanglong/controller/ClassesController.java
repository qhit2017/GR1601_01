package com.zhanglong.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zhanglong.bean.Classes;
import com.zhanglong.bean.Teachers;
import com.zhanglong.service.ClassesService;

import com.zhanglong.service.impl.ClassesServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * Created by Administrator on 2017/11/29 0029.
 */
public class ClassesController extends ActionSupport implements ModelDriven {
    private Classes classes=new Classes();
    private Teachers teachers = new Teachers();
    private ClassesService service=new ClassesServiceImpl();
    private JSONArray jsonArray;
    private String jsonstr;
    private String tidl;
    private String tidh;
    private JSONObject jsonObject=new JSONObject();
    private String id;
    private String cid;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public String getTidl() {
        return tidl;
    }

    public void setTidl(String tidl) {
        this.tidl = tidl;
    }

    public String getTidh() {
        return tidh;
    }

    public void setTidh(String tidh) {
        this.tidh = tidh;
    }

    public Teachers getTeachers() {
        return teachers;
    }

    public void setTeachers(Teachers teachers) {
        this.teachers = teachers;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public ClassesService getService() {
        return service;
    }

    public void setService(ClassesService service) {
        this.service = service;
    }

    public String getJsonstr() {
        return jsonstr;
    }

    public void setJsonstr(String jsonstr) {
        this.jsonstr = jsonstr;
    }

    public Classes getClasses() {
        return classes;
    }

    public void setClasses(Classes classes) {
        this.classes = classes;
    }
    public String showclasseslist(){
       /* System.out.println("111111");*/
        List<Classes>classesList=service.selectAllClassInfo();
        /*System.out.println("大小"+classesList.size());*/
        if (classesList!=null&&classesList.size()!=0){
            jsonArray= JSONArray.fromObject(classesList);
        }
        jsonstr=jsonArray.toString();
        System.out.println(jsonstr);
        return "showclasseslist";
    }
    //查班主任姓名显示在下拉框中(根据岗位查询信息)
    public String selectjiangshi(){
        List<Teachers> teachersList= service.selectTeacherBytjobjiangshi(0);
        jsonArray= JSONArray.fromObject(teachersList);
        jsonstr=jsonArray.toString();
        return "selectjiangshi";
    }

    //查讲师姓名显示在下拉框中(根据岗位查询信息)
    public String selectbanzhuren(){
        List<Teachers> teachersList=service.selectTeacherBytjobbanzhuren(1);
        jsonArray= JSONArray.fromObject(teachersList);
        jsonstr=jsonArray.toString();
        return "selectbanzhuren";

    }
    public String selectchaxun(){
        System.out.println("+++++++++++++"+tidl);
        System.out.println("++++++++++++=+++++"+tidh);
        List<Classes>classesList=service.selectChaxun(classes.getCbegin(),classes.getCdirection(),tidl,tidh);
        jsonArray= JSONArray.fromObject(classesList);
        jsonstr=jsonArray.toString();
        System.out.println(jsonstr);
         return "selectchaxun";
    }
    //添加教师信息
    public String saveorupdate(){
        Teachers teachers=new Teachers();
        teachers.setTid(Integer.parseInt(tidl));
        Teachers teachers1=new Teachers();
        teachers1.setTid(Integer.parseInt(tidh));
        classes.setTeachersl(teachers);
        classes.setTeachersh(teachers1);
        service.saveOrUpdateClasses(classes);
        jsonObject.put("result","true");
        jsonstr=jsonObject.toString();
        return "saveorupdate";


    }

    public String saveorupdate1(){
       /* Classes classInfo=new Classes();*/
        Classes classInfo=service.selectClassById(classes.getCid());
        classInfo.setCbegin(classes.getCbegin());
        classInfo.setCg1(classes.getCg1());
        classInfo.setCg2(classes.getCg2());
        classInfo.setCg3(classes.getCg3());
        classInfo.setCname(classes.getCname());
        classInfo.setCdirection(classes.getCdirection());
        System.out.println(classes.getCid());

        Teachers teachers=new Teachers();
        teachers.setTid(Integer.parseInt(tidl));

        Teachers teachers1=new Teachers();
        teachers1.setTid(Integer.parseInt(tidh));

        classes.setTeachersl(teachers);
        classes.setTeachersh(teachers1);
        classInfo.setCstate(classes.getCstate());
        classInfo.setCremark(classes.getCremark());
        service.saveOrUpdateClasses(classInfo);
        jsonObject.put("result","true");
        jsonstr=jsonObject.toString();
        return "saveorupdate1";

    }


   public String bianji(){
       System.out.println("111111111-0000--"+id);
       Integer id1=Integer.parseInt(id);
       classes=service.selectClassById(id1);
       /*System.out.println("============"+id);
       System.out.println("____________"+classes.getTeachersh().getTname());*/
       return "bianji";

   }


    @Override
    public Object getModel() {

        return classes;
    }
}
