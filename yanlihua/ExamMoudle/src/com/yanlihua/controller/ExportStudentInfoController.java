package com.yanlihua.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.yanlihua.service.StudentsService;
import com.yanlihua.service.impl.StudentsServiceImpl;
import org.apache.struts2.ServletActionContext;

import java.io.*;

/**
 * Created by 晏利花 on 2017/12/4.
 */
public class ExportStudentInfoController extends ActionSupport {
    private String filename;
    //输入流
    private InputStream inputStream;
    private StudentsService studentsService=new StudentsServiceImpl();

    public String exportstudentinfo(){

        return "success";
    }

    public InputStream getInputStream() {

        String path= ServletActionContext.getServletContext().getRealPath("/file");
        String filepath=path+"\\"+filename;
        studentsService.downloadStudentAllInfoService(path);

        // 与 StudentServiceImpl 的importStudentInfoService方法相呼应
        //2.studentsService.downloadStudentAllInfoService(filepath);
        try {
            InputStream inputStream1=new FileInputStream(filepath);
            BufferedInputStream bufferedInputStream=new BufferedInputStream(inputStream1);
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
