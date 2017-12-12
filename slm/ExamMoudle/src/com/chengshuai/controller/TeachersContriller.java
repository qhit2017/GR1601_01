package com.chengshuai.controller;

import com.chengshuai.bean.Teachers;
import com.chengshuai.dao.Teachersdao;
import com.chengshuai.dao.impl.Teachersimpl;
import com.chengshuai.service.Teachersservice;
import com.chengshuai.service.impl.Teachersserviceimpl;
import com.chengshuai.util.Page;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by slm on 2017/11/24.
 * <p>
 * 教师模块
 */
public class TeachersContriller extends ActionSupport implements ModelDriven {
    private String Byid;
    private String pageIndex;
    public Teachers te = new Teachers();
    private Teachersservice teachersservice = new Teachersserviceimpl();
    public JSONObject jsonObject = new JSONObject();
    private JSONArray jsonArray;
    private String teachersinfo;
    public List<Teachers> list = new ArrayList<>();
    private Page page;
    private String teajson;

    public String selecrTeachersAll() {
        /*取出教师表中所有信息*/
        /*System.out.println(pageIndex);*/
        List<Teachers> teachersList = teachersservice.selectTeachersALL();
        //数据总数

        Integer totalcount = teachersList.size();
        Integer pagesize = 4;
        if (pageIndex == null) {
            pageIndex = "1";

        }
        Integer index = Integer.parseInt(pageIndex);
        System.out.println(pageIndex);
        System.out.println(index);
        HttpSession session = ServletActionContext.getRequest().getSession();
        if (session.getAttribute("page") == null) {
            page = new Page();
        } else {
            page = (Page) session.getAttribute("page");
        }
        page.setTotalCount(totalcount);
        page.setPageSize(pagesize);
        page.setPageIndex(index);
        System.out.println("数据总数" + page.getTotalCount());
        System.out.println("每一页显示的条数" + page.getPageSize());
        System.out.println("总页数" + page.getPageCount());
        System.out.println("当前页号" + page.getPageIndex());
        System.out.println("是否有上一页" + page.getUppage());
        System.out.println("是否有下一页" + page.getNextpage());
        System.out.println("数据开始位置" + page.getDataStart());
        System.out.println("数据结束位置" + page.getDataEnd());
        for (int i = page.getDataStart() - 1; i < page.getDataEnd(); i++) {
            Teachers list1 = teachersList.get(i);
            list.add(list1);
        }


        System.out.println(page + "123");
        jsonArray = JSONArray.fromObject(list);

         /*将数据发送到界面上面*/
        teachersinfo = jsonArray.toString();
        session.setAttribute("page", page);
        Page page1 = (Page) session.getAttribute("page");
        System.out.println(page1.getPageIndex() + "654");
        return "selectTeachers";
    }

    public String selectByid() {
        System.out.println("123456");
        Integer id = Integer.valueOf(Byid);
        Teachers teachers = new Teachers();
        teachers.setTid(id);
        Teachers teachers1 = teachersservice.selectByid(teachers);
        jsonObject.put("teachers1", teachers1);
        teachersinfo = jsonObject.toString();

        return "selectTeachers";
    }

    public String selectBytnumberOrtname() {
        /*根据条件查询教师表*/

        Integer id = Integer.valueOf(Byid);
        System.out.println(id);
        Teachers teachers = new Teachers();
        teachers.setTname(te.getTname());
        System.out.println(te.getTname());
        teachers.setTjob(id);
        teachers.setTnumber(te.getTnumber());
        List<Teachers> teachersList = teachersservice.selectBytnumberOrtnameOrtjob(teachers);
        if (teachersList != null || teachersList.size() != 0) {
            jsonArray = JSONArray.fromObject(teachersList);
        }
        teachersinfo = jsonArray.toString();
        return "selectTeachers";
    }

    public String saveTeachersByTnumber() {
        Teachers teachers1 = teachersservice.selectLiketnumber();
        System.out.println(teachers1.getTid());
        jsonObject = JSONObject.fromObject(teachers1);
        teajson = jsonObject.toString();
        return "teajson";
    }

    public String saveTeachers() {
        Teachers teac = new Teachers();
        Integer id = te.getTid();
        teac.setTid(id);

        Teachers teachers = teachersservice.selectByid(teac);
        teachers.setTname(te.getTname());
        teachers.setTsex(te.getTsex());
        teachers.setTnumber(te.getTnumber());
        teachers.setTremark(te.getTremark());
        teachers.setTrole(1);
        teachers.setTphone(te.getTphone());
        teachers.setTbirthday(te.getTbirthday());
        teachers.setTpassword("123456");
        teachers.setTjob(te.getTjob());
        teachers.setTtel(te.getTtel());

        teachersservice.updateTeachers(teachers);
        jsonObject.put("info", "1");
        teachersinfo = jsonObject.toString();
        return "selectTeachers";
    }

    public String deleteteachers() {
        Teachers teac = new Teachers();
        Integer id = te.getTid();
        teac.setTid(id);
        Teachers teachers = teachersservice.selectByid(teac);
        teachersservice.deleteTeachersByid(teachers);
        jsonObject = JSONObject.fromObject(teachers);
        teajson = jsonObject.toString();
        return "teajson";
    }

    public String getpage() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        Page page1 = (Page) session.getAttribute("page");
        System.out.println("数据总数" + page1.getTotalCount());
        System.out.println("每一页显示的条数" + page1.getPageSize());
        System.out.println("总页数" + page1.getPageCount());
        System.out.println("当前页号" + page1.getPageIndex());
        System.out.println("是否有上一页" + page1.getUppage());
        System.out.println("是否有下一页" + page1.getNextpage());
        System.out.println("数据开始位置" + page1.getDataStart());
        System.out.println("数据结束位置" + page1.getDataEnd());
        jsonObject = JSONObject.fromObject(page1);
        teajson = jsonObject.toString();
        return "teajson";
    }

    public Teachers getTe() {
        return te;
    }

    public void setTe(Teachers te) {
        this.te = te;
    }

    public String getByid() {
        return Byid;
    }

    public void setByid(String byid) {
        Byid = byid;
    }

    public String getTeachersinfo() {
        return teachersinfo;
    }

    public void setTeachersinfo(String teachersinfo) {
        this.teachersinfo = teachersinfo;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public String getTeajson() {
        return teajson;
    }

    public String getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(String pageIndex) {
        this.pageIndex = pageIndex;
    }

    public void setTeajson(String teajson) {
        this.teajson = teajson;
    }

    @Override
    public Object getModel() {
        return te;
    }
}
