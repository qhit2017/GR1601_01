package com.chengshuai.controller;

import com.chengshuai.bean.Classes;
import com.chengshuai.bean.Students;
import com.chengshuai.service.Studentsservice;
import com.chengshuai.service.impl.Studentsserviceimpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by slm on 2017/11/29.
 */
public class StudentController extends ActionSupport implements ModelDriven {
    private File upload;//上传文件在服务器内存上面 和界面file控件名字相同
    private String uploadFileName;//上传名字 flie控件名字加FileName
    private String uploadContenType;
    private String studentjson;
    public JSONObject jsonObject = new JSONObject();
    private  String cname;

    private Students stu= new Students();
    private Studentsservice studentsservice = new Studentsserviceimpl();
    private JSONArray jsonArray;


    public String uploadStudent() throws IOException {
            /*上传图片*/
        String pash = ServletActionContext.getServletContext().getRealPath("/img");
        File file = new File(pash, uploadFileName);
        FileUtils.copyFile(upload, file);
        String ajaxs = "img/" + uploadFileName;
        System.out.println(uploadFileName);
        jsonObject.put("ajaxs", ajaxs);
        studentjson = jsonObject.toString();
        return "studentjson";
    }
    public  String QueryStudentsAll(){
        List<Students>studentsList =studentsservice.QueryStudentsAll();
        jsonArray = JSONArray.fromObject(studentsList);
        for (Students s:studentsList){
            System.out.println(s.getSname());
        }
        studentjson = jsonArray.toString();
        System.out.println(studentjson);
        return  "studentjson";
    }
    public String QueryAndtiaojian(){
        System.out.println(cname);
        System.out.println(stu.getSname()+"123");
        System.out.println(stu.getSdnumber()+"456");
        System.out.println(stu.getSattend()+"789");

       List<Students> studentsList =   studentsservice.QueryBysnumberOrNameOrCnameOrsattend(stu.getSnumber(),stu.getSname(),cname,stu.getSattend());

        for (Students s:studentsList){
            System.out.println(s.getSname());
        }
        jsonArray = JSONArray.fromObject(studentsList);
        studentjson = jsonArray.toString();
        return  "studentjson";
    }
        public String QueryId(){
           Students students =   studentsservice.Queryandid(stu.getSid());
           jsonObject.put("students",students);
           studentjson = jsonObject.toString();
            return  "studentjson";
        }
    public String saveORupdateStudents(){
        if(stu.getSid()==null){
            Students students = new Students();
            students.setSnumber(stu.getSnumber());
            students.setSname(stu.getSname());
            students.setSsex(stu.getSsex());
            students.setSenter(stu.getSenter());
            students.setSbirthday(stu.getSbirthday());
            students.setSidnumber(stu.getSidnumber());
            students.setSprovince(stu.getSprovince());
            students.setSmahor(stu.getSmahor());
            students.setStel(stu.getStel());
            students.setSptel(stu.getSptel());
            students.setSdormitory(stu.getSdormitory());
            students.setSpolitics(stu.getSpolitics());
            students.setScity(stu.getScity());
            students.setSattend(stu.getSattend());
            students.setSaddress(stu.getSaddress());
            students.setSrelation(stu.getSrelation());
            students.setSbasicinfo(stu.getSbasicinfo());
            students.setSdnumber(stu.getSdnumber());
            students.setSeducation(stu.getSeducation());
            students.setSphoto(stu.getSphoto());
            students.setSpassword("123456");
            students.setSrole(2);
            studentsservice.saveORupdate(students);
            jsonObject.put("info","1");
            studentjson = jsonObject.toString();
        }else {
            Students students1 = studentsservice.Queryandid(stu.getSid());
            students1.setSnumber(stu.getSnumber());
            students1.setSname(stu.getSname());
            students1.setSsex(stu.getSsex());
            students1.setSenter(stu.getSenter());
            students1.setSbirthday(stu.getSbirthday());
            students1.setSidnumber(stu.getSidnumber());
            students1.setSprovince(stu.getSprovince());
            students1.setSmahor(stu.getSmahor());
            students1.setStel(stu.getStel());
            students1.setSptel(stu.getSptel());
            students1.setSdormitory(stu.getSdormitory());
            students1.setSpolitics(stu.getSpolitics());
            students1.setScity(stu.getScity());
            students1.setSattend(stu.getSattend());
            students1.setSaddress(stu.getSaddress());
            students1.setSrelation(stu.getSrelation());
            students1.setSbasicinfo(stu.getSbasicinfo());
            students1.setSdnumber(stu.getSdnumber());
            students1.setSeducation(stu.getSeducation());
            students1.setSphoto(stu.getSphoto());
            students1.setSpassword("123456");
            students1.setSrole(2);
            studentsservice.saveORupdate(students1);
        }


        return  "studentjson";
    }

    public String getStudentjson() {
        return studentjson;
    }

    public void setStudentjson(String studentjson) {
        this.studentjson = studentjson;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getUploadContenType() {
        return uploadContenType;
    }

    public void setUploadContenType(String uploadContenType) {
        this.uploadContenType = uploadContenType;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public Students getStu() {
        return stu;
    }

    public void setStu(Students stu) {
        this.stu = stu;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @Override
    public Object getModel() {
        return stu;
    }
}
