package com.guolonglong.controller;

import com.guolonglong.bean.TestPaper;
import com.guolonglong.service.TestPaperService;
import com.guolonglong.service.impl.TestPaperServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;

import java.util.List;

/**
 * Created by lenovo on 2017/12/9.
 */
public class TestPaperController extends ActionSupport {
    private JSONArray jsonArray;
    private String jsonStr;

    private String sudirection;
    private String sustage;
    private String sucourse;
    private String ttype;
    private String tstate;

    private TestPaperService service = new TestPaperServiceImpl();
    public String testpaperlist(){
        System.out.println("走了");
        List<TestPaper> testPaperList = service.selectTestPaperList();
        System.out.println(testPaperList);
        if (testPaperList!=null && testPaperList.size()!=0){
            jsonArray = JSONArray.fromObject(testPaperList);
        }
        jsonStr = jsonArray.toString();
        return "testpaperlist";
    }

    public String seclettestpaperlist(){
        List<TestPaper> testPaperList = service.selectTestPaperBySudirectionOrSustageOrSucourseOrTtypeOrTstate(sudirection,sustage,sucourse,ttype,tstate);
        if (testPaperList!=null && testPaperList.size()==0){
            jsonArray = JSONArray.fromObject(testPaperList);
        }
        jsonStr = jsonArray.toString();
        return "seclettestpaperlist";
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
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

    public String getTtype() {
        return ttype;
    }

    public void setTtype(String ttype) {
        this.ttype = ttype;
    }

    public String getTstate() {
        return tstate;
    }

    public void setTstate(String tstate) {
        this.tstate = tstate;
    }
}
