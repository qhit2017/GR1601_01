package com.jinmengjie.controller;

import com.jinmengjie.bean.Questionbank;
import com.jinmengjie.bean.Subject;
import com.jinmengjie.service.QuestionbankService;
import com.jinmengjie.service.SubjectService;
import com.jinmengjie.service.impl.QuestionServiceImpl;
import com.jinmengjie.service.impl.SubjectServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 金梦杰 on 2017/12/5/005.
 */
public class QuestionShowModelController extends ActionSupport {
  private SubjectService subjectService = new SubjectServiceImpl();
  private QuestionbankService questionbankService = new QuestionServiceImpl();
  private  Questionbank questionbank = new Questionbank();
  private  String  jsonstring;//json字符串
  private JSONArray questionstring;//json数组

    //定义两个变量接收service传过来的值(显示主界面的下拉框)
    private String subjectdirection;//方向
    private String subjectstage;//阶段

    //根据suid查询出数据的方法
    private Integer subjectid;
    private HttpSession httpSession = ServletActionContext.getRequest().getSession();
   /* //定义一个id跳转页面用
    private  Integer id;*/
    //显示题库管理界面下拉框的数据
    public String showselectinfo(){
        System.out.println(subjectdirection);
        System.out.println(subjectstage);
        //接收service传过来的数据
       List<Subject> subjectList = subjectService.selectSubjectInfoBySudirectionAndSustage(subjectdirection,subjectstage);
       //返回一个json类型的字符串
        questionstring = JSONArray.fromObject(subjectList);
        jsonstring =  questionstring.toString();

        return "showselectinfo";
    }

    //显示试题信息以及数量
    public  String showquestionnum(){
        System.out.println(subjectid);
        httpSession.setAttribute("id",subjectid);
        List<Questionbank>  questionbankList = questionbankService.selectAllInfoBySuid(subjectid);
        Integer number = 0;
        if(questionbankList==null||questionbankList.size()<=0){
            number=0;
        }else {
            number= questionbankList.size();
        }
        System.out.println(number);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("number",number);
        jsonObject.put("id",subjectid);
        jsonstring =  jsonObject.toString();
        return "showquestionnum";
    }
    //查询所有试题
    public String selectquestion(){
        Integer i = (Integer) httpSession.getAttribute("id");
        List<Questionbank>  questionbankList = questionbankService.selectAllInfoBySuid(i);
        if(!(questionbankList==null||questionbankList.size()<=0)){
            jsonstring = JSONArray.fromObject(questionbankList).toString();
        }
        return "selectquestion";
    }

    //跳转到试题详情页面
    public  String questioninfoshow(){
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        httpSession.setAttribute("id",subjectid);
        return "questioninfoshow";
    }



    //编辑试题
    public  String inserttestinfo(){
        questionbankService.insertOrUpdate(questionbank);
        return "questioncomputer";
    }



    public String getJsonstring() {
        return jsonstring;
    }

    public void setJsonstring(String jsonstring) {
        this.jsonstring = jsonstring;
    }

    public JSONArray getQuestionstring() {
        return questionstring;
    }

    public void setQuestionstring(JSONArray questionstring) {
        this.questionstring = questionstring;
    }

    public String getSubjectdirection() {
        return subjectdirection;
    }

    public void setSubjectdirection(String subjectdirection) {
        this.subjectdirection = subjectdirection;
    }

    public String getSubjectstage() {
        return subjectstage;
    }

    public void setSubjectstage(String subjectstage) {
        this.subjectstage = subjectstage;
    }

    public Integer getSubjectid() {
        return subjectid;
    }

    public void setSubjectid(Integer subjectid) {
        this.subjectid = subjectid;
    }


}
