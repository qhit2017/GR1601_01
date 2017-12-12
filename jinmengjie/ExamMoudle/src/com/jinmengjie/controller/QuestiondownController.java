package com.jinmengjie.controller;

import com.jinmengjie.dao.QuetionBankDao;
import com.jinmengjie.dao.impl.QuetionBankDaoImpl;
import com.jinmengjie.service.QuestionbankService;
import com.jinmengjie.service.impl.QuestionServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.*;

/**
 * Created by 金梦杰 on 2017/12/5/005.
 */
public class QuestiondownController extends ActionSupport {

    /*因为导入信息是基于上传的功能的，所以放一起*/
    //      上传文件

    //上传文件
    private String jsonstring;//json返回的结果(文件的路径)
    private File upload;//上传文件到服务器内存上（和File控件的名字相同）
    private  String uploadFileName;//上传文件的名字（File控件的名字+FileName）
    private String uploadContenType;//上传文件的类型

    //定义变量接收界面传输过来来的值（模板下载）
    private  String filename;
    private InputStream inputStream;



    //+++++++++++++++++++++++++++++++++++++++++++++++++上传模板+++++++++++++++++++++++++++++++++++++++++++++++
    public  String uploadquestioninfomodel(){
        System.out.println(upload);
        System.out.println(uploadFileName);
        System.out.println(uploadContenType);
        String filepath =   ServletActionContext.getServletContext().getRealPath("/file");
        //②在img文件夹下创建文件名
        File desFile = new File(filepath,uploadFileName);
        //upload  把文件内容读出来写到desFile
        String fpath = filepath+"\\"+uploadFileName;
        try {
            FileUtils.copyFile(upload,desFile);
            QuestionbankService questionbankService = new QuestionServiceImpl();
            System.out.println(filepath);
            questionbankService.uploadquestioninfo(fpath);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String path = "file/"+uploadFileName;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result","true");
        jsonstring = jsonObject.toString();
        System.out.println(jsonstring);
        return  "success";
    }



    public String getJsonstring() {
        return jsonstring;
    }

    public void setJsonstring(String jsonstring) {
        this.jsonstring = jsonstring;
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

    public String getUploadContenType() {
        return uploadContenType;
    }

    public void setUploadContenType(String uploadContenType) {
        this.uploadContenType = uploadContenType;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
    //学生页面的学生导出功能
    public  String questiondown(){

        return "success";
    }
    public InputStream getInputStream() {
        //考试试题模板下载
        //①找到filename的完整路径
        String path  = ServletActionContext.getServletContext().getRealPath("/file");
        String filepath = path+ "\\" + filename;

        try {
            //先定义一个输入流
            InputStream inputStream1 = new FileInputStream(filepath);
            //再写一个缓冲区流（是为了读文件读的更快）
            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream1);
            return  bufferedInputStream;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }


        return null;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
}
