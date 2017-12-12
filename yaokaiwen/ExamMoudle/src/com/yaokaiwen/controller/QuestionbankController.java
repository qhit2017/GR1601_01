package com.yaokaiwen.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yaokaiwen.bean.Classes;
import com.yaokaiwen.bean.Questionbank;
import com.yaokaiwen.bean.Subject;
import com.yaokaiwen.bean.Teachers;
import com.yaokaiwen.service.ClassesService;
import com.yaokaiwen.service.QuestionbankService;
import com.yaokaiwen.service.SubjectService;
import com.yaokaiwen.service.impl.ClassesServiceImpl;
import com.yaokaiwen.service.impl.QuestionbankServiceImpl;
import com.yaokaiwen.service.impl.SubjectServiceImpl;
import com.yaokaiwen.util.Page;
import com.yaokaiwen.util.Upfile;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by DELL on 2017/11/26.
 */
public class QuestionbankController extends ActionSupport implements ModelDriven{
    private File upload;
    private String uploadFileName;
    private String uploadContentType;
    private JSONArray jsonArray;
    private JSONObject jsonObject = new JSONObject();
    private String jsonstring;
    private HttpSession httpSession = ServletActionContext.getRequest().getSession();
    private String sudirection;
    private String sustage;
    private Questionbank questionbank = new Questionbank();
    private Integer id;
    private SubjectService subjectService = new SubjectServiceImpl();
    private QuestionbankService questionbankService = new QuestionbankServiceImpl();
    private  List<Questionbank> questionbankList;
    private String path = ServletActionContext.getServletContext().getRealPath("/file");
    //根据方向阶段查询subject
    public String selectsubject(){
        List<Subject>subjectList = subjectService.selectSubjectByService(sudirection,sustage);
        if(!(subjectList==null||subjectList.size()<=0)){
            jsonstring = JSONArray.fromObject(subjectList).toString();
        }
        return "jsonstring";
    }
    //查询题目总数
    public String selectquestionnumber(){
        String number = questionbankService.selectnumberBySuidService(id);
        jsonObject.put("number",number);
        jsonObject.put("id",id);
        jsonstring = jsonObject.toString();
        return "jsonstring";
    }
    //根据suid查询 把suid sucourse存到session里
    public String selectquestionbysuid(){
        Subject subject = subjectService.selectSubjectBySuidService(id);
        if(subject!=null){
            httpSession.setAttribute("sucourse",subject.getSucourse());
        }
        httpSession.setAttribute("suid",id);
        return "selectquestionbysuid";
    }
    //根据suid查询问题
    public String selectquestion(){
        id = (Integer) httpSession.getAttribute("suid");
        questionbankList = questionbankService.selectQuestionbankBySuidService(id);
        jsonstring = JSONArray.fromObject(questionbankList).toString();
        return "jsonstring";
    }
    //上传导入
    public String uploadfilequestion(){
        Upfile upfile = new Upfile();
        String filepath = upfile.UpFileCreate(upload,uploadFileName,path);
        questionbankService.fileupInsertQuestionService(filepath);
        return "uploadfilequestion";
    }
    //添加试题
    public String insertquestion(){
        questionbankService.insertQuestionSerice(questionbank);
        return "insertquestion";
    }
    public String getJsonstring() {
        return jsonstring;
    }

    public void setJsonstring(String jsonstring) {
        this.jsonstring = jsonstring;
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

    public Questionbank getQuestionbank() {
        return questionbank;
    }

    public void setQuestionbank(Questionbank questionbank) {
        this.questionbank = questionbank;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<Questionbank> getQuestionbankList() {
        return questionbankList;
    }

    public void setQuestionbankList(List<Questionbank> questionbankList) {
        this.questionbankList = questionbankList;
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

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public Object getModel() {
        return questionbank;
    }
}

