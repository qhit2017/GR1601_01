package com.yanlihua.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.yanlihua.service.StudentsService;
import com.yanlihua.service.impl.StudentsServiceImpl;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

/**
 * Created by 晏利花 on 2017/12/4.
 */
public class ImportStudentInfoController extends ActionSupport {
    private String jsonStr;
    private File importinfo;
    private  String importinfoFileName;
    private StudentsService studentsService=new StudentsServiceImpl();

    public String importexcel(){
        String excelPath= ServletActionContext.getServletContext().getRealPath("/file");
        System.out.println("file"+excelPath);
        if(importinfo==null){
            System.out.println("==================filenull");
        }
        File desFile = new File(excelPath, importinfoFileName);
        System.out.println("desFile"+desFile);
        try {
            FileUtils.copyFile(importinfo, desFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String path = "file/" + importinfoFileName;
        studentsService.importStudentInfoService(excelPath);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", "true");
        jsonStr = jsonObject.toString();
        return "success";
    }

    public File getImportinfo() {
        return importinfo;
    }

    public void setImportinfo(File importinfo) {
        this.importinfo = importinfo;
    }

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
