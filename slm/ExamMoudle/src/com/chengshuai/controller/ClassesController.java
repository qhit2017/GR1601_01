package com.chengshuai.controller;

import com.chengshuai.bean.Classes;
import com.chengshuai.bean.Teachers;
import com.chengshuai.service.Classesservice;
import com.chengshuai.service.impl.Classesserviceimpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * Created by slm on 2017/11/28.
 */
public class ClassesController extends ActionSupport implements ModelDriven{
    private  Classes c = new Classes();
    private  String classesid;
    private String teal;
    private String teah;
    private  String classesjson;
    public JSONObject jsonObject = new JSONObject();
    public JSONArray jsonArray;
    private Classesservice classesservice = new Classesserviceimpl();

    public String QueryClassesall(){
        List<Classes> classesList =  classesservice.QueryClassesAll();
        if(classesList==null || classesList.size()==0){
            return  null;
        }
        jsonArray = JSONArray.fromObject(classesList);
        classesjson = jsonArray.toString();
        return  "classesjson";
    }
    public String QueryTeachersTjob0(){
        /*查询班主任姓名*/
       List<Teachers> teachersList =  classesservice.QueryTeachersTjob0();
        jsonArray = JSONArray.fromObject(teachersList);
        classesjson = jsonArray.toString();
        return  "classesjson";
    }
    public String QueryTeachersTjob1(){
        /*查询班主任姓名*/
        List<Teachers> teachersList =  classesservice.QueryTeachersTjob1();
        jsonArray = JSONArray.fromObject(teachersList);
        classesjson = jsonArray.toString();

        return  "classesjson";
    }
    public String QueryconditionClasses(){
    /*根据条件查询班级表*/
    List<Classes> classesList = classesservice.QueryConditionalBycbeginAndcdirectionAndteacherslAndteachersh(c.getCbegin()+"%",c.getCdirection(),teal,teah);
        jsonArray = JSONArray.fromObject(classesList);
        classesjson = jsonArray.toString();
        return  "classesjson";

    }

    public  String saveOrupdateClasses(){
        if(c.getCid()==null){
            Classes classes = new Classes();
            classes.setCname(c.getCname());
            System.out.println(c.getCname());
            classes.setCnumber(c.getCnumber());
            classes.setCdirection(c.getCdirection());
            /*String转成Int*/
            Integer idl = Integer.parseInt(teal);
            Integer idh = Integer.parseInt(teah);
            /*new 两个对象 把转类型后的数据放在对象里面*/
            Teachers teachers1 = new Teachers();
            teachers1.setTid(idl);
            Teachers teachersh = new Teachers();
            teachersh.setTid(idh);
            /*对象放在classes对象里面*/
            classes.setTeachersl(teachers1);
            classes.setTeachersh(teachersh);
            classes.setCbegin(c.getCbegin());
            classes.setCg1(c.getCg1());
            classes.setCg2(c.getCg2());
            classes.setCg3(c.getCg3());
            classes.setCstate(c.getCstate());
            classes.setCremark(c.getCremark());
            classesservice.saevOrupdate(classes);
            System.out.println(classesid+"123");

        }else {
          Classes classes =   classesservice.QueryClasses(c.getCid());
            classes.setCname(c.getCname());
            classes.setCnumber(c.getCnumber());
            classes.setCdirection(c.getCdirection());
            /*String转成Int*/
            Integer idl = Integer.parseInt(teal);
            Integer idh = Integer.parseInt(teah);
            /*new 两个对象 把转类型后的数据放在对象里面*/
            Teachers teachers1 = new Teachers();
            teachers1.setTid(idl);
            Teachers teachersh = new Teachers();
            teachersh.setTid(idh);
            /*对象放在classes对象里面*/
            classes.setTeachersl(teachers1);
            classes.setTeachersh(teachersh);
            classes.setCbegin(c.getCbegin());
            classes.setCg1(c.getCg1());
            classes.setCg2(c.getCg2());
            classes.setCg3(c.getCg3());
            classes.setCstate(c.getCstate());
            classes.setCremark(c.getCremark());
            classesservice.saevOrupdate(classes);
        }

        return  "classesjson";
    }

    public  String QueryClassesByid(){

        Classes classes =  classesservice.QueryClasses(c.getCid());
        System.out.println(c.getCid());
        jsonObject.put("classes", classes);
        classesjson = jsonObject.toString();
        return  "classesjson";
    }
    public String getClassesjson() {
        return classesjson;
    }

    public void setClassesjson(String classesjson) {
        this.classesjson = classesjson;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public String getTeal() {
        return teal;
    }

    public void setTeal(String teal) {
        this.teal = teal;
    }

    public String getTeah() {
        return teah;
    }

    public void setTeah(String teah) {
        this.teah = teah;
    }

    public String getClassesid() {
        return classesid;
    }

    public void setClassesid(String classesid) {
        this.classesid = classesid;
    }

    public Classes getC() {
        return c;
    }

    public void setC(Classes c) {
        this.c = c;
    }

    @Override
    public Object getModel() {
        return c;
    }
}
