package com.zhanglong.controller;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * Created by Administrator on 2017/12/4 0004.
 */
public class FileDownController extends ActionSupport {
    //下载模板
    private String filename;
    //输入流
    private InputStream inputStream;
    //下载模板
    public String filedown(){

        return "success";
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public InputStream getInputStream() {
        //找到filename完整路径
        String path= ServletActionContext.getServletContext().getRealPath("/file");
        String filepath=path+"\\"+filename;
        //new输入流
        try {
            InputStream inputStream=new FileInputStream(filepath);
            //利用缓冲流(快)
            BufferedInputStream bufferedInputStream=new BufferedInputStream(inputStream);
            System.out.println(bufferedInputStream);
            return bufferedInputStream;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
}
