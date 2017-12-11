package com.wangmengyuan.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wangmengyuan.Service.teacherService;
import com.wangmengyuan.Service.teacherServiceImpl;
import com.wangmengyuan.bean.Teachers;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * Created by Administrator on 2017/12/4.
 */
public class TeacherController extends ActionSupport implements ModelDriven {
    private teacherService teacherService = new teacherServiceImpl();
    private JSONArray teachersjson;
    private JSONArray jsonArray;
    private String jsoner;
    private String tnumber;
    private String tname;
    private String tjob;
    private JSONObject jsonObject=new JSONObject();
    private Teachers teachersResult=new Teachers();


    //查询所有教师信息
    public String queryshow(){
        List<Teachers> teachersList = teacherService.querylist();
        if (teachersList!=null && teachersList.size()!=0){
            teachersjson=JSONArray.fromObject(teachersList);
        }
        jsoner=teachersjson.toString();
    return "success";

    }
    //添加教师账号生成
    private String addTeachers(){
        Teachers teachersLike=teacherService.selectTeachersLike();
        String tnumber=teachersLike.getTnumber();
        jsonObject.put("result",teachersLike);
        jsoner=jsonObject.toString();
        return "addTeacheret";
        /*  teacherService teachersService=new teacherServiceImpl();
       Teachers teachersLike=teachersService.selectTeachersLike();
       if (teachersLike!=null){
           jsonObject = JSONObject.fromObject(teachersLike);
       }
        jsoner = jsonObject.toString();
       return "addTeachers";*/
    }

    //条件查询
    public String selectall(){
        List<Teachers> teachersList = teacherService.selecttnumberOrtnameOrtjob(tnumber,tname,tjob);
        if (teachersList!=null && teachersList.size()!=0){
            teachersjson=JSONArray.fromObject(teachersList);
        }
        jsoner=teachersjson.toString();
        return "success";
    }

    //保存教师信息
    public String saveString(){
        Teachers teacherser=new Teachers();
        Integer tid=teachersResult.getTid();
        teacherser.setTid(tid);
        Teachers teachers=teacherService.selectByTid(teacherser);
        teachers.setTtel(teachersResult.getTtel());
        teachers.setTbirthday(teachersResult.getTbirthday());
        teachers.setTsex(teachersResult.getTsex());
        teachers.setTrole(1);
        teachers.setTjob(teachersResult.getTjob());
        teachers.setTremark(teachersResult.getTremark());
        teachers.setTphone(teachersResult.getTphone());
        teachers.setTpassword("1234");
        teacherService.updateTeachersByTid(teachers);
        jsonObject.put("result","1");
        jsoner=jsonObject.toString();
        return "update";
    }


    //点击编辑修改教师信息
    public String xiuteacherinfo() {
        Teachers teacherser=new Teachers();
        Integer tid = teachersResult.getTid();
        Teachers teachers =teacherService.selectByTid(teacherser);
        jsonObject.put("teachers", teachers);
        jsoner = jsonObject.toString();
        System.out.println("jsoner" + jsoner);
        return "teacherinforesult";
    }
    //重置密码
    public String resetpassword() {
        Teachers teacherser=new Teachers();
        Integer tid = teachersResult.getTid();
        Teachers teachers = teacherService.selectByTid(teacherser);
        teachers.setTpassword("1234");
        teacherService.updateTeachersByTid(teachers);
        jsonObject.put("result", "1");
        jsoner = jsonObject.toString();
        return "resetpassword2";
    }

    //保存教师信息
    public String saveinfo() {
        teachersResult.setTpassword("1234");
        teacherService.updateTeachersByTid(teachersResult);
        jsonObject.put("result", "1");
        jsoner = jsonObject.toString();
        return "saveinfo1";
    }

    public String selectTeacherTjob0(){
        List<Teachers> teachersList = teacherService.selectTjob0();
        jsonArray = JSONArray.fromObject(teachersList);
        jsoner = jsonArray.toString();
        return  "success";
    }


    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public Teachers getTeachersResult() {
        return teachersResult;
    }

    public void setTeachersResult(Teachers teachersResult) {
        this.teachersResult = teachersResult;
    }

    public String getJsoner() {
        return jsoner;
    }

    public void setJsoner(String jsoner) {
        this.jsoner = jsoner;
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

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    @Override
    public Object getModel() {
        return null;
    }
}
