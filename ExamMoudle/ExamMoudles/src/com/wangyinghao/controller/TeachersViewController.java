package com.wangyinghao.controller;
import com.wangyinghao.bean.Teachers;
import com.wangyinghao.service.TeachersServiceDao;
import com.wangyinghao.service.TeachersServiceDaoImpl;
import com.wangyinghao.util.Page;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by n 2017/11/25/025.
 */
public class TeachersViewController extends ActionSupport implements ModelDriven {
    //接收从service传过来的数据
    private TeachersServiceDao teachersServiceDao = new TeachersServiceDaoImpl();
    //定义一个jsonarry数组；
    private JSONArray teachersjson;
    //定义一个json字符串；
    private  String jsonstring;
    private  String jsonpage;
    private  Teachers teachers = new Teachers();
    //主界面信息查询后显示
    private String tnumber;
    private String tname;
    private Integer tjob;
    //编辑信息
    private Integer id;
    //页面显示当前第几页
    private  Integer pageIndex;

    private Page page = new Page();
    private HttpSession httpSession = ServletActionContext.getRequest().getSession();


    //显示教师管理界面中的教师的所有数据
    //定义一个返回值是String的方法
    public String showteachersview(){
        //调取service的值
        List<Teachers> teachersList =  teachersServiceDao.selectAllTechers();

        if (teachersList.size()!=0||teachersList!=null){
            teachersjson = JSONArray.fromObject(teachersList);
        }
        //先查出数据的总数
        Integer totalCount = teachersList.size();
        //定义每页当前的值为5
        Integer pageSize = 5;
        //显示页面分页
        if(pageIndex==null){
            pageIndex = 1;
        }
        page.showpage(totalCount,pageSize,pageIndex);
        ArrayList<Teachers> teachersArrayList = new ArrayList<Teachers>();
        for (int i = page.getDataStart()-1;i<page.getDataEnd();i++){
            //把需要的数据从teachersList取出(所有数据在从teachersList取出数据)
            Teachers teachers = teachersList.get(i);
            //把从teachersList取出的数据添加到teachersArrayList里
            teachersArrayList.add(teachers);
        }
        //把list转换成json数据，（jsonarray处理数组）（jsonobject处理类）
        teachersjson = JSONArray.fromObject(teachersArrayList);
        //从控制器到界面只能以字符串的类型传输，所以要把teachersjson转换成字符串
        jsonstring = teachersjson.toString();
        httpSession.setAttribute("page",page);
        System.out.println("jsonstring"+jsonstring);
        return "teachermanager";
    }

    public  String showteacherinfopage(){
        //以key和value形式传输。key必须是字符串形式
        page = (Page) httpSession.getAttribute("page");
        //把json发回去
        jsonpage = JSONObject.fromObject(page).toString();
        return "showteacherinfopage";
    }
    //是对教师界面的根据条件查询后查询结果显示到table中
    public String  showselectresult(){

     /*   System.out.println("今天的第"+teachers.getTnumber()+"位");
        System.out.println(teachers.getTname());*/
        List<Teachers> teachersList1 = teachersServiceDao.selectteachertBynameOrtnumberOrtjob(teachers);
        //返回一个json字符串
        teachersjson =JSONArray.fromObject(teachersList1);

        jsonstring = teachersjson.toString();
        System.out.println("jsonstring"+jsonstring);
        return "teachermanager";


    }

    //是对添加教师界面的教师增加中的(显示教师信息的编号)的操作（针对添加教师insertteacher界面的操作）
    public String  addAndupdate(){
        TeachersServiceDao teachersServiceDao = new TeachersServiceDaoImpl();
        Teachers teachers =teachersServiceDao.selectBytid(tnumber);
        if (teachers!=null){
            teachersjson =JSONArray.fromObject(teachers);
            jsonstring = teachersjson.toString();
        }
       /* System.out.println("jsonstring"+jsonstring);*/
        return "insertteacher";

         /* Tnumber t = new Tnumber();
        String s = t.date1();
        //掉service
        //判断 如果不存在
        t.date2();
        //存在
        s = t.date3("");
        */
    }

    //是对教师界面中点击添加教师信息的操作（针对insertteacher页面中的添加）
    /*insertteacherinfo是insertteacher界面中的<form></form>表单提交中的action网址，所以不用ajax技术*/
    public  String insertteacherinfo(){
        //接收service传过来的数据
        /*System.out.println(teachers.getTid());
        System.out.println(teachers.getTnumber());
*/
        TeachersServiceDao teachersServiceDao = new TeachersServiceDaoImpl();
        teachersServiceDao.saveTeacherInfoAndUpdate(teachers);

        //添加成功返回教师管理界面
        return "teachermanager";

    }

    //是对教师界面中点击添加教师信息的操作（针对insertteacher页面中的取消）
    //cancelteacherinfo是insertteacher界面中的<form></form>表单提交中取消添加信息（如果取消添加信息，会作废自动生成的账号）
    public  String cancelteacherinfo(){
        System.out.println(teachers.getTid());
        teachers = teachersServiceDao.selectteacherByttid(teachers.getTid());
        teachersServiceDao.deleteTeacherInfo(teachers);
        //添加成功返回教师管理界面*/
        return "cancelteacherinfo";

    }

    //是对教师界面中点击操作框中的编辑跳转到编辑页面的操作
    public  String editnewteacher () {
        System.out.println("109");
        TeachersServiceDao teachersServiceDao = new TeachersServiceDaoImpl();
        System.out.println(id);
        teachers =  teachersServiceDao.selectteacherByttid(id);
        return "editnewteacher";
    }
    //教师页面实现重置密码的功能
    public  String resetpassword(){
        teachers = teachersServiceDao.selectteacherByttid(teachers.getTid());
        teachers.setTpassword("123456");
        teachersServiceDao.saveTeacherInfoAndUpdate(teachers);
        return "resetpassword";
    }

    //教师页面删除功能实现
    public String deleteteacherinfo(){
        //根据ID查询出数据在做删除
        System.out.println(id);
        teachers = teachersServiceDao.selectteacherByttid(id);
        teachersServiceDao.deleteTeacherInfo(teachers);
        //return回来一个结果？？？？？？？？？？？？？？？？？？？
        return "deleteteacherinfo";
    }






    public TeachersServiceDao getTeachersServiceDao() {
        return teachersServiceDao;
    }

    public void setTeachersServiceDao(TeachersServiceDao teachersServiceDao) {
        this.teachersServiceDao = teachersServiceDao;
    }


    public String getJsonstring() {
        return jsonstring;
    }

    public void setJsonstring(String jsonstring) {
        this.jsonstring = jsonstring;
    }

    public String getTnumber() {
        return tnumber;
    }

    public void setTnumber(String tnumber) {
        this.tnumber = tnumber;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public Integer getTjob() {
        return tjob;
    }

    public void setTjob(Integer tjob) {
        this.tjob = tjob;
    }

    public Teachers getTeachers() {
        return teachers;
    }

    public void setTeachers(Teachers teachers) {
        this.teachers = teachers;
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public String getJsonpage() {
        return jsonpage;
    }

    public void setJsonpage(String jsonpage) {
        this.jsonpage = jsonpage;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    @Override
    public Object getModel() {
        return teachers;
    }
}