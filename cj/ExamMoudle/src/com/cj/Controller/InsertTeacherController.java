package com.cj.Controller;

import com.cj.Bean.Teachers;
import com.cj.Service.TeachersService;
import com.cj.Service.TeachersServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


/**
 * Created by cj on 2017/11/27.
 */
public class InsertTeacherController extends ActionSupport {
    TeachersService teachersservice = new TeachersServiceImpl();

    private String jsonstr;



    private Integer tid;
    private String tnumber;
    private String tname;
    private String tsex;
    private Date tbirthday;
    private String tphone;
    private String ttel;
    private Integer tjob;
    private String tremark;
    JSONObject jsonObject = new JSONObject();
    HttpSession session = ServletActionContext.getRequest().getSession();


    /*  增加老师账号*/
    public String insertteacher() {


        Teachers teachernum = teachersservice.selectNumber();
        String tnumber = teachernum.getTnumber();

        jsonObject.put("tnumber",tnumber);

        jsonstr=jsonObject.toString();

        return "teachers";
    }

/*增加老师信息*/

    public String insertteacherall() {

        List<Teachers> teachersList = teachersservice.selectTnumberMyId(tnumber);
        for (Teachers t : teachersList) {

            Teachers teachers = teachersservice.selectMyTid(t.getTid());

            teachers.setTname(tname);
            teachers.setTnumber(tnumber);
            teachers.setTbirthday(tbirthday);

            if (tsex.equals("男")) {
                teachers.setTsex("男");
            } else {
                teachers.setTsex("女");
            }
            teachers.setTphone(tphone);
            teachers.setTtel(ttel);
            if (tjob.equals("0")) {
                teachers.setTjob(0);
            } else {
                teachers.setTjob(1);
            }
            teachers.setTremark(tremark);

            boolean teacherss = teachersservice.insertteacherAll(teachers);

            if (teacherss = true) {
                return "teacher";
            } else {
                return "insertteacher";
            }

        }

             return "inserteacher";
    }

    /*编辑老师信息*/
    public String compileteacher(){
        System.out.println("compileteacher"+tid);
        Teachers teacherid= teachersservice.selectMyTid(tid);


          /*编辑之后修改*/
        teacherid.setTname(tname);
        teacherid.setTpassword(tnumber);
        teacherid.setTphone(tphone);
        teacherid.setTsex(tsex);
        teacherid.setTjob(tjob);
        /*编辑之后修改*/
         boolean teacherupdate=   teachersservice.insertteacherAll(teacherid);
        session.setAttribute("teachers",teacherid);

       if (teacherupdate==true){
           //成功
           return "teacher";
       }
       return "editteacher";
    }



    /*修改老师密码*/
    public String updatepassword(){
        System.out.println("uupdatepassword"+tid);
        Teachers teacherid= teachersservice.selectMyTid(tid);

        teacherid.setTpassword("123456");

       boolean updateteachers =teachersservice.insertteacherAll(teacherid);
        System.out.println(updateteachers);
       if (updateteachers==true){
           return "true";
       }
       return "falace";
    }

/*删除*/
public String deleteteacher(){
    Teachers teacherid= teachersservice.selectMyTid(tid);
boolean   teacherdelete= teachersservice.deleteTeacher(teacherid);
if (teacherdelete==true){
    return "teacher";
}
return "false";
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

    public TeachersService getTeachersservice() {
        return teachersservice;
    }

    public void setTeachersservice(TeachersService teachersservice) {
        this.teachersservice = teachersservice;
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

    public String getTphone() {
        return tphone;
    }

    public void setTphone(String tphone) {
        this.tphone = tphone;
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

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Date getTbirthday() {
        return tbirthday;
    }

    public void setTbirthday(Date tbirthday) {
        this.tbirthday = tbirthday;
    }

    public Integer getTjob() {
        return tjob;
    }

    public void setTjob(Integer tjob) {
        this.tjob = tjob;
    }


}

