package com.guolonglong.controller;

import com.guolonglong.bean.Classes;
import com.guolonglong.bean.Students;
import com.guolonglong.service.StudentsService;
import com.guolonglong.service.impl.StudentsServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.util.List;

/**
 * Created by lenovo on 2017/12/1.
 */
public class StudentsController  extends ActionSupport {
    private JSONArray studentsJson;
    private String strJson;
    //上传
    private String jsonStr;
    private File upload;//上传文件在服务器内存上 File控件名字相同
    private String uploadFileName;//上传文件的名字   File控件名字+FileName
    private String uploadContentType;
    //Studnts 的列
    private Integer sid;
    private String snumber;
    private String sname;
    private String ssex;
    private String senter;
    private String sbirthday;
    private String sidnumber;
    private String sprovince;
    private String smahor;
    private String stel;
    private String sptel;
    private String sdormitory;
    private String spolitics;
    private String scity;
    private String sattend;
    private String saddress;
    private String srelation;
    private String sbasicinfo;
    private Integer sdnumber;
    private String seducation;
    private String sphoto;
    private String spassword;
    private Integer srole;
    private Classes classes;

    private String cname;
    private String cbegin;
    private String cdirectiont;

    private StudentsService service = new StudentsServiceImpl();

    public String studentsshowlist(){
        List<Students> studentsList = service.selectStudentsAll();
        if (studentsList!=null && studentsList.size()!=0){
            studentsJson = JSONArray.fromObject(studentsList);
        }
        strJson = studentsJson.toString();
        return "student";
    }
    public String findstudents(){
        return "insertstudents";
    }
    //上传图片
    public String uploadImg(){
        //uploadFileName--后缀

        //img
        String imgPath = ServletActionContext.getServletContext().getRealPath("/img");


        //img下面创建一个文件 文件名字==上传文件名字一样
        File desFile = new File(imgPath,uploadFileName);

        //upload把内容读出来  写到desFile
        try {
            FileUtils.copyFile(upload,desFile);

        } catch (IOException e) {
            e.printStackTrace();
        }


        //把图片的路径+图片名字 字符串- ->发回客户端
        String path = "img/"+uploadFileName;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("path",path);
        jsonStr= jsonObject.toString();

        return "success";
    }
    //添加学生
    public String insertstudentsinfo(){
        return "classes";
    }
    public String findsid(){
        Students students = service.selectStudentById(sid);
        return "updatestudents";
    }

    Students students = new Students();
    public String updatepwd(){

        service.updatepwd(students);
        return "class";
    }
    public String delete(){
        service.deleteStudent(students);
        return "class";
    }

    public JSONArray getStudentsJson() {
        return studentsJson;
    }

    public void setStudentsJson(JSONArray studentsJson) {
        this.studentsJson = studentsJson;
    }

    public String getStrJson() {
        return strJson;
    }

    public void setStrJson(String strJson) {
        this.strJson = strJson;
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

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
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

    public String getSsex() {
        return ssex;
    }

    public void setSsex(String ssex) {
        this.ssex = ssex;
    }

    public String getSenter() {
        return senter;
    }

    public void setSenter(String senter) {
        this.senter = senter;
    }

    public String getSbirthday() {
        return sbirthday;
    }

    public void setSbirthday(String sbirthday) {
        this.sbirthday = sbirthday;
    }

    public String getSidnumber() {
        return sidnumber;
    }

    public void setSidnumber(String sidnumber) {
        this.sidnumber = sidnumber;
    }

    public String getSprovince() {
        return sprovince;
    }

    public void setSprovince(String sprovince) {
        this.sprovince = sprovince;
    }

    public String getSmahor() {
        return smahor;
    }

    public void setSmahor(String smahor) {
        this.smahor = smahor;
    }

    public String getStel() {
        return stel;
    }

    public void setStel(String stel) {
        this.stel = stel;
    }

    public String getSptel() {
        return sptel;
    }

    public void setSptel(String sptel) {
        this.sptel = sptel;
    }

    public String getSdormitory() {
        return sdormitory;
    }

    public void setSdormitory(String sdormitory) {
        this.sdormitory = sdormitory;
    }

    public String getSpolitics() {
        return spolitics;
    }

    public void setSpolitics(String spolitics) {
        this.spolitics = spolitics;
    }

    public String getScity() {
        return scity;
    }

    public void setScity(String scity) {
        this.scity = scity;
    }

    public String getSattend() {
        return sattend;
    }

    public void setSattend(String sattend) {
        this.sattend = sattend;
    }

    public String getSaddress() {
        return saddress;
    }

    public void setSaddress(String saddress) {
        this.saddress = saddress;
    }

    public String getSrelation() {
        return srelation;
    }

    public void setSrelation(String srelation) {
        this.srelation = srelation;
    }

    public String getSbasicinfo() {
        return sbasicinfo;
    }

    public void setSbasicinfo(String sbasicinfo) {
        this.sbasicinfo = sbasicinfo;
    }

    public Integer getSdnumber() {
        return sdnumber;
    }

    public void setSdnumber(Integer sdnumber) {
        this.sdnumber = sdnumber;
    }

    public String getSeducation() {
        return seducation;
    }

    public void setSeducation(String seducation) {
        this.seducation = seducation;
    }

    public String getSphoto() {
        return sphoto;
    }

    public void setSphoto(String sphoto) {
        this.sphoto = sphoto;
    }

    public String getSpassword() {
        return spassword;
    }

    public void setSpassword(String spassword) {
        this.spassword = spassword;
    }

    public Integer getSrole() {
        return srole;
    }

    public void setSrole(Integer srole) {
        this.srole = srole;
    }

    public Classes getClasses() {
        return classes;
    }

    public void setClasses(Classes classes) {
        this.classes = classes;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCbegin() {
        return cbegin;
    }

    public void setCbegin(String cbegin) {
        this.cbegin = cbegin;
    }

    public String getCdirectiont() {
        return cdirectiont;
    }

    public void setCdirectiont(String cdirectiont) {
        this.cdirectiont = cdirectiont;
    }
}
