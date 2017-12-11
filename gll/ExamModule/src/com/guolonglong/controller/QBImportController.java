package com.guolonglong.controller;

import com.guolonglong.service.QuestionBankService;
import com.guolonglong.service.StudentsService;
import com.guolonglong.service.impl.QuestionBankServiceImpl;
import com.guolonglong.service.impl.StudentsServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

/**
 * Created by lenovo on 2017/12/5.
 */
public class QBImportController extends ActionSupport {
    //上传
    private String jsonStr;
    private File upload;//上传文件在服务器内存上 File控件名字相同
    private String uploadFileName;//上传文件的名字   File控件名字+FileName
    private String uploadContentType;


    private QuestionBankService service = new QuestionBankServiceImpl();
    //上传students.xlsx
    public String questionbankimport(){
        //uploadFileName---后缀

        //file
        String filePath = ServletActionContext.getServletContext().getRealPath("/file");
        System.out.println(filePath);
        service.questionbankImport(filePath);
        //在file 下创建一个文件  文件名字 = 上传文件名字
        File desFile = new File(filePath,uploadFileName);
        //upload 把文件读出来   写到desFile
        try {
            FileUtils.copyFile(upload,desFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //把文件的路径 + 文件名字 + 以字符串-----》客户端
        String path = "file/"+uploadFileName;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("path",path);
        jsonStr = jsonObject.toString();
        return "success";
    }

    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
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
