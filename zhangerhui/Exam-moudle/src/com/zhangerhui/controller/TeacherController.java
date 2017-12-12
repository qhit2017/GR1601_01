package com.zhangerhui.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zhangerhui.bean.Teachers;
import com.zhangerhui.service.TeacherService;
import com.zhangerhui.service.impl.TeacherServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * Created by Administrator on 2017/11/24/024.
 */
public class TeacherController extends ActionSupport {

    private String job;
    private String name;
    private String number;

    private Integer tid;
    private String tedu;
    private String ttel;
    private Integer tjob;
    private String tname;
    private String tsex;
    private String tremark;
    private String tnumber;
    private String tbirthday;

    private String jsonresult;
    private JSONArray jsonarry;

    private Teachers newteacher = new Teachers();
    private JSONObject jsonObject = new JSONObject();
    private TeacherService service = new TeacherServiceImpl();

    public String showteacherinfo() {

        List<Teachers> teachersList = service.selectTeachersallinfo();
        if (teachersList != null || teachersList.size() != 0) {
            jsonarry = JSONArray.fromObject(teachersList);
        }
        jsonresult = jsonarry.toString();

        return "showsuccess";

    }


    //根据账号，姓名，岗位查询

    public String showteacherbyThree() {

        Integer inttjob = Integer.valueOf(job);
        System.out.println("job为" + inttjob);

        List<Teachers> teachersList = service.selectThreeTeacher(number, name, inttjob);
        if (teachersList != null || teachersList.size() != 0) {
            jsonarry = JSONArray.fromObject(teachersList);
        }
        jsonresult = jsonarry.toString();

        return "showthreesuccess";
    }


    //添加方法
    //添加教师(教师的编号自动有序添加)

    //生成标号
    public String getnumber() {

        TeacherService service = new TeacherServiceImpl();
        newteacher = service.selectTeacherTnumber();
        if (newteacher != null) {
            jsonObject = JSONObject.fromObject(newteacher);
        }
        jsonresult = jsonObject.toString();
        return "getsuccess";
    }

    public String insertteacher() {

        Teachers teachers = service.selectTeacherByTid(tid);
        System.out.println("if is null" + teachers.equals(null));
        teachers.setTtel(ttel);
        teachers.setTedu(tedu);
        teachers.setTsex(tsex);
        teachers.setTname(tname);
        teachers.setTremark(tremark);
        teachers.setTbirthday(tbirthday);
        teachers.setTjob(tjob);
        service.updateTeachersInfo(teachers);
        jsonObject.put("result", "true");
        jsonresult = jsonObject.toString();
        return "insertsuccess";
    }

    public String cancelteacher() {

        Teachers teachers = service.selectTeacherByTid(tid);
        service.deleteTeachersInfo(teachers);

        jsonObject.put("result", "true");
        jsonresult = jsonObject.toString();
        return "cancelsuccess";
    }

    //点击编辑将信息返回过去
    public String editteacher() {

        System.out.println("tid为"+tid);

        Teachers teachers = service.selectTeacherByTid(tid);

        jsonObject = JSONObject.fromObject(teachers);

        jsonresult = jsonObject.toString();

        return "editsuccess";
    }

    //点击编辑将信息返回过去保存
    public String editsaveteacher() {

        Teachers teachers = service.selectTeacherByTid(tid);
        System.out.println("if is null" + teachers.equals(null));
        teachers.setTtel(ttel);
        teachers.setTedu(tedu);
        teachers.setTsex(tsex);
        teachers.setTname(tname);
        teachers.setTremark(tremark);
        teachers.setTbirthday(tbirthday);
        teachers.setTjob(tjob);
        service.updateTeachersInfo(teachers);
        jsonObject.put("result", "true");
        jsonresult = jsonObject.toString();
        return "savesuccess";
    }

    public String reteacherpwd() {

        Teachers teachers = service.selectTeacherByTid(tid);

        teachers.setTpassword("1234");

        service.updateTeachersInfo(teachers);

        jsonObject.put("result", "true");

        jsonresult = jsonObject.toString();

        return "repwdsuccess";
    }

    public String deleteteacher() {

        Teachers teachers = service.selectTeacherByTid(tid);

        service.deleteTeachersInfo(teachers);

        jsonObject.put("result", "true");

        jsonresult = jsonObject.toString();

        return "deletesuccess";
    }


    public JSONArray getJsonarry() {
        return jsonarry;
    }

    public void setJsonarry(JSONArray jsonarry) {
        this.jsonarry = jsonarry;
    }

    public String getJsonresult() {
        return jsonresult;
    }

    public void setJsonresult(String jsonresult) {
        this.jsonresult = jsonresult;
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

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public String getTnumber() {
        return tnumber;
    }

    public void setTnumber(String tnumber) {
        this.tnumber = tnumber;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTedu() {
        return tedu;
    }

    public void setTedu(String tedu) {
        this.tedu = tedu;
    }

    public String getTtel() {
        return ttel;
    }

    public void setTtel(String ttel) {
        this.ttel = ttel;
    }

    public Integer getTjob() {
        return tjob;
    }

    public void setTjob(Integer tjob) {
        this.tjob = tjob;
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

    public String getTremark() {
        return tremark;
    }

    public void setTremark(String tremark) {
        this.tremark = tremark;
    }

    public String getTbirthday() {
        return tbirthday;
    }

    public void setTbirthday(String tbirthday) {
        this.tbirthday = tbirthday;
    }

    public Teachers getNewteacher() {
        return newteacher;
    }

    public void setNewteacher(Teachers newteacher) {
        this.newteacher = newteacher;
    }

}
