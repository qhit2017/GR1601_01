package com.yanlihua.controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yanlihua.bean.*;
import com.yanlihua.dao.ClassesDao;
import com.yanlihua.dao.impl.ClassesDaoImpl;
import com.yanlihua.service.ClassesService;
import com.yanlihua.service.ExamService;
import com.yanlihua.service.impl.ClassesServiceImpl;
import com.yanlihua.service.impl.ExamServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.StrutsStatics;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by 晏利花 on 2017/12/3.
 */
public class ExamController extends ActionSupport implements ModelDriven {
    private ExamService examService = new ExamServiceImpl();
    private JSONObject jsonObject = new JSONObject();
    private Testpaper testpaper = new Testpaper();
    private JSONArray jsonArray;
    private String examinfo;
    private Integer suid;
    private Grade grade = new Grade();
    private Integer cid;
    private String gbegintime;

    //试卷列表的所有信息显示
    public String selecttestpaperallinfoway() {
        List<Testpaper> testpaperList = examService.selectTestpaperAllInfoExamService();

        for (Testpaper t:testpaperList){
            /*System.out.println(t.getGradeSet().size());*/
            t.setGradeSet(new HashSet<>(0));

        }


        if (testpaperList.size() != 0 || testpaperList != null) {
            jsonArray = JSONArray.fromObject(testpaperList);
        }
        examinfo = jsonArray.toString();
        System.out.println("examinfo============" + examinfo);
        return "selecttestpaperallinfowayresult";
    }

    //查询所有科目信息将名字显示到下拉框中
    public String selectsubjectinfoway() {
        List<Subject> subjectList = examService.selectSubjectAllInfoExamService();
        if (subjectList.size() != 0 || subjectList != null) {
            jsonArray = JSONArray.fromObject(subjectList);
        }
        examinfo = jsonArray.toString();
        return "selectsubjectinfowayresult";
    }

    //五条件查询
    public String selectinfobyfiveconditionway() {

        List<Testpaper> testpaperList = examService.selectTestpaperInfoByFiveConditionExamService(suid, testpaper.getTtype(), testpaper.getTstate());
        if (testpaperList.size() != 0 || testpaperList != null) {
            System.out.println(testpaperList.size());
            jsonArray = JSONArray.fromObject(testpaperList);
        }
        examinfo = jsonArray.toString();
        return "selectinfobyfiveconditionwayresult";
    }

    //开始考试
    public String begintest() {
        //System.out.println("tid================"+testpaper.getTid());
        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("tid", testpaper.getTid());

        return "begintestresult";
    }

    //开始考试对成绩表中的数据进行添加
    public String saveinfointogradeway() {
        //testpaper.getTid();
        //根据tid查询状态

        Classes classes =new Classes();
        classes.setCid(cid);

        Grade grade =new Grade();
        grade.setGbegintime(gbegintime);
        grade.setGscore(0);


        Testpaper testpaper1 =new Testpaper();
        testpaper1.setTid(testpaper.getTid());

        examService.saveinfointogradeExamService(grade,classes,testpaper1);
        jsonObject.put("result", "true");
        examinfo = jsonObject.toString();
        return "saveinfointogradewayresult";
    }

    public String getGbegintime() {
        return gbegintime;
    }

    public void setGbegintime(String gbegintime) {
        this.gbegintime = gbegintime;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public ExamService getExamService() {
        return examService;
    }

    public void setExamService(ExamService examService) {
        this.examService = examService;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public Testpaper getTestpaper() {
        return testpaper;
    }

    public void setTestpaper(Testpaper testpaper) {
        this.testpaper = testpaper;
    }

    public Integer getSuid() {
        return suid;
    }

    public void setSuid(Integer suid) {
        this.suid = suid;
    }


    public String getExaminfo() {
        return examinfo;
    }

    public void setExaminfo(String examinfo) {
        this.examinfo = examinfo;
    }

    @Override
    public Object getModel() {
        return testpaper;
    }
}
