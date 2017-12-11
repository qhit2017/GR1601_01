package com.guolonglong.controller;

import com.guolonglong.bean.QuestionBank;
import com.guolonglong.bean.Subject;
import com.guolonglong.service.QuestionBankService;
import com.guolonglong.service.impl.QuestionBankServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;

/**
 * Created by lenovo on 2017/12/6.
 */
public class QuestionBankController extends ActionSupport {
    private Integer suid;
    private String sudirection;
    private String sustage;
    private String sucourse;

    private JSONArray qbJson;
    private String jsonStr;


    private String filename;
    private InputStream inputStream;

    private QuestionBankService service = new QuestionBankServiceImpl();
    public String questionbankshowlist(){
        System.out.println(sudirection);
        System.out.println(sustage);
        List<Subject> subjectList = service.selectSubjectSuidCount(sudirection,sustage);
        qbJson = JSONArray.fromObject(subjectList);
        jsonStr = qbJson.toString();

        return "questionbankshowlist";
    }
    public String questionbankshow(){
        System.out.println(sucourse);
            List<QuestionBank> questionBankList = service.selectQuestionBankBySucourse(sucourse);
            Integer number = questionBankList.size();
            System.out.println(number);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("number",number);
            jsonStr = jsonObject.toString();

        return "questionbankshow";
    }
    public String questionbanklist(){
        System.out.println(suid);
        List<QuestionBank> questionBankList = service.selectQuestionBankBySuid(suid);
        qbJson = JSONArray.fromObject(questionBankList);
        jsonStr = qbJson.toString();
        return "questionbankinfo";
    }

    public String getmodal(){
        return "getmodal";
    }
    public InputStream getInputStream() {
        //找到filename完整路径
        String path = ServletActionContext.getServletContext().getRealPath("/file");
        String filepath = path+"\\"+filename;

        try {
            InputStream inputStream1 = new FileInputStream(filepath);
            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream1);
            return bufferedInputStream;

        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }
    public String insertorupdate(){
        JSONObject jsonObject = new JSONObject();
        JSONObject.fromObject(jsonObject);
        jsonStr = jsonObject.toString();
        return "";
    }
    public String cloosepaper(){
        List<QuestionBank> questionBankList = service.selectQuestionBankList();
        qbJson = JSONArray.fromObject(questionBankList);
        jsonStr = qbJson.toString();
        return "cloosepaper";
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public Integer getSuid() {
        return suid;
    }

    public void setSuid(Integer suid) {
        this.suid = suid;
    }

    public String getSudirection() {
        return sudirection;
    }

    public void setSudirection(String sudirection) {
        this.sudirection = sudirection;
    }

    public String getSustage() {
        return sustage;
    }

    public void setSustage(String sustage) {
        this.sustage = sustage;
    }

    public String getSucourse() {
        return sucourse;
    }

    public void setSucourse(String sucourse) {
        this.sucourse = sucourse;
    }

    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
    }

    public JSONArray getQbJson() {
        return qbJson;
    }

    public void setQbJson(JSONArray qbJson) {
        this.qbJson = qbJson;
    }
}
