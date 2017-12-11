package com.guolonglong.controller;

import com.guolonglong.bean.Teachers;
import com.guolonglong.service.TeachersService;
import com.guolonglong.service.impl.TeachersServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by lenovo on 2017/11/26.
 */
public class TeachersController extends ActionSupport {
    private JSONArray teachersJson;
    private JSONObject teacherJson;
    private String jsonStr;

    private String tnumber;
    private String tname;
    private String tjob;

    private Integer tid;
    private String tsex;
    private String tbirthday;
    private String teducation;
    private String ttel;
    private String tremark;
    Teachers teachers = new Teachers();
    TeachersService service = new TeachersServiceImpl();
    List<Teachers> teachersList;
    //取session
    HttpSession session = ServletActionContext.getRequest().getSession();

    public String teachersshowlist(){

        teachersList = service.selectTeachersAll();

        if (teachersList!=null && teachersList.size()!=0){
            teachersJson = JSONArray.fromObject(teachersList);
        }
        jsonStr = teachersJson.toString();

        return "teacher";
    }

    public String fingbynumberornameorjob(){
        Integer job = Integer.parseInt(tjob);
        teachersList = service.selectTeacherBynumberOrnameOrjob(tnumber,tname,job);

        if (teachersList!=null && teachersList.size()!=0){
            teachersJson = JSONArray.fromObject(teachersList);
        }
        jsonStr = teachersJson.toString();

        return "teacher";
    }

    /*          增加              */

    public String findtnumber(){

        teachers = service.queryTnumber(teachers);

        session.setAttribute("teachers",teachers);

        return "insertteachers";

    }
    public String insertteacherinfo(){
        Teachers teacher = service.queryTnumber(teachers);
        List<Teachers> teachersList = service.selectTeachersByNumber(teacher.getTnumber());

            /*teachersJson = JSONArray.fromObject(teachersList);*/
            for (Teachers t:teachersList){
                Teachers teachers=service.selectTeachersById(t.getTid());
                Integer job = Integer.parseInt(tjob);
                System.out.println("job"+job);
                teachers.setTname(tname);
                teachers.setTsex(tsex);
                teachers.setTjob(job);
                teachers.setTbirthday(tbirthday);
                teachers.setTeducation(teducation);
                teachers.setTtel(ttel);
                teachers.setTremark(tremark);
                Teachers teachers1 = service.insertTeachersInfo(teachers);

            }
            /*jsonStr = teachersJson.toString();*/
            return "teachers";

    }
    /*          更新              */
    public String findtid(){
        /*if (teachers!=null){
            teacherJson = JSONObject.fromObject(teachers);
        }
        jsonStr = teacherJson.toString();*/
        return "updateteachers";
    }
    public String updateteacherinfo(){
        Teachers teacher = service.selectTeachersById(tid);
        session.setAttribute("teacher",teacher);

        /*Integer job = Integer.parseInt(tjob);
        System.out.println("job"+job);
        teachers.setTname(tname);
        teachers.setTsex(tsex);
        teachers.setTjob(job);
        teachers.setTbirthday(tbirthday);
        teachers.setTeducation(teducation);
        teachers.setTtel(ttel);
        teachers.setTremark(tremark);
        service.insertTeachersInfo(teachers);*/
        return "updateteacher";

    }
    //重置密码
    public String updatepwd(){
        Teachers teacher = service.selectTeachersById(tid);
        service.updateTeachersPwd(teacher);
        return "teachers";
    }
    /*          删除              */
    public String deleteteacherinfo(){
        Teachers teacher = service.selectTeachersById(tid);
        service.deleteTeachersInfo(teacher);
        return "teachers";
    }





    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
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

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
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

    public String getTeducation() {
        return teducation;
    }

    public void setTeducation(String teducation) {
        this.teducation = teducation;
    }

    public String getTtel() {
        return ttel;
    }

    public void setTtel(String ttel) {
        this.ttel = ttel;
    }

    public String getTremark() {
        return tremark;
    }

    public void setTremark(String tremark) {
        this.tremark = tremark;
    }
}
