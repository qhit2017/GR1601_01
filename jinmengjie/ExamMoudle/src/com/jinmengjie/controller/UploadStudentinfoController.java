package com.jinmengjie.controller;

import com.jinmengjie.service.StudentServiceDao;
import com.jinmengjie.service.impl.StudentServiceDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/**
 * Created by 金梦杰 on 2017/12/5/005.
 */
public class UploadStudentinfoController extends ActionSupport {
    private StudentServiceDao studentServiceDao = new StudentServiceDaoImpl();
    //定义一个jsonarry数组；
    private JSONArray studentjson;

    private  String jsonstring;

    //上传图片(定义四个成员变量①定义一个String字符串)
    private File upload;//②上传文件到服务器内存上，和界面File控件相同的变量
    private String uploadFileName;//③上传文件的名字，file控件名字
    private String uploadContenType;//④文件格式



    //学生信息空模板下载(定义两个变量接收页面传过来的值)
    private  String filename;
    private InputStream inputStream;



    //+++++++++++++++++++++++++++++++++++++++++++++++++上传模板+++++++++++++++++++++++++++++++++++++++++++++++
    public  String uploadstudentinfomodel(){
        System.out.println(upload);
        System.out.println(uploadFileName);
        System.out.println(uploadContenType);

        String filepath =   ServletActionContext.getServletContext().getRealPath("/file");
        //②在img文件夹下创建文件名
        File desFile = new File(filepath,uploadFileName);
        //upload  把文件内容读出来写到desFile
        try {
            FileUtils.copyFile(upload,desFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //调用studentServiceDao传参数（学生信息导入）
        studentServiceDao.uploadstudentinfo(filepath);

        String path = "file/"+uploadFileName;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result","true");
        jsonstring = jsonObject.toString();

        System.out.println(jsonstring);
        return  "success";

    }

    public JSONArray getStudentjson() {
        return studentjson;
    }

    public void setStudentjson(JSONArray studentjson) {
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

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getJsonstring() {
        return jsonstring;
    }

    public void setJsonstring(String jsonstring) {
        this.jsonstring = jsonstring;
    }
}
