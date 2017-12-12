package com.yaokaiwen.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yaokaiwen.bean.Classes;
import com.yaokaiwen.bean.Students;
import com.yaokaiwen.bean.Teachers;
import com.yaokaiwen.service.ClassesService;
import com.yaokaiwen.service.StudentService;
import com.yaokaiwen.service.impl.ClassesServiceImpl;
import com.yaokaiwen.service.impl.StundentServiceImpl;
import com.yaokaiwen.util.Page;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by DELL on 2017/11/26.
 */
public class StudentController extends ActionSupport implements ModelDriven{
    private JSONArray jsonArray;
    private JSONObject jsonObject = new JSONObject();
    private String jsonstring;
    private String jsonpage;
    private Integer pageindex;
    private HttpSession httpSession = ServletActionContext.getRequest().getSession();
    private Page p = new Page();
    private ClassesService classesService = new ClassesServiceImpl();
    private StudentService studentService = new StundentServiceImpl();
    private Students students = new Students();
    private Integer id;
    private File upload;
    private String uploadFileName;
    private String uploadContentType;
//查询所有学生信息
    public String selectstudentsallinfo(){
        List<Students> studentsList = studentService.selectStudentsAllService();
        if(studentsList!=null&&studentsList.size()>0){
            Integer totalCount = studentsList.size();
            if(pageindex==null){
                pageindex = 1;
            }
            p.page(totalCount,10,pageindex);
            ArrayList<Students> list = new ArrayList<Students>();
            for(int i=p.getDataStart()-1;i<p.getDataEnd();i++){
                Students s = studentsList.get(i);
                list.add(s);
            }
            jsonArray = JSONArray.fromObject(list);
            httpSession.setAttribute("page",p);
            jsonstring = jsonArray.toString();
        }
        return "jsonstring";
    }
    //分页
    public String getpage() {
        p = (Page) httpSession.getAttribute("page");
        jsonpage = JSONObject.fromObject(p).toString();
        return "jsonpage";
    }
    //分页查询学生信息
    public String selectstudentinfo(){
        List<Students> studentsList =studentService.selectStudentAllByService(students,id);
        if(studentsList!=null && studentsList.size()>0){
            Integer totalCount = studentsList.size();
            if(pageindex==null){
                pageindex = 1;
            }
            p.page(totalCount,10,pageindex);
            ArrayList<Students> list = new ArrayList<Students>();
            for(int i=p.getDataStart()-1;i<p.getDataEnd();i++){
                Students s = studentsList.get(i);
                list.add(s);
            }
            jsonArray = JSONArray.fromObject(list);
            httpSession.setAttribute("page",p);
            jsonstring = jsonArray.toString();
        }
        return "jsonstring";
    }
    //查询班级信息 班级下拉框
    public String selectcid(){
        List<Classes> classesList = studentService.selectclassesService();
        if (classesList!=null&&classesList.size()>0){
            jsonstring = JSONArray.fromObject(classesList).toString();
        }
        return "jsonstring";
    }
    //根据sid查询学生信息
    public String selectbysid(){
        students = studentService.selectStudentsBysidService(id);
        jsonstring = JSONArray.fromObject(students).toString();
        return "selectbysid";
    }
    //添加学生
    public String insertorupdatestudents(){
        System.out.println(students.getCid().getCid());
        students.setSrole(2);
        students.setSpassword("123456");
        studentService.insertOrUpdateStudents(students);
        return "studentlist";
    }
    //删除学生
    public String delectstudent(){
        students = studentService.selectStudentsBysidService(id);
        studentService.daleteStudentsService(students);
        return "delectstudent";
    }
    //重置密码
    public String resetpwd(){
        students = studentService.selectStudentsBysidService(id);
        students.setSpassword("111111");
        students.setSrole(2);
        studentService.insertOrUpdateStudents(students);
        return "resetpwd";
    }
    //上传图片
    public String uploadimg(){
        //找到img文件夹
        String imgpath = ServletActionContext.getServletContext().getRealPath("/img");
        //创建文件名
        File desfile = new File(imgpath,uploadFileName);
        //把upload写到desfile里
        try {
            FileUtils.copyFile(upload,desfile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String path = "img/"+uploadFileName;
        jsonObject.put("path",path);
        jsonstring=jsonObject.toString();
        return "jsonstring";
    }
    @Override
    public Object getModel() {
        return students;
    }

    public String getJsonstring() {
        return jsonstring;
    }

    public void setJsonstring(String jsonstring) {
        this.jsonstring = jsonstring;
    }

    public String getJsonpage() {
        return jsonpage;
    }

    public void setJsonpage(String jsonpage) {
        this.jsonpage = jsonpage;
    }

    public Integer getPageindex() {
        return pageindex;
    }

    public void setPageindex(Integer pageindex) {
        this.pageindex = pageindex;
    }

    public Page getP() {
        return p;
    }

    public void setP(Page p) {
        this.p = p;
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
    }

}
