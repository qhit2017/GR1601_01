package com.wangdoudou.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wangdoudou.bean.Teachers;
import com.wangdoudou.dao.TeachersDao;
import com.wangdoudou.service.TeachersService;
import com.wangdoudou.service.TeachersServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * Created by 王豆豆 on 2017/11/25.
 */
public class TeachersController extends ActionSupport implements ModelDriven{
    private TeachersService teachersService=new TeachersServiceImpl();
    private JSONArray teachersjson;
    private String jsoner;
    private String tnumber;
    private String tname;
    private String tjob;

    private JSONObject jsonObject=new JSONObject();
    private Teachers teachersResult=new Teachers();

    //查询教师所有信息
    public String show(){

        List<Teachers>teachersList=teachersService.selectByAllinfo();

        if (teachersList!=null && teachersList.size()!=0){

            teachersjson=JSONArray.fromObject(teachersList);
        }

        jsoner=teachersjson.toString();

        return "success";
    }

    //条件查询
    public String selectall(){
        List<Teachers>teachersList=teachersService.selectTeachersByTnumberAndTname(tnumber,tname,tjob);

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
        Teachers teachers=teachersService.selectByTid(teacherser);
        teachers.setTtel(teachersResult.getTtel());
        teachers.setTbirthday(teachersResult.getTbirthday());
        teachers.setTsex(teachersResult.getTsex());
        teachers.setTrole(1);
        teachers.setTjob(teachersResult.getTjob());
        teachers.setTremark(teachersResult.getTremark());
        teachers.setTphone(teachersResult.getTphone());
        teachers.setTpassword("1234");
        teachersService.updateTeachersByTid(teachers);
        jsonObject.put("result","true");
        jsoner=jsonObject.toString();
            return "update";
    }
    //点击编辑修改教师信息
    public String xiuteacherinfo() {
        Teachers teacherser=new Teachers();
        Integer tid = teachersResult.getTid();
        Teachers teachers =teachersService.selectByTid(teacherser);
        jsonObject.put("teachers", teachers);
        jsoner = jsonObject.toString();
        System.out.println("jsoner" + jsoner);
        return "teacherinforesult";
    }
    //重置密码
    public String resetpassword() {
        Teachers teacherser=new Teachers();
        Integer tid = teachersResult.getTid();
        Teachers teachers = teachersService.selectByTid(teacherser);
        teachers.setTpassword("1234");
        teachersService.updateTeachersByTid(teachers);
        jsonObject.put("result", "true");
        jsoner = jsonObject.toString();
        return "resetpassword2";
    }


    //添加教师账号生成
    private String addTeachers(){
        Teachers teachersLike=teachersService.selectTeachersLike();
        String tnumber=teachersLike.getTnumber();
        System.out.println(tnumber);
        jsonObject.put("result",teachersLike);
        jsoner=jsonObject.toString();
        return "addTeacheret";

    }
     //删除
    public String deleteinfo() {
        Teachers teacherser = new Teachers();
        Integer id = teachersResult.getTid();
        teacherser.setTid(id);
        Teachers teachers = teachersService.selectByTid(teacherser);
        teachersService.deleteTeachersByTid(teachers);
        jsonObject = JSONObject.fromObject(teachers);
        jsoner = jsonObject.toString();
        return "jsoner";

    }
    //保存教师信息
   public String saveinfo() {
       teachersResult.setTpassword("1234");
       teachersService.updateTeachersByTid(teachersResult);
       jsonObject.put("result", "true");
       jsoner = jsonObject.toString();
       return "saveinfo1";
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
