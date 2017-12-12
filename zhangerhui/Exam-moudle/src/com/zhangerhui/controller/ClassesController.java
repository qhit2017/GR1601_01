package com.zhangerhui.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zhangerhui.bean.Classes;
import com.zhangerhui.bean.Teachers;
import com.zhangerhui.service.ClassesService;
import com.zhangerhui.service.TeacherService;
import com.zhangerhui.service.impl.ClassesServiceImpl;
import com.zhangerhui.service.impl.TeacherServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * Created by Administrator on 2017/12/4/004.
 */
public class ClassesController extends ActionSupport {

    private String jsonresult;
    private JSONArray jsonarry;

    private Classes newclasses = new Classes();
    private JSONObject jsonObject = new JSONObject();
    private ClassesService service = new ClassesServiceImpl();
    private TeacherService servicet = new TeacherServiceImpl();

    //讲师
    private Integer tidl;
    //班主任
    private Integer tidh;
    /*班级id*/
    private Integer cid;
    /*班级代号*/
    private String cnumber;
    /*班级名称*/
    private String cname;
    /*所属方向*/
    private String cdirection;
    /*开班日期*/
    private String cbegin;
    /*G1开班人数*/
    private Integer cg1;
    /*G2开班人数*/
    private Integer cg2;
    /*G3开班人数*/
    private Integer cg3;
    /*状态*/
    private Integer cstate;
    /*备注*/
    private String cremark;


    //显示所有班级信息
    public String showclassesinfo() {

        List<Classes> classesList = service.selectClassesallinfo();
        if (classesList != null || classesList.size() != 0) {
            jsonarry = JSONArray.fromObject(classesList);
        }
        jsonresult = jsonarry.toString();

        return "showsuccess";

    }

    //下拉框里面显示班主任的名字
    public String selectallinfob() {
        List<Teachers> teachersListb = service.selectTeacherInfoByTjobClassServiceb();
        jsonarry = JSONArray.fromObject(teachersListb);
        jsonresult = jsonarry.toString();
        return "selectbsuccess";
    }

    //下拉框里面显示讲师的名字
    public String selectallinfoj() {
        List<Teachers> teachersListj = service.selectTeacherInfoByTjobClassServicej();
        jsonarry = JSONArray.fromObject(teachersListj);
        jsonresult = jsonarry.toString();
        return "selectjsuccess";
    }

    //根据四项查询班级
    public String selectfour() {

        List<Classes> classesList = service.selectClassByFour(cbegin, cdirection, tidl, tidh);

        jsonarry = JSONArray.fromObject(classesList);
        jsonresult = jsonarry.toString();
        return "selectfoursuccess";

    }

    //添加班级信息
    public String insertclass() {

        Classes classes = new Classes();
        classes.setCnumber(cnumber);
        classes.setCname(cname);
        classes.setCdirection(cdirection);

        Teachers teachersl = servicet.selectTeacherByTid(tidl);
        classes.setTeachersl(teachersl);
        Teachers teachersh = servicet.selectTeacherByTid(tidh);
        classes.setTeachersh(teachersh);

        classes.setCbegin(cbegin);
        classes.setCg1(cg1);
        classes.setCg2(cg2);
        classes.setCg3(cg3);
        classes.setCstate(cstate);
        classes.setCremark(cremark);

        service.insertclasses(classes);

        jsonObject.put("result", "true");
        jsonresult = jsonObject.toString();
        return "insertsuccess";

    }

    //根据cid查询信息
    public String selectclassbyid() {

        Classes classes = service.selectClassesinfoByCidClassess(cid);

        jsonObject = JSONObject.fromObject(classes);

        jsonresult = jsonObject.toString();

        return "cselectsuccess";
    }

    //根据cid条件修改信息
    public String editclass() {

        Classes classes = service.selectClassesinfoByCidClassess(cid);
        classes.setCnumber(cnumber);
        classes.setCname(cname);
        classes.setCdirection(cdirection);
        classes.setCbegin(cbegin);
        classes.setCstate(cstate);
        classes.setCremark(cremark);
        classes.setCg1(cg1);
        classes.setCg2(cg2);
        classes.setCg3(cg3);

        /*Teachers teachersl = servicet.selectTeacherByTid(tidl);
        System.out.println(teachersl.equals(null));

        Teachers teachersh = servicet.selectTeacherByTid(tidh);
        System.out.println(teachersh.equals(null));

        classes.setTeachersl(teachersh);
        classes.setTeachersh(teachersl);*/

        service.updateclasses(classes);

        jsonObject.put("result", "true");
        jsonresult = jsonObject.toString();
        return "editsuccess";
    }

    public String getJsonresult() {
        return jsonresult;
    }

    public void setJsonresult(String jsonresult) {
        this.jsonresult = jsonresult;
    }

    public JSONArray getJsonarry() {
        return jsonarry;
    }

    public void setJsonarry(JSONArray jsonarry) {
        this.jsonarry = jsonarry;
    }

    public Classes getNewclasses() {
        return newclasses;
    }

    public void setNewclasses(Classes newclasses) {
        this.newclasses = newclasses;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
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

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
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


}
