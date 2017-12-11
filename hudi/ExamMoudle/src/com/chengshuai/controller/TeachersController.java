package com.chengshuai.controller;

import com.chengshuai.bean.Teachers;
import com.chengshuai.service.TeacherService;
import com.chengshuai.service.TeacherServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/11/23.
 */
public class TeachersController extends ActionSupport {

    private TeacherService teacherService = new TeacherServiceImpl();
    private JSONArray teacherjson;
    private String jsonStr;
    private Teachers teachersResult= new Teachers();



    public String  showteacherlist(){
       List<Teachers> teachersList= teacherService.queryTeacherList();

//


       if(teachersList!=null && teachersList.size()!=0) {
           teacherjson = JSONArray.fromObject(teachersList);
       }
       jsonStr = teacherjson.toString();
        return "success";
    }



    public String showteacherList1(){
        List<Teachers> teachersList= teacherService.queryTeacherList();

//


        if(teachersList!=null && teachersList.size()!=0) {
            teacherjson = JSONArray.fromObject(teachersList);
        }
        jsonStr = teacherjson.toString();
        return "success";
    }

    public String addteacher(){
        teachersResult =  teacherService.queryTeacherNumber();
       return "addtecher";
    }




    public String queryJob0(){
        List<Teachers> teachersList = teacherService.queryTeachersByTjob0();
        JSONArray jsonArray =JSONArray.fromObject(teachersList);

        jsonStr = jsonArray.toString();
        return "success";
    }

    public String queryJob1(){
        List<Teachers> teachersList = teacherService.queryTeachersByTjob1();
        JSONArray jsonArray =JSONArray.fromObject(teachersList);

        jsonStr = jsonArray.toString();
        return "success";
    }

    public Teachers getTeachersResult() {
        return teachersResult;
    }

    public void setTeachersResult(Teachers teachersResult) {
        this.teachersResult = teachersResult;
    }

    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
    }
}
