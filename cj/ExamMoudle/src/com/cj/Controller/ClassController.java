package com.cj.Controller;

import com.cj.Bean.Classes;
import com.cj.Bean.Teachers;
import com.cj.Service.ClassService;
import com.cj.Service.ClassServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;

import java.util.Date;
import java.util.List;


/**
 * Created by cj on 2017/12/4.
 */
public class ClassController extends ActionSupport {
    private ClassService classService=new ClassServiceImpl();

    private JSONArray ClassJson;
    private String jsonStr;

    private Date cbegin;
    private String cdirection;
    private Integer tidl;
    private Integer tidh;
private String cnumber;
private String cname;
private Integer cg1;
    private Integer cg2;
    private Integer cg3;
private Integer cstate;
private String cremark;


    /*查询所有显示班级*/
    public String selectclassall(){
      List<Classes> classesList= classService.selectClassAll();
      if (classesList!=null||classesList.size()!=0){
          ClassJson=JSONArray.fromObject(classesList);
      }
        //把JSONarray数据转换成String
        jsonStr=ClassJson.toString();
        return "class";


    }

    /*根据条件查询*/
    public String selectconditionclass(){
     List<Classes> classList= classService.sleectMycbeginOrcdirectionOrtidlOrtidh(cbegin,cdirection,tidl,tidh);
        if (classList!=null){
            ClassJson=JSONArray.fromObject(classList);
        }
        jsonStr=ClassJson.toString();
        return "class";

    }
    /*增加班级*/
    public String insertclass(){
        Classes classes=new Classes();
       /* Teachers  teachersh= classes.getTeachersh();
        teachersh.setTid(tidh);
        classes.setTeachersl(teachersh);
        Teachers teachersl=classes.getTeachersl();
        teachersl.setTid(tidh);
        classes.setTeachersh(teachersl);*/

        classes.setCnumber(cnumber);
        classes.setCname(cname);
        classes.setCremark(cremark);
        classes.setCstate(cstate);
        classes.setCg1(cg1);
        classes.setCg2(cg2);
        classes.setCg3(cg3);
        classes.setCbegin(cbegin);
        classes.setCdirection(cdirection);
       boolean inseertclass=  classService.inseertClassall(classes);
       if (inseertclass==true){
           return "class";
       }
          return "insertclass";
    }

    public String getCnumber() {
        return cnumber;
    }

    public void setCnumber(String cnumber) {
        this.cnumber = cnumber;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Integer getCg1() {
        return cg1;
    }

    public void setCg1(Integer cg1) {
        this.cg1 = cg1;
    }

    public Integer getCg2() {
        return cg2;
    }

    public void setCg2(Integer cg2) {
        this.cg2 = cg2;
    }

    public Integer getCg3() {
        return cg3;
    }

    public void setCg3(Integer cg3) {
        this.cg3 = cg3;
    }

    public Integer getCstate() {
        return cstate;
    }

    public void setCstate(Integer cstate) {
        this.cstate = cstate;
    }

    public String getCremark() {
        return cremark;
    }

    public void setCremark(String cremark) {
        this.cremark = cremark;
    }

    public Date getCbegin() {
        return cbegin;
    }

    public void setCbegin(Date cbegin) {
        this.cbegin = cbegin;
    }

    public String getCdirection() {
        return cdirection;
    }

    public void setCdirection(String cdirection) {
        this.cdirection = cdirection;
    }

    public Integer getTidl() {
        return tidl;
    }

    public void setTidl(Integer tidl) {
        this.tidl = tidl;
    }

    public Integer getTidh() {
        return tidh;
    }

    public void setTidh(Integer tidh) {
        this.tidh = tidh;
    }

    public ClassService getClassService() {
        return classService;
    }

    public void setClassService(ClassService classService) {
        this.classService = classService;
    }

    public JSONArray getClassJson() {
        return ClassJson;
    }

    public void setClassJson(JSONArray classJson) {
        ClassJson = classJson;
    }

    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
    }
}
