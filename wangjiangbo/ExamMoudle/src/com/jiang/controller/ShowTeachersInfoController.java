package com.jiang.controller;
import com.jiang.bean.Teachers;
import com.jiang.service.*;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import java.util.List;
/**
 * 显示老师信息控制器
 * Created by dell on 2017/11/26.
 */
public class ShowTeachersInfoController extends ActionSupport implements ModelDriven{
    /*老师信息*/
    private ShowTeachersService showTeachersService = new ShowTeachersServiceImpl();
    private JSONArray jsonArray;
    private String jsonstr;
    private JSONObject jsonObject;
    private Integer id;
    private String tnumber;
    private String tname;
    private String tsex;
    private String tbirthday;
    private String ttel;
    private String tphone;
    private Integer tjob;
    private String tremark;
     /*根据条件查询信息*/
    private String number;
    private String name;
    private String job;
    private Integer tid;
    private Teachers teachers = new Teachers();
    private SelectTeachersInfoService selectTeachersInfoService = new SelectTeachersInfoServiceImpl();
    private InsertTeachersInfoService insertTeachersInfoService = new InsertTeachersInfoServiceImpl();

    /*显示老师信息方法*/
    public String showteachers(){
       /*连接服务*/
       List<Teachers> teachersList = showTeachersService.ShowTeachersInfo();
       if(teachersList!=null||teachersList.size()!=0){
           /*引用json数组*/
           jsonArray = JSONArray.fromObject(teachersList);
       }
           /*解析*/
          jsonstr = jsonArray.toString();
       return "success";
    }
     /*根据条件查询老师信息方法*/
    public String selectteachers(){
        Integer ttjob = Integer.parseInt(job);
        List<Teachers> teachersList = selectTeachersInfoService.selectTeachersByTnumberOrTnameOrTjob(number,name,ttjob);
        if(teachersList!=null || teachersList.size()!=0){
           /*引用json数组*/
           jsonArray = JSONArray.fromObject(teachersList);
       }
           /*解析*/
        jsonstr = jsonArray.toString();
        return "success";
    }
    /*显示tnumberid和id信息*/
    public String insertnumber(){
        insertTeachersInfoService = new InsertTeachersInfoServiceImpl();
        Teachers teachers = insertTeachersInfoService.selectTeachersInfo();
        if (teachers!=null){
            jsonObject=jsonObject.fromObject(teachers);
        }
        jsonstr = jsonObject.toString();
        return "success";
    }
    /*编辑跳转页面*/
    public String editteachers() {
        teachers = showTeachersService.queryByTid(id);
        return "editteachers";
    }
    /*编辑更改老师信息*/
    public String update(){
        System.out.println("哈哈"+tid);
        Teachers teachers1 = insertTeachersInfoService.queryTidAppear(teachers.getTid());
        System.out.println(teachers1.equals(null));
        teachers1.setTname(tname);
        teachers1.setTsex(tsex);
        teachers1.setTremark(tremark);
        teachers1.setTbirthday(tbirthday);
        teachers1.setTphone(tphone);
        insertTeachersInfoService.updateInsertTeachers(teachers1);
        return "teachers";
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Teachers getTeachers() {
        return teachers;
    }

    public void setTeachers(Teachers teachers) {
        this.teachers = teachers;
    }

    public String getJsonstr() {
        return jsonstr;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public void setJsonstr(String jsonstr) {
        this.jsonstr = jsonstr;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
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

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
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

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
        this.tsex = tsex;
    }

    public String getTbirthday() {
        return tbirthday;
    }

    public void setTbirthday(String tbirthday) {
        this.tbirthday = tbirthday;
    }

    public String getTtel() {
        return ttel;
    }

    public void setTtel(String ttel) {
        this.ttel = ttel;
    }

    public String getTphone() {
        return tphone;
    }

    public void setTphone(String tphone) {
        this.tphone = tphone;
    }

    public Integer getTjob() {
        return tjob;
    }

    public void setTjob(Integer tjob) {
        this.tjob = tjob;
    }

    public String getTremark() {
        return tremark;
    }

    public void setTremark(String tremark) {
        this.tremark = tremark;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }
    @Override
    /*值栈传值*/
    public Object getModel() {
        return teachers;
    }
}
