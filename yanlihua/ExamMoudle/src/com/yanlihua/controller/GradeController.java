package com.yanlihua.controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yanlihua.bean.Grade;
import com.yanlihua.bean.Testpaper;
import com.yanlihua.service.ExamService;
import com.yanlihua.service.GradeService;
import com.yanlihua.service.impl.ExamServiceImpl;
import com.yanlihua.service.impl.GradeServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

/**
 * Created by 晏利花 on 2017/12/5.
 */
public class GradeController extends ActionSupport implements ModelDriven{
    private Testpaper testpaper=new Testpaper();
    private GradeService gradeService=new GradeServiceImpl();
    private JSONArray jsonArray;
    private String testpaperinfo;
    private Integer suid;
    private ExamService examService=new ExamServiceImpl();
    public JSONObject jsonObject = new JSONObject();

    //试卷列表的所有信息显示
    public String selecttestpaperallinfoway1(){
        List<Testpaper> testpaperList=examService.selectTestpaperAllInfoExamService();
        System.out.println("---------------selecttestpaperallinfoway1"+testpaperList.size());
        if (testpaperList.size()!=0||testpaperList!=null){
            jsonArray=JSONArray.fromObject(testpaperList);
        }
        testpaperinfo= jsonArray.toString();
        System.out.println("examinfo============"+testpaperinfo);
        return "selecttestpaperallinfoway1result";
    }

    //下拉框条件查询
    public String selectconformconditioninfo(){
        List<Testpaper> testpaperList=gradeService.selectSubjectByNameAndTypeGradeService(suid,testpaper.getTtype());
        if (testpaperList.size()!=0||testpaperList!=null){
            System.out.println(testpaperList.size());
            jsonArray= JSONArray.fromObject(testpaperList);
        }
        testpaperinfo= jsonArray.toString();
        System.out.println("testpaperinfo================="+testpaperinfo);
        return "selectconformconditioninforesult";
    }
 //grade查看成绩按钮
    public String selectgradebnt(){
        System.out.println("selectgradebnt1111111111111111111111-"+testpaper.getTid());
        /*Testpaper testpaper1=new Testpaper();
        testpaper1.setTid(testpaper.getTid());
        //通过tid查询Testpaper级联到grade表中
        Testpaper testpaper2=examService.updateTestpaperByTidExamService(1);
        Set<Grade> gradeSet=testpaper2.getGradeSet();
        if (gradeSet.size()!=0||gradeSet!=null){
            jsonArray=JSONArray.fromObject(gradeSet);
        }
        testpaperinfo= jsonArray.toString();*/
        Testpaper testpaper2=examService.updateTestpaperByTidExamService(testpaper.getTid());
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        httpSession.setAttribute("testpaper",testpaper2);
        return "selectgradebntresult";
    }
//查看成绩的界面信息显示
    public String showinterfaceinfoway(){
        //Testpaper testpaper2=examService.updateTestpaperByTidExamService(testpaper.getTid());
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        Testpaper  testpaper2=(Testpaper) httpSession.getAttribute("testpaper");
       // Set<Grade> gradeSet=testpaper2.getGradeSet();
        jsonArray= JSONArray.fromObject(testpaper2);
        testpaperinfo= jsonArray.toString();
        System.out.println("testpaperinfo================="+testpaperinfo);
        return "showinterfaceinfowayresult";
    }

//考试详情跳页面
    public String viewtestdetailsway(){
        Testpaper testpaper2=examService.updateTestpaperByTidExamService(testpaper.getTid());
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        httpSession.setAttribute("testpaper",testpaper2);
        return "viewtestdetailswayresult";
    }
//发送请求去tid
    public String selecttidway(){
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        Testpaper testpaper=(Testpaper) httpSession.getAttribute("testpaper");
        //System.out.println("44444444444444444444-"+testpaper.getTid());
        Integer tid=testpaper.getTid();
        jsonObject.put("tid",tid);
        testpaperinfo=jsonObject.toString();
        //System.out.println("5555555555555555555555555555-"+testpaperinfo);
        return "selecttidwayresult";
    }
    public Integer getSuid() {
        return suid;
    }

    public void setSuid(Integer suid) {
        this.suid = suid;
    }

    public GradeService getGradeService() {
        return gradeService;
    }

    public void setGradeService(GradeService gradeService) {
        this.gradeService = gradeService;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public String getTestpaperinfo() {
        return testpaperinfo;
    }

    public void setTestpaperinfo(String testpaperinfo) {
        this.testpaperinfo = testpaperinfo;
    }

    @Override
    public Object getModel() {
        return testpaper;
    }
}
