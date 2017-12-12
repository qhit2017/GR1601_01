package com.wangdoudou.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wangdoudou.bean.Students;
import com.wangdoudou.service.StudentsService;
import com.wangdoudou.service.StudentsServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * Created by 王豆豆 on 2017/12/4.
 */
public class StudentsController extends ActionSupport implements ModelDriven {
    private StudentsService studentsService=new StudentsServiceImpl();
    private JSONArray jsonArray1;
    private String jsoning;
    private String snumber;
    private String sname;
    private JSONObject jsonObject=new JSONObject();
    private Students studentsResult=new Students();

    public String showdd(){
        //显示学生主页面
        List<Students> studentsList=studentsService.selectAllStudentsinfo();

        if (studentsList!=null && studentsList.size()!=0){

            jsonArray1=JSONArray.fromObject(studentsList);
        }

        jsoning=jsonArray1.toString();

        return "jsoning";

    }
    //根据条件查询
    public String selectStudentinfo(){
        List<Students>studentsList=studentsService.selectStudentsBysnumberAndsname(snumber,sname);
        if (studentsList!=null && studentsList.size()!=0){

            jsonArray1=JSONArray.fromObject(studentsList);

        }
        jsoning=jsonArray1.toString();

        return "jsoning";

    }
    //保存或修改学生信息
    public String saveOrupdateStudents(){
      Students students=new Students();
      Integer sid=studentsResult.getSid();
      students.setSid(sid);
      Students students1=studentsService.selectById(students);
      students1.setSnumber(studentsResult.getSnumber());
      students1.setSname(studentsResult.getSname());
      students1.setSsex(studentsResult.getSsex());
      students1.setSidnumber(studentsResult.getSidnumber());
      students1.setSenter(studentsResult.getSenter());
      students1.setSbirthday(studentsResult.getSbirthday());
      students1.setSprovince(studentsResult.getSprovince());
      students1.setSdormitory(studentsResult.getSdormitory());
      students1.setSprovince(studentsResult.getSprovince());
      students1.setScity(studentsResult.getScity());
      students1.setSattend(studentsResult.getSattend());
      students1.setSaddress(studentsResult.getSaddress());
      students1.setStel(studentsResult.getStel());
      students1.setSeducation(studentsResult.getSeducation());
      students1.setSphoto(studentsResult.getSphoto());
      students1.setSbasicinfo(studentsResult.getSbasicinfo());
      students1.setSdnumber(studentsResult.getSdnumber());
      students1.setSpassword(studentsResult.getSpassword());
      studentsService.saveOrupdateStudentinfo(students1);
      jsonObject.put("result",true);
      jsoning=jsonObject.toString();
      return "jsoning";

    }

    //点击编辑修改学生信息
    public String stringinfo() {
        Students students=new Students();
        Integer sid = studentsResult.getSid();
        Students students1 =studentsService.selectById(students);
        jsonObject.put("students1", students1);
        jsoning = jsonObject.toString();
        System.out.println("jsoning" + jsoning);
        return "jsoning";
    }
    //重置密码
    public String resetinfo() {
        Students students=new Students();
        Integer sid = studentsResult.getSid();
        Students students1 =studentsService.selectById(students);
        students1.setSpassword("1234");
        studentsService.saveOrupdateStudentinfo(students1);
        jsonObject.put("result", "true");
        jsoning = jsonObject.toString();
        return "jsoning";
    }
    //删除
    public String deletestudentsinfo() {
        Students students=new Students();
        Integer sid = studentsResult.getSid();
        students.setSid(sid);
        Students students1 =studentsService.selectById(students);
        studentsService.deleteStudentsinfo(students1);
        jsonObject = JSONObject.fromObject(students1);
        jsoning = jsonObject.toString();
        return "jsoning";

    }

    public String getJsoning() {
        return jsoning;
    }

    public void setJsoning(String jsoning) {
        this.jsoning = jsoning;
    }

    public String getSnumber() {
        return snumber;
    }

    public void setSnumber(String snumber) {
        this.snumber = snumber;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public Students getStudentsResult() {
        return studentsResult;
    }

    public void setStudentsResult(Students studentsResult) {
        this.studentsResult = studentsResult;
    }

    @Override
    public Object getModel() {
        return null;
    }
}
