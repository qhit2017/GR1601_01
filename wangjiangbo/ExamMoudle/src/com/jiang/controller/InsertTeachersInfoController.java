package com.jiang.controller;
import com.jiang.bean.Teachers;
import com.jiang.service.InsertTeachersInfoService;
import com.jiang.service.InsertTeachersInfoServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;

/**
 * 添加老师控制器
 * Created by dell on 2017/11/28.
 */
public class InsertTeachersInfoController extends ActionSupport {
    /*添加老师信息*/
    private String tid;
    private String tnumber;
    private String tname;
    private String tsex;
    private String tbirthday;
    private String ttel;
    private String tphone;
    private String job;
    private String remark;
    private String jsonstr;
    private JSONObject jsonObject = new JSONObject();
    private InsertTeachersInfoService insertTeachersInfoService = new InsertTeachersInfoServiceImpl();

    /*点击确定添加*/
    public String insertteachers() {
        Integer id = Integer.parseInt(tid);
        System.out.println("id为" + id);
        Teachers teachers = insertTeachersInfoService.queryTidAppear(id);
        teachers.setTname(tname);
        teachers.setTphone(tphone);
        teachers.setTtel(ttel);
        insertTeachersInfoService.updateInsertTeachers(teachers);
        return "success";
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

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getJsonstr() {
        return jsonstr;
    }

    public void setJsonstr(String jsonstr) {
        this.jsonstr = jsonstr;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }
}
