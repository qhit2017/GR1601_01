package com.yanlihua.controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yanlihua.bean.PageData;
import com.yanlihua.bean.Teachers;
import com.yanlihua.service.TeachersService;
import com.yanlihua.service.impl.TeachersServiceImpl;
import com.yanlihua.util.Page;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 晏利花 on 2017/11/23.
 */
public class TeacherController extends ActionSupport implements ModelDriven {
    private TeachersService teachersService = new TeachersServiceImpl();
    private JSONArray jsonArray;
    private String teacherInfo;
    private String number;
    private String name;
    private String job;
    private JSONObject jsonObject = new JSONObject();
    private Teachers allteachers = new Teachers();
    private String allnumber;
    private String pageindex;
    public List<Teachers> conformteacherinfo = new ArrayList();
    private String upage;
    private Page page;
    private String strJsonPage;

    //查询教师所有信息
    public String selectallteacherinfo() {
        List<Teachers> teachersList = teachersService.selectAllTeachersInfoTeachersService();
        if (teachersList != null || teachersList.size() != 0) {
            jsonArray = JSONArray.fromObject(teachersList);
        }
        //分页
        //共有多少条数据
        Integer totalcount = teachersList.size();
        //定义当前每页的值为4
        Integer pagesize = 4;

        HttpSession httpSession = ServletActionContext.getRequest().getSession();

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
            System.out.println(teachersList.get(i).getTnumber());
            Teachers teachers = teachersList.get(i);
            conformteacherinfo.add(teachers);
        }
        jsonArray = JSONArray.fromObject(conformteacherinfo);
        teacherInfo = jsonArray.toString();
        /*teacherInfo = jsonArray.toString();*/
        System.out.println("teacherInfo" + teacherInfo);
        //存放page的信息
        httpSession.setAttribute("page", page);
        return "selectAllTeacherInfoResult";
    }


    public String getPage() {
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        Page page1 = (Page) httpSession.getAttribute("page");
        strJsonPage = JSONObject.fromObject(page1).toString();
        return "jsonpage";
    }

    //三个条件查询教师信息
    public String threecoditionselect() {
        Integer jobid = Integer.parseInt(job);
        List<Teachers> teachersList = teachersService.selectThreeConditionTeachersService(number, name, jobid);
        System.out.println("teachersList.size()==========" + teachersList.size());
        if (teachersList != null || teachersList.size() > 0) {
            jsonArray = JSONArray.fromObject(teachersList);
        }
        teacherInfo = jsonArray.toString();
        System.out.println("teacherInfo" + teacherInfo);

        return "threecoditionselectresult";
    }

    //保存或更改教师的所有信息
    public String saveorupdateway() {
        //模糊查询出今天每一次添加的最后一条数据（编号）
        // SELECT * FROM teachers WHERE tnumber LIKE '20171125___' ORDER BY tnumber DESC LIMIT 1
        //-----------以上有问题
        /*Integer id=Integer.parseInt(tid);*/
        Integer id = allteachers.getTid();
        Teachers teachers = teachersService.selectTeachersInfoByTidTeacherService(id);
        teachers.setTtel(allteachers.getTtel());
        teachers.setTbirthday(allteachers.getTbirthday());
        teachers.setTedu(allteachers.getTedu());
        teachers.setTname(allteachers.getTname());
        teachers.setTremark(allteachers.getTremark());
        teachers.setTsex(allteachers.getTsex());
        teachers.setTjob(allteachers.getTjob());
        teachersService.saveOrUpdateTeachersInfoTeacherService(teachers);
        jsonObject.put("result", "true");
        teacherInfo = jsonObject.toString();
        return "saveorupdatesuccess";
    }

    //点击编辑（修改教师信息）
    public String editteacherinfo() {
        /*Integer id=Integer.parseInt(tid);*/
        Integer id = allteachers.getTid();
        Teachers teachers = teachersService.selectTeachersInfoByTidTeacherService(id);
        jsonObject.put("teachers", teachers);
        teacherInfo = jsonObject.toString();
        System.out.println("teacherInfo" + teacherInfo);
        return "addteacherinforesult";
    }

    //重置密码（重置成统一的密码）
    public String resetbyidway() {
        Integer id = allteachers.getTid();
        Teachers teachers = teachersService.selectTeachersInfoByTidTeacherService(id);
        teachers.setTpassword("123456");
        teachersService.saveOrUpdateTeachersInfoTeacherService(teachers);
        jsonObject.put("result", "true");
        teacherInfo = jsonObject.toString();
        return "resetpwdsuccess";
    }

    //删除对象（根据id提到进行删除）
    public String deletebyidway() {
        Integer id = allteachers.getTid();
        Teachers teachers = teachersService.selectTeachersInfoByTidTeacherService(id);
        teachersService.deleteTeacherByIdBaseService(teachers);
        jsonObject.put("result", "true");
        teacherInfo = jsonObject.toString();
        return "deletesuccess";

    }

    //点击编辑是先添加教师编号(年月日当天第几个添加)
    public String addteachertnumberway() {
        Teachers teachers = teachersService.selectTeacherInfoLikeTnumberTeacherService();
        String tnumber = teachers.getTnumber();
        System.out.println("tnumber" + tnumber);
        jsonObject.put("result", teachers);
        teacherInfo = jsonObject.toString();
        return "addteachertnumberresult";
    }

    //保存教师信息
    public String saveteacherway() {
        allteachers.setTpassword("123456");
        teachersService.saveOrUpdateTeachersInfoTeacherService(allteachers);
        jsonObject.put("result", "true");
        teacherInfo = jsonObject.toString();
        return "savewaysuccess";
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public String getTeacherInfo() {
        return teacherInfo;
    }

    public void setTeacherInfo(String teacherInfo) {
        this.teacherInfo = teacherInfo;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public Teachers getAllteachers() {
        return allteachers;
    }

    public void setAllteachers(Teachers allteachers) {
        this.allteachers = allteachers;
    }

    public String getAllnumber() {
        return allnumber;
    }

    public void setAllnumber(String allnumber) {
        this.allnumber = allnumber;
    }

    public String getPageindex() {
        return pageindex;
    }

    public void setPageindex(String pageindex) {
        this.pageindex = pageindex;
    }

    public String getUpage() {
        return upage;
    }

    public void setUpage(String upage) {
        this.upage = upage;
    }


    public String getStrJsonPage() {
        return strJsonPage;
    }

    public void setStrJsonPage(String strJsonPage) {
        this.strJsonPage = strJsonPage;
    }

    @Override
    public Object getModel() {
        return allteachers;
    }
}