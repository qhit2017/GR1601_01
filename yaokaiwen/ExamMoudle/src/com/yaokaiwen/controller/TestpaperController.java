package com.yaokaiwen.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yaokaiwen.bean.Dtnumber;
import com.yaokaiwen.bean.Questionbank;
import com.yaokaiwen.bean.Subject;
import com.yaokaiwen.bean.Testpaper;
import com.yaokaiwen.service.QuestionbankService;
import com.yaokaiwen.service.SubjectService;
import com.yaokaiwen.service.TestpaperService;
import com.yaokaiwen.service.impl.QuestionbankServiceImpl;
import com.yaokaiwen.service.impl.SubjectServiceImpl;
import com.yaokaiwen.service.impl.TestpaperServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

/**
 * Created by DELL on 2017/12/6.
 */
public class TestpaperController extends ActionSupport implements ModelDriven {
    private JSONArray jsonArray;
    private JSONObject jsonObject = new JSONObject();
    private String jsonstring;
    private HttpSession httpSession = ServletActionContext.getRequest().getSession();
    private String sudirection;
    private String sustage;
    private Testpaper testpaper = new Testpaper();
    private Integer id;
    private String type;
    private String state;
    private Integer [] array;
    private Subject subject = new Subject();
    private SubjectService subjectService = new SubjectServiceImpl();
    private TestpaperService testpaperService = new TestpaperServiceImpl();
    private QuestionbankService questionbankService = new QuestionbankServiceImpl();
    private List<Questionbank> questionbankList;
    private Dtnumber dtnumber = new Dtnumber();

    //根据科目查询试卷
    public String selecttestpaper(){
        List<Testpaper> testpaperList = testpaperService.selectTestpaperSetvice(id,state);
        jsonstring = JSONArray.fromObject(testpaperList).toString();
        return "jsonstring";
    }
    //根据科目查询试题
    public String selectquestionid(){
        questionbankList = questionbankService.selectQuestionbankBySuidService(id);
        jsonstring = JSONArray.fromObject(questionbankList).toString();
        return "jsonstring";
    }
    //选题添加试卷
    public String choiceinsertpaper(){
        testpaper.setTtype("笔试");
        testpaper.setTstate("未开考");
        for(int i =0;i<array.length;i++){
            Questionbank questionbank = new Questionbank();
            questionbank.setQid(array[i]);
            testpaper.getQuestionbankSet().add(questionbank);
        }
        testpaperService.insertTestpaperService(testpaper);
        return "choiceinsertpaper";
    }
    //随机添加试卷
    public String randominsertpaper(){
        testpaper.setTtype("笔试");
        testpaper.setTstate("未开考");

        return "randominsertpaper";
    }
    public String getSudirection() {
        return sudirection;
    }

    public void setSudirection(String sudirection) {
        this.sudirection = sudirection;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getJsonstring() {
        return jsonstring;
    }

    public void setJsonstring(String jsonstring) {
        this.jsonstring = jsonstring;
    }

    public HttpSession getHttpSession() {
        return httpSession;
    }

    public void setHttpSession(HttpSession httpSession) {
        this.httpSession = httpSession;
    }

    public String getSustage() {
        return sustage;
    }

    public void setSustage(String sustage) {
        this.sustage = sustage;
    }

    public Testpaper getTestpaper() {
        return testpaper;
    }

    public void setTestpaper(Testpaper testpaper) {
        this.testpaper = testpaper;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer[] getArray() {
        return array;
    }

    public void setArray(Integer[] array) {
        this.array = array;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Dtnumber getDtnumber() {
        return dtnumber;
    }

    public void setDtnumber(Dtnumber dtnumber) {
        this.dtnumber = dtnumber;
    }

    @Override
    public Object getModel() {
        return testpaper;
    }
}
