package com.yanlihua.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.yanlihua.bean.*;
import com.yanlihua.service.ExamService;
import com.yanlihua.service.OnelinetestService;
import com.yanlihua.service.impl.ExamServiceImpl;
import com.yanlihua.service.impl.OnelinetestServiceImpl;
import com.yanlihua.util.Page;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;


import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by 晏利花 on 2017/12/9.
 */
public class OnlinetestController extends ActionSupport {
    private OnelinetestService onelinetestService = new OnelinetestServiceImpl();
    private JSONObject jsonObject = new JSONObject();
    private JSONArray jsonArray;
    private String onlinetestStr;
    private String sname;
    private Integer tid;
    private Page page;
    private String pageindex;
    //符合条件的分页数据
    public List<Questionbank> conformteacherinfo = new ArrayList();
    private String strJsonPage;
    //存放界面传的答案
    private String strString;

    //先通过名字查询班级
    public String studentselectinfoway() {
        System.out.println(sname);
        Students students = onelinetestService.selectStudentInfoOnelinetestService(sname);
        String cname = students.getClasses().getCnumber();
        List<Testpaper> testpaperList = onelinetestService.selectTestpaperInfoOnelinetestService(cname);
       /* for (Testpaper t:testpaperList){
            System.out.println(t.getGradeSet().size());
            t.setGradeSet(new HashSet<Grade>(t.getGradeSet().size()));
            //System.out.println("000000000000-"+t.get);
        }*/
        jsonArray = JSONArray.fromObject(testpaperList);
        onlinetestStr = jsonArray.toString();
        System.out.println("222222222+" + onlinetestStr);
        return "studentselectinfowayresult";
    }

    //根据tid显示答题卡上的个人信息
    public String selecttestpaperinfobytidway() {
        Testpaper testpaper = onelinetestService.selectTestpaperInfoByTidOnelinetestService(tid);
        jsonObject.put("testpaper", testpaper);
        onlinetestStr = jsonObject.toString();
        System.out.println("222222222+" + onlinetestStr);
        return "selecttestpaperinfobytidwayresult";
    }

    //画框
    public String selectquestionbankwayframe() {
        Testpaper testpaper = onelinetestService.selectTestpaperInfoByTidOnelinetestService(tid);
        Set<Questionbank> questionbankSet = testpaper.getQuestionbankSet();
        jsonArray = JSONArray.fromObject(questionbankSet);
        onlinetestStr = jsonArray.toString();
        return "selectquestionbankwayframeresult";
    }

    //查询此试卷中的试题
    public String selectquestionbankway() {
        Testpaper testpaper = onelinetestService.selectTestpaperInfoByTidOnelinetestService(tid);
        Set<Questionbank> questionbankSet = testpaper.getQuestionbankSet();

        //对试卷查出来的题进行分页
        List<Questionbank> questionbankList = new ArrayList<>();
        for (Questionbank questionbank : questionbankSet) {
            questionbankList.add(questionbank);
        }
        for (Questionbank questionbank : getSortList(questionbankList)) {
            System.out.println("2222222222222222222222++" + questionbank.getQid());
        }
        //分页
        //共有数据条数
        Integer totalcount = questionbankList.size();
        //定义当前每页的值为1
        Integer pagesize = 1;

        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        if (httpSession.getAttribute("page") == null) {
            page = new Page();
        } else {
            page = (Page) httpSession.getAttribute("page");
        }
        page.setTotalCount(totalcount);
        page.setPageSize(pagesize);
        if (pageindex == null) {
            pageindex = "1";
        }
        Integer upageid = Integer.valueOf(pageindex);
        if (upageid <= 0) {
            upageid = 1;
        }
        if (upageid > questionbankList.size()) {
            upageid = questionbankList.size();
        }
        page.setPageIndex(upageid);

        System.out.println("ppp" + page.getTotalCount());
        System.out.println(page.getPageSize());
        System.out.println(page.getPageCount());
        System.out.println(page.getPageIndex());
        System.out.println(page.getUppage());
        System.out.println(page.getNextpage());
        System.out.println(page.getDataStart());
        //符合分页条件的数据
        for (int i = page.getDataStart() - 1; i < page.getDataEnd(); i++) {
            System.out.println(questionbankList.get(i).getQid());
            Questionbank questionbank = questionbankList.get(i);
            conformteacherinfo.add(questionbank);
        }
       /* 搜优符合条件的数据
       jsonArray = JSONArray.fromObject(questionbankSet);
        onlinetestStr = jsonArray.toString();*/
        jsonArray = JSONArray.fromObject(conformteacherinfo);
        onlinetestStr = jsonArray.toString();
        System.out.println("222222222+" + onlinetestStr);
        httpSession.setAttribute("page", page);
        return "selectquestionbankwayresult";
    }

    //答得答案与正确答案进行对比
    public String contrastanswerway() {
        Testpaper testpaper = onelinetestService.selectTestpaperInfoByTidOnelinetestService(tid);
        Set<Questionbank> questionbankSet = testpaper.getQuestionbankSet();
        //对试卷查出来的题进行分页
        List<Questionbank> questionbankList = new ArrayList<>();
        for (Questionbank questionbank : questionbankSet) {
            questionbankList.add(questionbank);
        }
        //正确答案
        String str = "";
        for (Questionbank questionbank : getSortList(questionbankList)) {
            str = str + questionbank.getQanswer() + "/";
        }
        System.out.println(str);
        int count = 0;
        String[] answerdbo = str.split("/");
        String[] answermy = strString.split("/");
        for (int i = 0; i < answerdbo.length; i++) {
            if (answerdbo[i].equals(answermy[i])) {
                count++;
                // System.out.println("answermy[j]-----"+answermy[j]);
            }
        }
        //将学生答得成绩存入session中
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        httpSession.setAttribute("studentanswer", str);
        //答对题的个数保存
        HttpSession httpSession1 = ServletActionContext.getRequest().getSession();
        httpSession1.setAttribute("count", count);
        //将考试题存放入session中
        HttpSession httpSession2 = ServletActionContext.getRequest().getSession();
        httpSession2.setAttribute("testquestion", questionbankList);

        //System.out.println("对的题数==================" + count);
        //根据试卷的tid查询成绩（此时此人的成绩早已存在，只不过是0）
        ExamService examService = new ExamServiceImpl();
        Testpaper testpaper1 = examService.updateTestpaperByTidExamService(tid);
        Set<Grade> gradeSet = testpaper1.getGradeSet();
        //根据学生对学生成绩进行更改
        Grade grade1 = new Grade();
        for (Grade grade : gradeSet) {
            System.out.println(grade.getGanswer());
            //获取考试时间
            grade1.setGendtime("2017-12-10 16:00");
            grade1.setGanswer(strString);
            grade1.setGbegintime(grade.getGbegintime());
            //成绩（题数*每道题的分数）
            Integer teachscore = testpaper.getTeachscore();
            grade1.setGscore(teachscore);
            grade1.setGid(grade.getGid());
            grade1.setTestpaper(grade.getTestpaper());
            grade1.setStudents(grade.getStudents());
        }
        //更改成绩的方法
        examService.updateGradeExamService(grade1);
        jsonObject.put("reslut", count);
        onlinetestStr = jsonObject.toString();
        return "contrastanswerwayresult";
    }

    //tid查询题
    public String selectquestionbankbytid() {
        Testpaper testpaper = onelinetestService.selectTestpaperInfoByTidOnelinetestService(tid);
        Set<Questionbank> questionbankSet = testpaper.getQuestionbankSet();

        //对试卷查出来的题进行分页
        List<Questionbank> questionbankList = new ArrayList<>();
        for (Questionbank questionbank : questionbankSet) {
            questionbankList.add(questionbank);
        }
        for (Questionbank questionbank : getSortList(questionbankList)) {
            //System.out.println("2222222222222222222222++" + questionbank.getQid());
        }
        jsonArray = JSONArray.fromObject(questionbankList);
        onlinetestStr = jsonArray.toString();
        System.out.println("11111111111111111111111111111111111-" + onlinetestStr);
        return "selectquestionbankbytidresult";
    }

    public String getPage() {
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        Page page1 = (Page) httpSession.getAttribute("page");
        strJsonPage = JSONObject.fromObject(page1).toString();
        System.out.println("jsonpage------------------" + strJsonPage);
        return "jsonpage";
    }

    //对list中的某个属性进行排序方法(set无序，放入list中也是无序的，所以要根据qid进行排序)
    public static List<Questionbank> getSortList(List<Questionbank> list) {
        Collections.sort(list, new Comparator<Questionbank>() {
            @Override
            public int compare(Questionbank o1, Questionbank o2) {
                if (o1.getQid() > o2.getQid()) {
                    return 1;
                }
                if (o1.getQid() > o2.getQid()) {
                    return 0;
                }
                return -1;
            }
        });
        return list;
    }

    public String getStrString() {
        return strString;
    }

    public void setStrString(String strString) {
        this.strString = strString;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public String getPageindex() {
        return pageindex;
    }

    public void setPageindex(String pageindex) {
        this.pageindex = pageindex;
    }

    public String getStrJsonPage() {
        return strJsonPage;
    }

    public void setStrJsonPage(String strJsonPage) {
        this.strJsonPage = strJsonPage;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
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

    public String getOnlinetestStr() {
        return onlinetestStr;
    }

    public void setOnlinetestStr(String onlinetestStr) {
        this.onlinetestStr = onlinetestStr;
    }
}
