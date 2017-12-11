package com.jinmengjie.controller;
import com.jinmengjie.bean.Classes;
import com.jinmengjie.bean.Teachers;
import com.jinmengjie.service.ClassesService;
import com.jinmengjie.service.impl.ClassesServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import java.util.List;

/**
 * Created by 金梦杰 on 2017/11/29/029.
 */
public class ClassesModelController extends ActionSupport implements ModelDriven {

    private ClassesService classesService = new ClassesServiceImpl();
    private Classes classes  = new Classes();
    private Teachers teachers = new Teachers();
    //定义一个jsonarry数组；
    private JSONArray classjson;
    //定义一个json字符串；
    private  String jsonstring;
    //讲师
    private Integer idl;
    //班主任
    private Integer idh;
   //开班日期
    private  String begin;
    //所属方向
    private String direction;
    //编辑信息
    private Integer id;
    private Integer tjob;
    //查询所有班级信息并且显示
    public String showClassInfo() {
        //接收从service中传过来的值
       List<Classes> classesList = classesService.selectAllClassInfo();
        if (classesList.size() != 0 || classesList == null) {
            //返回一个json字符串
            classjson = JSONArray.fromObject(classesList);
        }
        ////从控制器到界面只能以字符串的形式传输，所以要把classjson转化成字符串的形式
        jsonstring = classjson.toString();
        System.out.println("jsonstring" + jsonstring);

        return "classesmanager";
    }

    /*0是讲师
    * 1是班主任
    * */
    //显示班级界面讲师姓名在下拉框取出功能
    public String showteacherinfo0(){
        //接收从service传过来的值
       List<Teachers> teachersList =  classesService.selectTeacherTjobByTjob0();
        //返回一个json字符串
        classjson = JSONArray.fromObject(teachersList);
        ////从控制器到界面只能以字符串的形式传输，所以要把classjson转化成字符串的形式
        jsonstring = classjson.toString();
        System.out.println("jsonstring" + jsonstring);

        return "classesmanager";
    }
    //显示班级界面班主任姓名在下拉框取出功能
    public String showteacherinfo1(){
        //接收从service传过来的值
        List<Teachers> teachersList =  classesService.selectTeacherTjobByTjob1();
        //返回一个json字符串
        classjson = JSONArray.fromObject(teachersList);
        ////从控制器到界面只能以字符串的形式传输，所以要把classjson转化成字符串的形式
        jsonstring = classjson.toString();
        System.out.println("jsonstring" + jsonstring);

        return "classesmanager";
    }

    //在班级管理界面显示下拉框开班日期的信息
    public  String showbeginclassesdata(){
      List<Classes> classesList =   classesService.sleectbeginclassBycbegin();
        classjson = JSONArray.fromObject(classesList);
        ////从控制器到界面只能以字符串的形式传输，所以要把classjson转化成字符串的形式
        jsonstring = classjson.toString();
        System.out.println("jsonstring" + jsonstring);

        return "classesmanager";

    }
    //根据四个查询条件查询出信息并显示到table
    public String selectfourinfo(){
       List<Classes> classesList = classesService.selectClassesInfoBycebginOrcdirectionOrtidlortidh(begin,direction,idl,idh);
        //返回一个json字符串
        classjson = JSONArray.fromObject(classesList);
        //从控制器到界面只能以字符串的形式传输，所以要把classjson转化成字符串的形式
        jsonstring = classjson.toString();
        System.out.println("jsonstring" + jsonstring);

        return "classesmanager";

    }
    //添加班级信息
    public  String insertclassesinfo(){
        classesService.insertOrUpdateClassesInfo(classes);
        return "classesmanager";
    }
    //班级界面点击编辑的功能
    public  String editclassesinfo(){
        classes  =  classesService.selectclassesinfoBycid(id);
        return "editnewclassesinfo";
    }



    public String getJsonstring() {
        return jsonstring;
    }

    public void setJsonstring(String jsonstring) {
        this.jsonstring = jsonstring;
    }

    public Classes getClasses() {
        return classes;
    }

    public void setClasses(Classes classes) {
        this.classes = classes;
    }

    public Integer getIdl() {
        return idl;
    }

    public void setIdl(Integer idl) {
        this.idl = idl;
    }

    public Integer getIdh() {
        return idh;
    }

    public void setIdh(Integer idh) {
        this.idh = idh;
    }

    public String getBegin() {
        return begin;
    }

    public void setBegin(String begin) {
        this.begin = begin;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public Integer getTjob() {
        return tjob;
    }

    public void setTjob(Integer tjob) {
        this.tjob = tjob;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Teachers getTeachers() {
        return teachers;
    }

    public void setTeachers(Teachers teachers) {
        this.teachers = teachers;
    }

    @Override
    public Object getModel() {
        return classes;
    }
}
