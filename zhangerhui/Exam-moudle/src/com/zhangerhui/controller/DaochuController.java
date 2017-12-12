package com.zhangerhui.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zhangerhui.service.StudentService;
import com.zhangerhui.service.impl.StudentServiceImpl;
import org.apache.struts2.ServletActionContext;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * Created by Administrator on 2017/12/4 0004.
 */
public class DaochuController extends ActionSupport {

    private String filename;
    //输入流
    private InputStream inputStream;
    private StudentService service = new StudentServiceImpl();

    public String daochucontroller() {

        return "success";
    }


    public InputStream getInputStream() {
        //找到filename完整路径
        String path = ServletActionContext.getServletContext().getRealPath("/file");
        String filepath = path + "\\" + filename;
        //调用service
        service.downloadStudentAllInfoService(path);
        try {

            InputStream inputStream1 = new FileInputStream(filepath);
            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream1);
            return bufferedInputStream;

        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        }

    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public StudentService getService() {
        return service;
    }

    public void setService(StudentService service) {
        this.service = service;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
}
