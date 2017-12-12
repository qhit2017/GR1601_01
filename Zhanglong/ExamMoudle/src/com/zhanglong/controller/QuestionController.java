package com.zhanglong.controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zhanglong.bean.Questionbank;
import com.zhanglong.bean.Subject;
import com.zhanglong.service.QuestionService;
import com.zhanglong.service.impl.QuestionServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/12/5 0005.
 */
public class QuestionController extends ActionSupport implements ModelDriven{
   private QuestionService service=new QuestionServiceImpl();
   private Subject subject=new Subject();
   private JSONObject jsonObject=new JSONObject();
   private JSONArray jsonArray;
   private String jsonstr;
   private String sudirection;
   private String sustage;
   private Integer suid;
   private Questionbank questionbank=new Questionbank();
   private String qa;
   private String qb;
   private String qc;
   private String qd;
   private Integer qid;
    private String qchapter;
    private Integer qtype;
    private String qcontent;
    private String qanswer;
    private String qdifficulty;

    public String chaxunxinxi(){
       List<Subject>subjectList= service.selectchaxunBySudirectionandSustage(subject.getSudirection(),subject.getSustage());
       if (subjectList!=null||subjectList.size()!=0){
           jsonArray=JSONArray.fromObject(subjectList);
       }
       jsonstr=jsonArray.toString();
       System.out.println("222222222222222"+jsonstr);
       System.out.println(jsonstr);
       return "chaxunxinxi";
   }

     public String chashumu(){
         List<Questionbank>questionbankList=service.selectshumu(subject.getSuid());
         Integer number=questionbankList.size();
         jsonObject.put("number",number);
         jsonObject.put("id",subject.getSuid());
         jsonstr=jsonObject.toString();
         return "chashumu";
     }
     //返回跳页面
   public String chaname(){
       Subject subject1=service.selectname(subject.getSuid());
       HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
       HttpSession httpSession = request.getSession();
       httpSession.setAttribute("subject",subject1);
       return "chaname";

   }
   //查询questionbank界面信息
    public String chaquestionbank(){
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        Subject subject2=(Subject) httpSession.getAttribute("subject");

       List<Questionbank>questionbankList=service.selectshumu(subject2.getSuid());
        if (questionbankList!=null||questionbankList.size()!=0){
            jsonArray=JSONArray.fromObject(questionbankList);
        }
        jsonstr=jsonArray.toString();
        return "chaquestionbank";

    }
    //添加信息
    public String saveorupdatexinxi(){
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        Subject subject1=(Subject) httpSession.getAttribute("subject");

        Subject subject2=new Subject();
        subject2.setSuid(subject1.getSuid());
        questionbank.setSubject(subject2);
        questionbank.setQa(qa);
        questionbank.setQd(qd);
        questionbank.setQb(qb);
        questionbank.setQc(qc);
        questionbank.setQchapter(qchapter);
        questionbank.setQanswer(qanswer);
        questionbank.setQcontent(qcontent);
        questionbank.setQdifficulty(qdifficulty);
        questionbank.setQtype(qtype);
        service.saveorupdatequestionbank(questionbank);
        System.out.println("111111111111111"+questionbank.getQcontent());
        jsonObject.put("result","true");
        jsonstr=jsonObject.toString();
        return "saveorupdatexinxi";
    }

    public Questionbank getQuestionbank() {
        return questionbank;
    }

    public void setQuestionbank(Questionbank questionbank) {
        this.questionbank = questionbank;
    }

    public String getQa() {
        return qa;
    }

    public void setQa(String qa) {
        this.qa = qa;
    }

    public String getQb() {
        return qb;
    }

    public void setQb(String qb) {
        this.qb = qb;
    }

    public String getQc() {
        return qc;
    }

    public void setQc(String qc) {
        this.qc = qc;
    }

    public String getQd() {
        return qd;
    }

    public void setQd(String qd) {
        this.qd = qd;
    }

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public String getQchapter() {
        return qchapter;
    }

    public void setQchapter(String qchapter) {
        this.qchapter = qchapter;
    }

    public Integer getQtype() {
        return qtype;
    }

    public void setQtype(Integer qtype) {
        this.qtype = qtype;
    }

    public String getQcontent() {
        return qcontent;
    }

    public void setQcontent(String qcontent) {
        this.qcontent = qcontent;
    }

    public String getQanswer() {
        return qanswer;
    }

    public void setQanswer(String qanswer) {
        this.qanswer = qanswer;
    }

    public String getQdifficulty() {
        return qdifficulty;
    }

    public void setQdifficulty(String qdifficulty) {
        this.qdifficulty = qdifficulty;
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

    public QuestionService getService() {
        return service;
    }

    public void setService(QuestionService service) {
        this.service = service;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
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

    public String getJsonstr() {
        return jsonstr;
    }

    public void setJsonstr(String jsonstr) {
        this.jsonstr = jsonstr;
    }

    @Override
    public Object getModel() {
        return subject;
    }
}
