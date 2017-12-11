package com.wangmengyuan.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wangmengyuan.Service.ClassesService;
import com.wangmengyuan.Service.ClassesServiceImpl;
import com.wangmengyuan.bean.Classes;
import com.wangmengyuan.bean.Teachers;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * Created by Administrator on 2017/12/5.
 */
public class ClassesController extends ActionSupport implements ModelDriven {
    private ClassesService classesService = new ClassesServiceImpl();
    private JSONObject jsonObject=new JSONObject();
    private JSONArray jsonArray;
    private String jsonstr;
    private String teachersinfo;
    private Classes classes=new Classes();
    //讲师
    private String tidl;
    //班主任
    private String tidh;


    //查询班级所有信息
    public String showall(){
        List<Classes> classesList=classesService.selectAllClasses();
        if (classesList!=null && classesList.size()!=0){
            jsonArray=JSONArray.fromObject(classesList);
        }
        jsonstr=jsonArray.toString();
        return "successes";
    }
    //查询讲师姓名
    public String selectTeachersTjob0(){
        List<Teachers> teachersList = classesService.selectTeachersByTjob0();
        jsonArray = JSONArray.fromObject(teachersList);
        jsonstr = jsonArray.toString();
        return  "success";
    }
    //查询班主任姓名
    public String selectTeachersTjob1(){
        List<Teachers> teachersList =classesService.selectTeachersByTjob1();
        jsonArray = JSONArray.fromObject(teachersList);
        jsonstr = jsonArray.toString();
        return  "success";

    }
    //四个条件的班级查询
    public String select(){
        Integer tidhid=0;
        Integer tidlid=0;
        if (tidh!=null &&!tidh.equals("")) {
            tidhid = Integer.valueOf(tidh);
        }
        if (tidl!=null &&!tidl.equals("")) {
            tidlid = Integer.valueOf(tidl);
        }
        List<Classes> classesList=classesService.selectClassesBy(classes.getCbegin(),classes.getCdirection(),tidhid,tidlid);
            jsonArray=JSONArray.fromObject(classesList);
        jsonstr=jsonArray.toString();
        return "success";

    }

    //saveOrupdate
    public  String saveOrupdateClasses(){
        if(classes.getCid()==null){
            Classes classeser = new Classes();
            classeser.setCname(classes.getCname());
            System.out.println(classes.getCname());
            classeser.setCnumber(classes.getCnumber());
            classeser.setCdirection(classes.getCdirection());
            //String转成Int
            Integer idl = Integer.parseInt(tidl);
            Integer idh = Integer.parseInt(tidh);
            //new 两个对象 把转类型后的数据放在对象里面
            Teachers teachers1 = new Teachers();
            teachers1.setTid(idl);
            Teachers teachersh = new Teachers();
            teachersh.setTid(idh);
            //对象放在classeser对象里面
            classeser.setTeachersl(teachers1);
            classeser.setTeachersh(teachersh);
            classeser.setCbegin(classes.getCbegin());
            classeser.setCg1(classes.getCg1());
            classeser.setCg2(classes.getCg2());
            classeser.setCg3(classes.getCg3());
            classeser.setCstate(classes.getCstate());
            classeser.setCremark(classes.getCremark());
            classesService.saevOrupdateClasses(classeser);

        }else {
            Classes classeser=classesService.QueryClasses(classes.getCid());
            classeser.setCname(classes.getCname());
            classeser.setCnumber(classes.getCnumber());
            classeser.setCdirection(classes.getCdirection());
            //String转成Int
            Integer idl = Integer.parseInt(tidl);
            Integer idh = Integer.parseInt(tidh);
            //new 两个对象 把转类型后的数据放在对象里面
            Teachers teachers1 = new Teachers();
            teachers1.setTid(idl);
            Teachers teachersh = new Teachers();
            teachersh.setTid(idh);
            //对象放在classeser对象里面
            classeser.setTeachersl(teachers1);
            classeser.setTeachersh(teachersh);
            classeser.setCbegin(classes.getCbegin());
            classeser.setCg1(classes.getCg1());
            classeser.setCg2(classes.getCg2());
            classeser.setCg3(classes.getCg3());
            classeser.setCstate(classes.getCstate());
            classeser.setCremark(classes.getCremark());
            classesService.saevOrupdateClasses(classeser);
        }

        return  "teachersinfo";
    }










    public String getJsonstr() {
        return jsonstr;
    }

    public void setJsonstr(String jsonstr) {
        this.jsonstr = jsonstr;
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

    public String getTidl() {
        return tidl;
    }

    public void setTidl(String tidl) {
        this.tidl = tidl;
    }

    public String getTidh() {
        return tidh;
    }

    public void setTidh(String tidh) {
        this.tidh = tidh;
    }

    @Override
    public Object getModel() {
        return null;
    }
}
