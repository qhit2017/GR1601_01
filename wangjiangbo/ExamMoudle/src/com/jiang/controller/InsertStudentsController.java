package com.jiang.controller;

import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

/**
 * Created by dell on 2017/12/3.
 */
public class InsertStudentsController extends ActionSupport {
    private String jsonStr;
    private File upload;
    private String uploadFileName;
    private String uploadContentType;

    public String uploadImg(){
        String imgPath = ServletActionContext.getServletContext().getRealPath("/img");
        /*在此img下创建一个文件 文件名和上传文件名字一样*/
        File desfile = new File(imgPath,uploadFileName);
        /*upload把内容读出来 写到desfile中*/
        try {
            FileUtils.copyFile(upload,desfile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        /*把图片的路径名字 发回客户端*/
        String path = "img/" + uploadFileName;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("path",path);
        jsonStr = jsonObject.toString();
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
