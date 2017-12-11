package com.cj.Controller;

import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

/**
 * Created by cj on 2017/12/6.
 */
public class UploaDingController extends ActionSupport {
    private String jsonStr;

    /*file空件中的name 名*/
    private File upload;
    /*文件名 要求 控件名+FileName*/
    private String uploadFileName;
    /*格式*/
 private String    uploadContenType;





   public  String uploading(){
       System.out.println("123");
       System.out.println(upload);
       System.out.println(uploadFileName);
       System.out.println(uploadContenType);
       /*  动态获取 文件路径 */
        String  imagesPath=ServletActionContext.getServletContext().getRealPath("/images");

        //images 下面创建一个文件  文件名字和上传文件名字一样
        File deFile =new File(imagesPath,uploadFileName);

        //upload把内容从控件里读出来  写到deFile里
        try {
            /*工具类提供的copyFile（）把一个文件写到另一个文件里*/
            FileUtils.copyFile(upload,deFile);//原路径  目的地路径

        } catch (IOException e) {
            e.printStackTrace();
        }
        //把图片的路径+图片名  以字符串发回客户端
        String path="images"+uploadFileName;
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("path",path);
        jsonStr =jsonObject.toString();
       System.out.println("789");
       return"student";
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

    public String getUploadContenType() {
        return uploadContenType;
    }

    public void setUploadContenType(String uploadContenType) {
        this.uploadContenType = uploadContenType;
    }
}
