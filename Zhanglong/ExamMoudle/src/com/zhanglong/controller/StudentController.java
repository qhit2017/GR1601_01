package com.zhanglong.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zhanglong.bean.Classes;
import com.zhanglong.bean.Students;
import com.zhanglong.bean.Teachers;
import com.zhanglong.service.StudentService;

import com.zhanglong.service.impl.StudentServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import javax.sound.midi.Soundbank;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2017/12/2 0002.
 */
public class StudentController extends ActionSupport implements ModelDriven {
    //图片的上传功能
    //返回的json结果
    private String jsonStr;
    //上传文件在服务器内存上  File控件名字相同
    private File upload;
    //上传文件名字 File控件的名字+FileName
    private  String uploadFileName;
    //上传文件的类型
    private String uploadContentType;
    private Students students=new Students();
    private StudentService service=new StudentServiceImpl();
    private JSONArray jsonArray=new JSONArray();
    private String studentinfo;
    private String cid;
    private JSONObject jsonObject=new JSONObject();
    private Integer sid;



    public String chaxunsuoyou(){
        List<Students>studentsList=service.selectAllInfo();
        if (studentsList.size()!=0 ||studentsList!=null){
            jsonArray= JSONArray.fromObject(studentsList);
        }
        studentinfo=jsonArray.toString();
        System.out.println("=========="+studentinfo);
        return "chaxunsuoyou";
    }
    public String fivechaxun(){
        List<Students>studentsList=service.selectchaxunfive(students.getSnumber(),students.getSname(),cid,students.getSenter(),students.getSmahor());
        if (studentsList.size()!=0 ||studentsList!=null){
            jsonArray= JSONArray.fromObject(studentsList);
        }
        studentinfo=jsonArray.toString();
        System.out.println("=========="+studentinfo);
        return "fivechaxun";
    }

    //照片提交
    public String uploadimg(){
        //uploadContextType---后缀
        //img
        String imgPath= ServletActionContext.getServletContext().getRealPath("/img");
        System.out.println("img"+imgPath);
        if(upload==null){
            System.out.println("filenull");
        }
        System.out.println("uploadFileName  "+uploadFileName);
        //img下面创建一个文件 文件名字==上传文件一样
        File desFile=new File(imgPath,uploadFileName);
        System.out.println("imgPath"+imgPath);
        System.out.println("uploadFileName"+uploadFileName);

        //upload把内容读出来，写到desFile中
        try {
            FileUtils.copyFile(upload,desFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //把图片的路径+图片名字  字符串---->发回客户端
        String path="img/"+uploadFileName;
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("path",path);
        jsonStr=jsonObject.toString();
        return "success";
    }
    public String tianjiasaveorupdate(){
        Classes classes=new Classes();
        classes.setCid(Integer.parseInt(cid));
        students.setSpassword("1234");
        students.setSrole(2);
        students.setClasses(classes);
        service.SaveoruodateStudent(students);
        jsonObject.put("result","true");
        studentinfo=jsonObject.toString();
        return "tianjiasaveorupdate";
    }
    //根据ID进行删除
    public String shanchu(){
        /*Integer id=students.getSid();*/
        Students students1=service.selectStudentsBysid(students.getSid());
        service.deleteStudent(students1);
        jsonObject.put("result","true");
        studentinfo=jsonObject.toString();
        return "shanchu";

    }

    //重置密码（重置成统一的密码）
    public String chongzhi(){
        Students students1=service.selectStudentsBysid(students.getSid());
        students1.setSpassword("1234");
        service.SaveoruodateStudent(students1);
        jsonObject.put("result","true");
        studentinfo=jsonObject.toString();
        return "chongzhi";
    }
    //编辑显示页面
    public String addstudent1(){
        students=service.selectStudentsBysid(sid);
        System.out.println("11111111111"+sid);
        return "addstudent1";
    }


    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public StudentService getService() {
        return service;
    }

    public void setService(StudentService service) {
        this.service = service;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public String getStudentinfo() {
        return studentinfo;
    }

    public void setStudentinfo(String studentinfo) {
        this.studentinfo = studentinfo;
    }

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
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

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    @Override
    public Object getModel() {
        return students;
    }
}
