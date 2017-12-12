package com.chengshuai.controller;

import com.chengshuai.bean.Questionbank;
import com.chengshuai.bean.Subject;
import com.chengshuai.service.Questionbankservice;
import com.chengshuai.service.impl.Questionbankserviceimpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * Created by slm on 2017/12/5.
 */
public class QuestionbankController extends ActionSupport {

    public JSONObject jsonObject = new JSONObject();

    private JSONArray jsonArray;

    private  String questionbankjson;

    private Questionbankservice questionbankservice = new Questionbankserviceimpl();

    private String jieduan;

    private String fangxiang;

    private Integer id;

    private Integer suid;


    public String  Queryquestionbankall(){
        List<Questionbank> questionbanks =  questionbankservice.QueryQuestionbankAll();

        jsonArray = JSONArray.fromObject(questionbanks);
        questionbankjson =jsonArray.toString();
         return  "questionbankjson";
    }

    public  String SubjectsudirectionAndsustage(){
        System.out.println(fangxiang);
        System.out.println(jieduan);

      List<Subject> subjectList =   questionbankservice.QuerySubjectsudirectionAndsustage(fangxiang,jieduan);
        for (Subject s:subjectList){
            System.out.println(s.getSucourse());
        }
        jsonArray = JSONArray.fromObject(subjectList);
        questionbankjson = jsonArray.toString();
        return  "questionbankjson";
    }

    public String Questionbanknumber(){

        List<Questionbank> questionbankList = questionbankservice.QuestionbankAllumber(id);
        /*计算出查询的数据有几条*/
        Integer number = questionbankList.size();
        System.out.println(number);
        jsonObject.put("id",id);
        jsonObject.put("number",number);
        questionbankjson = jsonObject.toString();
        return  "questionbankjson";
    }


    public String Questionbanknqeruyid(){
        /*根据id查询题库表中的数据*/
        List<Questionbank> questionbankList = questionbankservice.QuestionbankAllumber(id);

        return  "questionbankjson";
    }
    public Questionbankservice getQuestionbankservice() {
        return questionbankservice;
    }

    public void setQuestionbankservice(Questionbankservice questionbankservice) {
        this.questionbankservice = questionbankservice;
    }

    public String getJieduan() {
        return jieduan;
    }

    public void setJieduan(String jieduan) {
        this.jieduan = jieduan;
    }

    public String getFangxiang() {
        return fangxiang;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setFangxiang(String fangxiang) {
        this.fangxiang = fangxiang;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public String getQuestionbankjson() {
        return questionbankjson;
    }

    public Integer getSuid() {
        return suid;
    }

    public void setSuid(Integer suid) {
        this.suid = suid;
    }

    public void setQuestionbankjson(String questionbankjson) {
        this.questionbankjson = questionbankjson;
    }
}
