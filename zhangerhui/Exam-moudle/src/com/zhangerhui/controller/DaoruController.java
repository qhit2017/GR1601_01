package com.zhangerhui.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zhangerhui.service.StudentService;
import com.zhangerhui.service.impl.StudentServiceImpl;
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
    private String importinfoFileName;
    private File importinfo;

    public String daorucontroller(){
        //找到完整路径
        String excelshuju= ServletActionContext.getServletContext().getRealPath("/file");
        File file=new File(excelshuju,importinfoFileName);

        try {
            FileUtils.copyFile(importinfo, file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String path="file/" +importinfoFileName;
        service.importStudentInfos(excelshuju);

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
