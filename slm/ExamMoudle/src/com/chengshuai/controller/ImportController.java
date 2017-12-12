package com.chengshuai.controller;

import com.chengshuai.bean.Students;
import com.chengshuai.dao.Studentsdao;
import com.chengshuai.dao.impl.Studentsimpl;
import com.chengshuai.service.Studentsservice;
import com.chengshuai.service.impl.Studentsserviceimpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

/**
 * Created by slm on 2017/12/4.
 *
 * 导入数据
 */
public class ImportController extends ActionSupport {

    private File upload1;//上传文件在服务器内存上面 和界面file控件名字相同
    private String upload1FileName;//上传名字 flie控件名字加FileName
    private String uploadContenType;

    private Students stu= new Students();
    private Studentsservice studentsservice = new Studentsserviceimpl();
    private JSONArray jsonArray;
    private String studentjson;
    public JSONObject jsonObject = new JSONObject();

    public  String Importbiaoge() throws IOException {
        String pash = ServletActionContext.getServletContext().getRealPath("/flie");

        String files = pash+"\\"+upload1FileName;

        File file = new File(pash, upload1FileName);
        FileUtils.copyFile(upload1, file);
        studentsservice.doloadStudentsSave(files);

        jsonObject.put("info", "1");
        studentjson = jsonObject.toString();
        return "studentjson";
    }

    public File getUpload1() {
        return upload1;
    }

    public void setUpload1(File upload1) {
        this.upload1 = upload1;
    }

    public String getUpload1FileName() {
        return upload1FileName;
    }

    public void setUpload1FileName(String upload1FileName) {
        this.upload1FileName = upload1FileName;
    }

    public String getUploadContenType() {
        return uploadContenType;
    }

    public void setUploadContenType(String uploadContenType) {
        this.uploadContenType = uploadContenType;
    }

    public Students getStu() {
        return stu;
    }

    public void setStu(Students stu) {
        this.stu = stu;
    }

    public Studentsservice getStudentsservice() {
        return studentsservice;
    }

    public void setStudentsservice(Studentsservice studentsservice) {
        this.studentsservice = studentsservice;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public String getStudentjson() {
        return studentjson;
    }

    public void setStudentjson(String studentjson) {
        this.studentjson = studentjson;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }
}
