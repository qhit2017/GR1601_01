package com.yaokaiwen.controller;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.*;

/**
 * Created by DELL on 2017/12/4.
 */
public class FileDownController extends ActionSupport {
    private String filename;
    private InputStream inputStream;

    public String filedown(){
        System.out.println(filename);
        return "success";
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
    //下载模板
    public InputStream getInputStream() {
        String path = ServletActionContext.getServletContext().getRealPath("/file");
        String filepath = path+"\\"+filename;
        try {
            InputStream inputStream1 = new FileInputStream(filepath);
            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream1);
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
