package com.yanlihua.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yanlihua.bean.Classes;
import com.yanlihua.bean.Students;
import com.yanlihua.service.impl.StudentsServiceImpl;
import com.yanlihua.service.StudentsService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.util.List;

/**
 * Created by 晏利花 on 2017/11/29.
 */
public class StudentsController extends ActionSupport  implements ModelDriven{
    //图片的上传功能
    //返回的json结果
    private String jsonStr;
    //上传文件在服务器内存上与File控件名字相同
    private File upload;
   //上传文件名字 File控件的名字+FileName
    private  String uploadFileName;
    //上传文件的类型
    private String uploadContentType;

    private JSONObject jsonObject=new JSONObject();
    private JSONArray jsonArray =new JSONArray();
    private StudentsService studentsService=new StudentsServiceImpl();
    private String studentinfo;
    //Students对象
    private Students students=new Students();
    private String cid;
    private String sid;



    //上传文件方法
    public String uploadimg(){
        //uploadContextType---后缀
        //img
        String imgPath= ServletActionContext.getServletContext().getRealPath("/img");
        System.out.println("img"+imgPath);
        if(upload==null){
            System.out.println("filenull");
        }
        //判断上传文件类型
        if(uploadFileName.contains(".jpg")) {
            System.out.println("uploadFileName  " + uploadFileName);
            //img下面创建一个文件 文件名字==上传文件一样
            File desFile = new File(imgPath, uploadFileName);
            System.out.println("imgPath" + imgPath);
            System.out.println("uploadFileName" + uploadFileName);

            //upload把内容读出来，写到desFile中
            try {
                FileUtils.copyFile(upload, desFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
            //把图片的路径+图片名字  字符串---->发回客户端
            String path = "img/" + uploadFileName;
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("path", path);
            jsonStr = jsonObject.toString();
        }
            return "success";

    }

    //查询班级的所有信息
    public String selectstudentinfoway(){
        List<Students> studentsList=studentsService.selectStudentAllInfoStudentsService();
        System.out.println("studentsList.size()"+studentsList.size());
        if (studentsList.size()!=0||studentsList!=null){
            jsonArray = JSONArray.fromObject(studentsList);
        }
        studentinfo=jsonArray.toString();
        System.out.println("========================"+studentinfo);
        return "selectclassinfowayresult";
    }

    //五个条件进行查询
    public String fiveconditionselectway(){
        //学号   姓名   班级   入学年份    就读方向
        List<Students> studentsList=studentsService.selectStudentInfoFiveConditionStudentService(students.getSnumber(),students.getSname(),cid,students.getSenter(),students.getSmahor());
        if (studentsList.size()!=0||studentsList!=null){
            jsonArray = JSONArray.fromObject(studentsList);
        }
        studentinfo=jsonArray.toString();
       // System.out.println("========================"+studentinfo);
        return "fiveconditionselectwayresult";
    }

    //保存学生信息
    public String addstudentinfoway(){
        Classes classes=new Classes();
        classes.setCid(Integer.parseInt(cid));
        students.setSpassword("123456");
        students.setSrole(2);
        students.setClasses(classes);


        studentsService.saveOrUpdateStudentInfoStudentsService(students);
        jsonObject.put("info","true");
        studentinfo=jsonObject.toString();
        return "addstudentinfowayresult";
    }

    //显示信息(根据sid)
    public String selectstudentinfobysidway(){
        Students students1 = studentsService.selectStudentInfoBySidStudentsService(students.getSid());
        jsonObject.put("student",students1);
        studentinfo=jsonObject.toString();
        System.out.println(studentinfo);
        return "selectstudentinfobysidwayresult";
    }

    //一键密码重置功能
    public String resetpwd(){
        Students students1 = studentsService.selectStudentInfoBySidStudentsService(students.getSid());
        students1.setSpassword("123456");
        studentsService.saveOrUpdateStudentInfoStudentsService(students1);
        jsonObject.put("info","true");
        studentinfo=jsonObject.toString();
        return "resetpwdresult";
    }
    //对象删除功能
    public String deleteobj(){
        Students students1 = studentsService.selectStudentInfoBySidStudentsService(students.getSid());
        studentsService.deleteStudentObjectStudentService(students1);
        jsonObject.put("info","true");
        studentinfo=jsonObject.toString();
        return "deleteobjresult";
    }



    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
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

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public StudentsService getStudentsService() {
        return studentsService;
    }

    public void setStudentsService(StudentsService studentsService) {
        this.studentsService = studentsService;
    }

    public String getStudentinfo() {
        return studentinfo;
    }

    public void setStudentinfo(String studentinfo) {
        this.studentinfo = studentinfo;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }



    @Override
    public Object getModel() {
        return students;
    }
}
