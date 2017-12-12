package com.zhangerhui.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import com.zhangerhui.bean.Classes;
import com.zhangerhui.bean.Students;
import com.zhangerhui.service.ClassesService;
import com.zhangerhui.service.StudentService;
import com.zhangerhui.service.impl.ClassesServiceImpl;
import com.zhangerhui.service.impl.StudentServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2017/12/4/004.
 */


public class StudentController extends ActionSupport {
    //图片的上传功能
    //上传文件在服务器内存上与File控件名字相同
    private File upload;
    //上传文件名字 File控件的名字+FileName
    private String uploadFileName;
    //上传文件的类型
    private String uploadContentType;

    private String snumber;
    private String sname;
    private String ssex;
    private String senter;
    private Integer cid;
    private Integer sid;
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

    private String jsonresult;
    private JSONArray jsonarry;

    private Students newstudent = new Students();
    private JSONObject jsonObject = new JSONObject();
    private StudentService service = new StudentServiceImpl();
    private ClassesService cservice = new ClassesServiceImpl();


    //显示学生信息
    public String showstudentsinfo() {

        List<Students> studentsList = service.selectStudentsallinfo();
        if (studentsList != null || studentsList.size() != 0) {
            jsonarry = JSONArray.fromObject(studentsList);
        }
        jsonresult = jsonarry.toString();

        return "showsuccess";

    }

    //添加学生信息
    public String insertstudents() {

        Students students = new Students();
        students.setSnumber(snumber);
        students.setSname(sname);
        students.setSsex(ssex);
        students.setSenter(senter);
        Classes classes = new Classes();
        classes.setCid(cid);
        students.setClasses(classes);
        students.setSbirthday(sbirthday);
        students.setSidnumber(sidnumber);
        students.setSprovince(sprovince);
        students.setSmahor(smahor);
        students.setStel(stel);
        students.setSptel(sptel);
        students.setSdormitory(sdormitory);
        students.setSpolitics(spolitics);
        students.setScity(scity);
        students.setSattend(sattend);
        students.setSaddress(saddress);
        students.setSrelation(srelation);
        students.setSbasicinfo(sbasicinfo);
        students.setSdnumber(sdnumber);
        students.setSeducation(seducation);

        service.saveStudent(students);

        jsonObject.put("result", "true");
        jsonresult = jsonObject.toString();

        return "insertsuccess";

    }

    //根据下拉框查询信息
    public String selectfive() {

        String strcid = String.valueOf(cid);

        List<Students> studentsList = service.selectfive(snumber, sname, strcid, senter, smahor);

        if (studentsList != null || studentsList.size() != 0) {
            jsonarry = JSONArray.fromObject(studentsList);
        }
        jsonresult = jsonarry.toString();

        return "selectsuccess";
    }

    //删除学生信息
    public String deletestudent(){

        Students students = service.selectStudentInfoBySid(sid);
        service.deleteStudent(students);

        jsonObject.put("result", "true");
        jsonresult = jsonObject.toString();

        return "deletesuccess";
    }

    //重置学生密码
    public String restudentpwd(){

        Students students = service.selectStudentInfoBySid(sid);
        students.setSpassword("1234");

        service.update(students);

        jsonObject.put("result", "true");
        jsonresult = jsonObject.toString();

        return "respwdsuccess";
    }

    //上传文件方法
    public String uploadimg() {
        //uploadContextType---后缀
        //img
        String imgPath = ServletActionContext.getServletContext().getRealPath("/img");
        System.out.println("img" + imgPath);
        if (upload == null) {
            System.out.println("filenull");
        }
        //判断上传文件类型
        if (uploadFileName.contains(".jpg")) {
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

            jsonObject.put("path", path);
            jsonresult = jsonObject.toString();
        }
        return "upsuccess";

    }


    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
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

    public String getJsonresult() {
        return jsonresult;
    }

    public void setJsonresult(String jsonresult) {
        this.jsonresult = jsonresult;
    }

    public JSONArray getJsonarry() {
        return jsonarry;
    }

    public void setJsonarry(JSONArray jsonarry) {
        this.jsonarry = jsonarry;
    }

    public Students getNewstudent() {
        return newstudent;
    }

    public void setNewstudent(Students newstudent) {
        this.newstudent = newstudent;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
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

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getSbirthday() {
        return sbirthday;
    }

    public void setSbirthday(String sbirthday) {
        this.sbirthday = sbirthday;
    }

    public void setSidnumber(String sidnumber) {
        this.sidnumber = sidnumber;
    }

    public Integer getSdnumber() {
        return sdnumber;
    }

    public void setSdnumber(Integer sdnumber) {
        this.sdnumber = sdnumber;
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

    public String getSidnumber() {
        return sidnumber;
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
}
