package com.zhanglong.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zhanglong.bean.Questionbank;
import com.zhanglong.service.QuestionService;
import com.zhanglong.service.StudentService;
import com.zhanglong.service.impl.QuestionServiceImpl;
import com.zhanglong.service.impl.StudentServiceImpl;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/**
 * Created by Administrator on 2017/12/4 0004.
 */
public class DaoruController extends ActionSupport {
    private String jsonStr;
    private StudentService service=new StudentServiceImpl();
    private QuestionService service1=new QuestionServiceImpl();
    private String importinfoFileName;
    private File importinfo;

    public String daorucontroller(){
        //找到完整路径
        String excelshuju= ServletActionContext.getServletContext().getRealPath("/file");
        File file=new File(excelshuju,importinfoFileName);
        System.out.println("11111111111"+file);
        try {
            FileUtils.copyFile(importinfo, file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String path="file/" +importinfoFileName;
        service.daoruStudent(excelshuju);
        service1.daoruquestion(excelshuju);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", "true");
        jsonStr = jsonObject.toString();
        return "success";
    }

    public QuestionService getService1() {
        return service1;
    }

    public void setService1(QuestionService service1) {
        this.service1 = service1;
    }

    public File getImportinfo() {
        return importinfo;
    }

    public void setImportinfo(File importinfo) {
        this.importinfo = importinfo;
    }

   /* public StudentService getService() {
        return service;
    }

    public void setService(StudentService service) {
        this.service = service;
    }
*/
    public String getImportinfoFileName() {
        return importinfoFileName;
    }

    public void setImportinfoFileName(String importinfoFileName) {
        this.importinfoFileName = importinfoFileName;
    }

    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
    }
}
