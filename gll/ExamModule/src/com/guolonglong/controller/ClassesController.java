package com.guolonglong.controller;

import com.guolonglong.bean.Classes;
import com.guolonglong.bean.Teachers;
import com.guolonglong.service.ClassesService;
import com.guolonglong.service.impl.ClassesServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by lenovo on 2017/12/1.
 */
public class ClassesController extends ActionSupport {
    private JSONArray classesJson;
    private String strJson;

    private Integer cid;
    private String cnumber;
    private String cname;
    private String cdirection;
    private String cbegin;
    private String cremark;
    private Integer cg1;
    private Integer cg2;
    private Integer cg3;
    private Integer cstate;
    private Teachers teachersl;
    private Teachers teachersh;

    private Integer tidl;
    private Integer tidh;

    private ClassesService service = new ClassesServiceImpl();
    HttpSession session = ServletActionContext.getRequest().getSession();
    public String classesshowlist(){
        List<Classes> classesList = service.selectClassesAll();
        if (classesList!=null && classesList.size()!=0){
            classesJson = JSONArray.fromObject(classesList);
        }
        strJson = classesJson.toString();
        return "class";
    }
    public String selectclassbycbeginorcdirectionorteacherslorteachersh(){
        System.out.println(cbegin);
        List<Classes> classesList = service.selectClassesByBeginOrDirectionOrTeacherlOrTeacherh(cbegin,cdirection,tidl,tidh);
        if (classesList!=null && classesList.size()!=0){
            classesJson = JSONArray.fromObject(classesList);
        }
        strJson = classesJson.toString();
        return "class";
    }
    public String findclasses(){
        return "insertclasses";
    }
    //增加班级
    public String insertclassesinfo(){
        System.out.println("cstate"+cstate);
        Classes classes = new Classes();
        classes.setCnumber(cnumber);
        classes.setCname(cname);
        classes.setCdirection(cdirection);
        classes.setCbegin(cbegin);
        classes.setCremark(cremark);
        classes.setCstate(cstate);
        classes.setCg1(cg1);
        classes.setCg2(cg2);
        classes.setCg3(cg3);
        classes.setTeachersl(teachersl);
        classes.setTeachersh(teachersh);
        service.insertOrupdateClassesInfo(classes);
        return "classes";
    }
    public String updateclass(){
        System.out.println(cid);
        Classes classes = service.selectClassesById(cid);
        System.out.println(classes.getCnumber());
        session.setAttribute("classes",classes);
        return "updateclasses";
       /* classes.setCnumber(cnumber);
        classes.setCname(cname);
        classes.setCdirection(cdirection);
        classes.setCbegin(cbegin);
        classes.setCremark(cremark);
        classes.setCstate(cstate);
        classes.setCg1(cg1);
        classes.setCg2(cg2);
        classes.setCg3(cg3);
        classes.setTeachersl(teachersl);
        classes.setTeachersh(teachersh);
        service.insertOrupdateClassesInfo(classes);*/

    }

    public JSONArray getClassesJson() {
        return classesJson;
    }

    public void setClassesJson(JSONArray classesJson) {
        this.classesJson = classesJson;
    }

    public String getStrJson() {
        return strJson;
    }

    public void setStrJson(String strJson) {
        this.strJson = strJson;
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

    public String getCdirection() {
        return cdirection;
    }

    public void setCdirection(String cdirection) {
        this.cdirection = cdirection;
    }

    public String getCbegin() {
        return cbegin;
    }

    public void setCbegin(String cbegin) {
        this.cbegin = cbegin;
    }

    public String getCremark() {
        return cremark;
    }

    public void setCremark(String cremark) {
        this.cremark = cremark;
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

    public Teachers getTeachersl() {
        return teachersl;
    }

    public void setTeachersl(Teachers teachersl) {
        this.teachersl = teachersl;
    }

    public Teachers getTeachersh() {
        return teachersh;
    }

    public void setTeachersh(Teachers teachersh) {
        this.teachersh = teachersh;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
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
}
