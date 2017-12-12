package com.yanlihua.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yanlihua.bean.Classes;
import com.yanlihua.bean.Teachers;
import com.yanlihua.service.ClassesService;
import com.yanlihua.service.impl.ClassesServiceImpl;
import com.yanlihua.util.Page;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 晏利花 on 2017/11/25.
 */
public class ClassesController extends ActionSupport implements ModelDriven{
    private ClassesService classService=new ClassesServiceImpl();
    private JSONObject jsonObject=new JSONObject();
    private JSONArray jsonArray;
    private String classallinfo;
    private String teachersinfo;
    private Classes classes=new Classes();
    //讲师
    private String tidl;
    //班主任
    private String tidh;
    private String pageindex;
    private Page page;
    private String strJsonPage;
    public List<Classes> conformclassinfo = new ArrayList();


    public String selectclassallinfoway(){
        List<Classes> classList=classService.selectAllClassInfoClassService();
        if(classList!=null||classList.size()!=0){
            jsonArray=JSONArray.fromObject(classList);
        }
//分页
        //共有多少条数据
        Integer totalcount = classList.size();
        //定义当前每页的值为4
        Integer pagesize = 5;

        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        if (httpSession.getAttribute("page") == null) {
            page = new Page();
        } else {
            page = (Page) httpSession.getAttribute("page");
        }
        //总数据条数
        page.setTotalCount(totalcount);
        //当前大小
        page.setPageSize(pagesize);
        //当前页数是请求发过来的

        if (pageindex == null) {
            pageindex = "0";
        }

        //当前页数
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
            System.out.println(classList.get(i).getCnumber());
            Classes classes = classList.get(i);
            conformclassinfo.add(classes);
        }
        jsonArray = JSONArray.fromObject(conformclassinfo);
        classallinfo=jsonArray.toString();
        System.out.println("=============================================="+classallinfo);
        httpSession.setAttribute("page", page);
        return "classallinforesult";
    }
    public String getpage() {

        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        Page page1 = (Page) httpSession.getAttribute("page");
        strJsonPage = JSONObject.fromObject(page1).toString();
        System.out.println("++++++++++++++++++++++"+strJsonPage);
        return "jsonpage";
    }

    //查班主任姓名显示在下拉框中(根据岗位查询信息)
    public String selectallinfob(){
        List<Teachers> teachersListb= classService.selectTeacherInfoByTjobClassServiceb();
        jsonArray=JSONArray.fromObject(teachersListb);
        teachersinfo=jsonArray.toString();
        return "selectallinfobresult";
    }

    //查讲师姓名显示在下拉框中(根据岗位查询信息)
    public String selectallinfoj(){
        List<Teachers> teachersListj= classService.selectTeacherInfoByTjobClassServicej();
        jsonArray=JSONArray.fromObject(teachersListj);
        teachersinfo=jsonArray.toString();
        return "selectallinfobresult";

    }
//四个条件的班级查询
    public String fourconditionselectway(){
        /*System.out.println(classes.getCbegin());
        System.out.println(classes.getCdirection());
        System.out.println(tidh);
        System.out.println(tidl);*/
        Integer tidhid=-1;
        Integer tidlid=-1;
        if (tidh!=null&&!tidh.equals("")) {
             tidhid = Integer.valueOf(tidh);
        }
        if (tidl!=null&&!tidl.equals("")) {
             tidlid = Integer.valueOf(tidl);
        }
        //数据库(造数据要严谨)
        List<Classes> classesList=classService.selectClassByFourConditionClassService(classes.getCbegin(),classes.getCdirection(),tidlid,tidhid);
        jsonArray=JSONArray.fromObject(classesList);
        teachersinfo=jsonArray.toString();
        System.out.println("++++++++++++++++++++++"+teachersinfo);
        return "fourconditionselectwayresult";

    }

//保存班级信息
    public String saveclassesinfoway(){
        Teachers teachersl=new Teachers();
        teachersl.setTid(Integer.parseInt(tidl));
        Teachers teachersh=new Teachers();
        teachersh.setTid(Integer.parseInt(tidh));
        classes.setTeachersl(teachersl);
        classes.setTeachersh(teachersh);
        classService.saveOrUpdateClassesinfoClassesService(classes);
        jsonObject.put("result", "true");
        teachersinfo = jsonObject.toString();
        return "saveclassesinfowayresult";

    }

 //根据cid查询信息，更改信息
    public String selectcidselectinfoway(){
        System.out.println("+++++++++++++++++++++++++++"+classes.getCid());
        Classes classesinfo=classService.selectClassesinfoByCidClassesService(classes.getCid());
        jsonObject.put("classes", classesinfo);
        teachersinfo = jsonObject.toString();
        System.out.println(teachersinfo);
        return "selectcidselectinfowayresult";
    }
//根据cid条件修改信息
    public String tidupdateinfoway(){
        Classes classesinfo=classService.selectClassesinfoByCidClassesService(classes.getCid());
        classesinfo.setCbegin(classes.getCbegin());
        classesinfo.setCg1(classes.getCg1());
        classesinfo.setCg2(classes.getCg2());
        classesinfo.setCg3(classes.getCg3());
        classesinfo.setCname(classes.getCname());
        classesinfo.setCdirection(classes.getCdirection());
        Teachers teachersl=new Teachers();
        teachersl.setTid(Integer.parseInt(tidl));
        Teachers teachersh=new Teachers();
        teachersh.setTid(Integer.parseInt(tidh));
        classes.setTeachersl(teachersl);
        classes.setTeachersh(teachersh);
        classesinfo.setTeachersh(teachersh);
        classesinfo.setTeachersl(teachersl);
        classesinfo.setCstate(classes.getCstate());
        classesinfo.setCremark(classes.getCremark());
        classService.saveOrUpdateClassesinfoClassesService(classesinfo);
        jsonObject.put("result", "true");
        teachersinfo = jsonObject.toString();
        return "tidupdateinfowayresult";
    }


    public String selectallclassnameway(){
        List<Classes> classList=classService.selectAllClassInfoClassService();
        if(classList!=null||classList.size()!=0){
            jsonArray=JSONArray.fromObject(classList);
        }
        classallinfo=jsonArray.toString();
        return "selectallclassnamewayresult";
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public String getClassallinfo() {
        return classallinfo;
    }

    public void setClassallinfo(String classallinfo) {
        this.classallinfo = classallinfo;
    }

    public String getTeachersinfo() {
        return teachersinfo;
    }

    public void setTeachersinfo(String teachersinfo) {
        this.teachersinfo = teachersinfo;
    }

    public Classes getClasses() {
        return classes;
    }

    public void setClasses(Classes classes) {
        this.classes = classes;
    }

    public String getTidh() {
        return tidh;
    }

    public void setTidh(String tidh) {
        this.tidh = tidh;
    }

    public String getTidl() {
        return tidl;
    }

    public void setTidl(String tidl) {
        this.tidl = tidl;
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

    public List<Classes> getConformclassinfo() {
        return conformclassinfo;
    }

    public void setConformclassinfo(List<Classes> conformclassinfo) {
        this.conformclassinfo = conformclassinfo;
    }

    @Override
    public Object getModel() {
        return classes;
    }
}
