package com.yanlihua.controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yanlihua.bean.Questionbank;
import com.yanlihua.bean.Subject;
import com.yanlihua.service.QuestionBankService;
import com.yanlihua.service.impl.QuestionBankServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.StrutsStatics;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 晏利花 on 2017/12/5.
 */
public class QuestionBankController extends ActionSupport implements ModelDriven {
    private Subject subject=new Subject();
    private QuestionBankService questionBankService=new QuestionBankServiceImpl();
    private JSONArray jsonArray;
    private JSONObject jsonObject=new JSONObject();
    private String questionbankinfo;

    public String selectinfobytwocond(){

        List<Subject> subjectList=questionBankService.selectSubjectInfoBySudAndSusQuestionService(subject.getSudirection(),subject.getSustage());
        if (subjectList != null||subjectList.size()!=0) {
            jsonArray = JSONArray.fromObject(subjectList);
        }
        questionbankinfo=jsonArray.toString();
        System.out.println(questionbankinfo);
        return "selectinfobytwocondresult";
    }

//每个科目下笔试题的数量
    public String selectquestionnumber(){
        System.out.println("subject.getSuid()+++++++++++++++"+subject.getSuid());
        List<Questionbank> subjectList=questionBankService.selectSuidNumberInQuestionBankQuestionBankService(subject.getSuid());
        Integer number=subjectList.size();
        System.out.println("number========================"+number);
        jsonObject.put("number",number);
        jsonObject.put("id",subject.getSuid());
        questionbankinfo=jsonObject.toString();
        System.out.println("selectquestionnumberresult============"+questionbankinfo);
        return "selectquestionnumberresult";
    }

//根据id查询科目名称进行查询
public String selectsnamebysuid(){
    Subject subject1=questionBankService.selectSubjectnameBySuidQuestionBankService(subject.getSuid());
    HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
    HttpSession httpSession = request.getSession();
    httpSession.setAttribute("subject",subject1);

    return "selectsnamebysuidresult";
}
    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public String getQuestionbankinfo() {
        return questionbankinfo;
    }

    public void setQuestionbankinfo(String questionbankinfo) {
        this.questionbankinfo = questionbankinfo;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    @Override
    public Object getModel() {
        return subject;
    }
}
