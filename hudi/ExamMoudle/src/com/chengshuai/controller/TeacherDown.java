package com.chengshuai.controller;

import com.chengshuai.service.TeacherService;
import com.chengshuai.service.TeacherServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * Created by Administrator on 2017/12/4.
 */
public class TeacherDown extends ActionSupport {
    private String filename;
    private InputStream InputStream;

    ;
    private TeacherService teacherService = new TeacherServiceImpl();

    public String teacherdown(){
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
        String path = ServletActionContext.getServletContext().getRealPath("/file");
        String filepath = path+"\\"+filename;

        //调用service
        teacherService.downloadTeachers(path);

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
        InputStream = inputStream;
    }
}
