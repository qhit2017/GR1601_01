package com.yanlihua.controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yanlihua.bean.Questionbank;
import com.yanlihua.bean.Subject;
import com.yanlihua.bean.Teachers;
import com.yanlihua.service.PfwrittentestService;
import com.yanlihua.service.QuestionBankService;
import com.yanlihua.service.impl.PfwrittentestServiceImpl;
import com.yanlihua.service.impl.QuestionBankServiceImpl;
import com.yanlihua.util.Page;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 晏利花 on 2017/11/30.
 */
public class PfwrittentestController extends ActionSupport implements ModelDriven{
    private  PfwrittentestService pfwrittentestService=new PfwrittentestServiceImpl();
    private JSONArray jsonArray=new JSONArray();
    private JSONObject jsonObject=new JSONObject();
    private String questionbankinfo;
    private Questionbank questionbank=new Questionbank();
    private Subject subject=new Subject();
    private String sucourse;
    /*******分页*********/
    private Page page;
    private String strJsonPage;
    private String pageindex;
    public List<Questionbank> conformteacherinfo = new ArrayList();
    private QuestionBankService questionBankService=new QuestionBankServiceImpl();
    /***********************/
    public String selectallquestionbankinfo(){
      // List<Questionbank> questionbankList=pfwrittentestService.selectQuestionbankAllInfoPfwrittentestService();
        HttpSession httpSession = ServletActionContext.getRequest().getSession();

        Subject subject1=(Subject) httpSession.getAttribute("subject");
        //subject1.getSuid();

        List<Questionbank> questionbankList=questionBankService.selectSuidNumberInQuestionBankQuestionBankService(subject1.getSuid());
       if (questionbankList.size()!=0||questionbankList!=null) {
           jsonArray = JSONArray.fromObject(questionbankList);
       }
        //分页
        //共有多少条数据
        Integer totalcount=questionbankList.size();
       //定义当前页数的值
        Integer pagesize=5;

        if (httpSession.getAttribute("page") == null) {
            page = new Page();
        } else {
            page = (Page) httpSession.getAttribute("page");
        }
        page.setTotalCount(totalcount);
        page.setPageSize(pagesize);
        //当前页数是请求发过来的

        if (pageindex == null) {
            pageindex = "0";
        }
        page.setTotalCount(totalcount);
        page.setPageSize(pagesize);

        //当前页数是请求发过来的

        if (pageindex == null) {
            pageindex = "0";
        }

        Integer upageid = Integer.valueOf(pageindex);
        page.setPageIndex(upageid);


        System.out.println(page.getTotalCount()); //10
        System.out.println(page.getPageSize());   //2
        System.out.println(page.getPageCount());  //5
        System.out.println(page.getPageIndex());  //3
        System.out.println(page.getUppage());    //t
        System.out.println(page.getNextpage());   //T
        System.out.println(page.getDataStart());  //5

        for (int i = page.getDataStart() - 1; i < page.getDataEnd(); i++) {
            Questionbank questionbank=questionbankList.get(i);
            conformteacherinfo.add(questionbank);
        }
        jsonArray = JSONArray.fromObject(conformteacherinfo);
        questionbankinfo=jsonArray.toString();
        System.out.println(questionbankinfo);
        httpSession.setAttribute("page", page);
        return "selectallquestionbankinforesult";
    }

    public String getpage() {
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        Page page1 = (Page) httpSession.getAttribute("page");
        strJsonPage = JSONObject.fromObject(page1).toString();
        return "jsonpage";
    }

    //保存试题
    public String savequestion(){
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        Subject subject1=(Subject) httpSession.getAttribute("subject");
        Subject subject2=new Subject();
        subject2.setSuid( subject1.getSuid());
        questionbank.setSubject(subject2);

        pfwrittentestService.saveOrUpdateQuestionPfwrittentestService(questionbank);
        jsonObject.put("info","true");
        questionbankinfo=jsonObject.toString();
        return "savequestionresult";
    }

    //删除题更具pid
    public String deletequestionway(){
        Questionbank questionbank1=pfwrittentestService.selectQuestionbankInfoPfwrittentestService(questionbank.getQid());
        pfwrittentestService.deleteQuestionByqidPfwrittentestService(questionbank1);

        jsonObject.put("info","true");
        questionbankinfo=jsonObject.toString();
        return "deletequestionwayresult";
    }

    //模糊查询此试题题目类型是否存在
    public String selectlikesucourseway(){

        List<Subject> subjectList=pfwrittentestService.selectSubjectSucourseExtistPfwrittentestService(sucourse);
        System.out.println("+++++++++++++++++++++"+subjectList.size());
        if (subjectList.size()==1){
            jsonObject.put("info","true");
        }
        else{
            jsonObject.put("info","false");
        }
        questionbankinfo=jsonObject.toString();
        return "selectlikesucoursewayresult";
    }
    //根据id经行题的信息显示
    public String updatequestioninfoway(){
        System.out.println(questionbank.getQid());
        Questionbank questionbank1=pfwrittentestService.selectQuestionbankInfoPfwrittentestService(questionbank.getQid());
        jsonObject.put("questionbank",questionbank1);
        questionbankinfo=jsonObject.toString();
        System.out.println("11111111111111111111111111"+questionbankinfo);
        return "updatequestioninfowayresult";
    }

public String updatequestionway(){
    Questionbank questionbank1=pfwrittentestService.selectQuestionbankInfoPfwrittentestService(questionbank.getQid());
    questionbank1.setQa(questionbank.getQa());
    questionbank1.setQb(questionbank.getQb());
    questionbank1.setQc(questionbank.getQc());
    questionbank1.setQd(questionbank.getQd());
    questionbank1.setQcontent(questionbank.getQcontent());
    questionbank1.setQchapter(questionbank.getQchapter());
    questionbank1.setQanswer(questionbank.getQanswer());
    System.out.println("updatequestionway--------"+questionbank1.getQcontent());
    pfwrittentestService.saveOrUpdateQuestionPfwrittentestService(questionbank1);
    jsonObject.put("info","true");
    questionbankinfo=jsonObject.toString();
    return "updatequestionwayresult";
}


//显示添加试题这个界面(想多了)
   /* public String showsubjectname(){
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        Subject subject1=(Subject) httpSession.getAttribute("subject");
        System.out.println(subject1.getSucourse());
        jsonObject.put("sucourse",subject1.getSucourse());
        questionbankinfo=jsonObject.toString();
        return "showsubjectnameresult";
    }*/
    public PfwrittentestService getPfwrittentestService() {
        return pfwrittentestService;
    }

    public void setPfwrittentestService(PfwrittentestService pfwrittentestService) {
        this.pfwrittentestService = pfwrittentestService;
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

    public Questionbank getQuestionbank() {
        return questionbank;
    }

    public void setQuestionbank(Questionbank questionbank) {
        this.questionbank = questionbank;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public String getStrJsonPage() {
        return strJsonPage;
    }

    public void setStrJsonPage(String strJsonPage) {
        this.strJsonPage = strJsonPage;
    }

    public String getPageindex() {
        return pageindex;
    }

    public void setPageindex(String pageindex) {
        this.pageindex = pageindex;
    }

    public List<Questionbank> getConformteacherinfo() {
        return conformteacherinfo;
    }

    public void setConformteacherinfo(List<Questionbank> conformteacherinfo) {
        this.conformteacherinfo = conformteacherinfo;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public String getSucourse() {
        return sucourse;
    }

    public void setSucourse(String sucourse) {
        this.sucourse = sucourse;
    }

    @Override
    public Object getModel() {
        return questionbank;
    }
}
