package com.cj.Controller;

import com.cj.Bean.Teachers;
import com.cj.Service.TeachersService;
import com.cj.Service.TeachersServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;

import java.util.List;

/**
 * Created by cj on 2017/11/26.
 */
public class Teacherconller extends ActionSupport {
    TeachersService teachersservice=new TeachersServiceImpl();
    private JSONArray teacherJson;
    private String jsonStr;
    private String tnumber;
    private String tname;
    private String tjob;
        /*显示老师数据*/
    public String teacher(){
       List<Teachers> teacherlist= teachersservice.selectTeacherAll();
        if (teacherlist!=null ||teacherlist.size()!=0){
            //把list数据转换成JSONarray

            teacherJson=JSONArray.fromObject(teacherlist);

        }
        //把JSONarray数据转换成String
        jsonStr=teacherJson.toString();
        return "teacher";
    }

    //根据条件查询老师信息
   public String selectteacher(){
     Integer job  = Integer.parseInt(tjob);
   List<Teachers>rsteacher= teachersservice.selectTeacherMyTnumberOrtnameOrTjib(tnumber,tname,job);
   if (rsteacher!=null){
       teacherJson=JSONArray.fromObject(rsteacher);
      }
    jsonStr=teacherJson.toString();
    return "teacher";
    }
    public JSONArray getTeacherJson() {
        return teacherJson;
    }

    public void setTeacherJson(JSONArray teacherJson) {
        this.teacherJson = teacherJson;
    }

    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
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

    public TeachersService getTeachersservice() {
        return teachersservice;
    }

    public void setTeachersservice(TeachersService teachersservice) {
        this.teachersservice = teachersservice;
    }


    public String getTjob() {
        return tjob;
    }

    public void setTjob(String tjob) {
        this.tjob = tjob;
    }
}
