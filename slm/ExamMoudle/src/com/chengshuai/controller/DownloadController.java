package com.chengshuai.controller;

import com.chengshuai.service.Studentsservice;
import com.chengshuai.service.impl.Studentsserviceimpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * Created by slm on 2017/12/5.
 */
public class DownloadController extends ActionSupport {
    private  String fileName;

    private InputStream inputStream;

    public  String Download(){

        return "secces";
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public InputStream getInputStream() {
        String path  = ServletActionContext.getServletContext().getRealPath("/flie");
        String lj = path+"\\"+fileName;
        Studentsservice studentsservice = new Studentsserviceimpl();
        studentsservice.dowloadStudentsAll(path);
        try {
            InputStream inputStream1 = new FileInputStream(lj);

            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream1);
            return  bufferedInputStream;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return  null;
        }
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
}
