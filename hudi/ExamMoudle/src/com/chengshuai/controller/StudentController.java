package com.chengshuai.controller;

import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

/**
 * Created by Administrator on 2017/11/29.
 */
public class StudentController extends ActionSupport {

    private String jsonStr;
    private File upload; //上传文件在服务器内存上 File控件名字相同
    private String uploadFileName; //上传文件名字 File控件的名字+FileName
    private String uploadContentType;


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
}
