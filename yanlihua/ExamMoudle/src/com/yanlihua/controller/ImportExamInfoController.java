package com.yanlihua.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.yanlihua.service.ExamService;
import com.yanlihua.service.impl.ExamServiceImpl;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

/**
 * Created by 晏利花 on 2017/12/5.
 */
public class ImportExamInfoController extends ActionSupport {
    //定义返回的信息的字符串
    private String jsonStr;
    //传输的文件
    private File importinfo;
    //上传文件名字 File控件的名字+FileName
    private String importinfoFileName;
    private ExamService examService=new ExamServiceImpl();


    public String importexaminfo(){
        //取出此工程的下file文件的打包路径
        String excelpath=ServletActionContext.getServletContext().getRealPath("/file");
        //写到磁盘中的目的文件
        File desfile=new File(excelpath,importinfoFileName);

        try {
            FileUtils.copyFile(importinfo,desfile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String path = excelpath + importinfoFileName;
      /*  System.out.println("importinfo"+importinfo);
        System.out.println("==================+++++++++++++++==="+path);*/
        examService.importExamInfoExamService(excelpath);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", "true");
        jsonStr = jsonObject.toString();
        return "success";
    }

    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
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
}
