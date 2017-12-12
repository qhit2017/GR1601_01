package com.yaokaiwen.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.yaokaiwen.service.StudentService;
import com.yaokaiwen.service.impl.StundentServiceImpl;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.*;

/**
 * Created by DELL on 2017/12/4.
 */
public class StudnetFileDownController extends ActionSupport {
    private File upload;
    private String uploadFileName;
    private String uploadContentType;
    private String filename;
    private InputStream inputStream;
    private StudentService studentService = new StundentServiceImpl();
    private String path = ServletActionContext.getServletContext().getRealPath("/file");

    public String filedownstudent(){
        return "success";
    }
    public String uploadfileup(){
        //文件路径
        String filepath = path+"\\"+uploadFileName;
        //创建文件
        File desfile = new File(path,uploadFileName);
        try {
            //把数据写到文件里
            FileUtils.copyFile(upload,desfile);
            studentService.fileupinsertstudentService(filepath);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "jsonstring";
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public InputStream getInputStream() {

        String filepath = studentService.filedownstudentService(path);
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
