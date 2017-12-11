package com.guolonglong.controller;

import com.guolonglong.service.StudentsService;
import com.guolonglong.service.impl.StudentsServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * Created by lenovo on 2017/12/5.
 */
public class StudentsExportController extends ActionSupport{
    private String filename;
    private InputStream inputStream;

    private StudentsService service = new StudentsServiceImpl();
    public String studentsexport(){
        return "successes";
    }

    public InputStream getInputStream(){
        String path = ServletActionContext.getServletContext().getRealPath("/file");
        String filepath = path+"\\"+filename;

        service.studentsExport(path);
        try {
            InputStream inputStream = new FileInputStream(filepath);
            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream);
            return bufferedInputStream;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
