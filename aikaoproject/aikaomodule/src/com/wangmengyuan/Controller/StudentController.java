package com.wangmengyuan.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wangmengyuan.Service.StudentService;
import com.wangmengyuan.Service.StudentServiceImpl;
import com.wangmengyuan.bean.Students;
import net.sf.json.JSONArray;

import java.util.List;

/**
 * Created by Administrator on 2017/12/7.
 */
public class StudentController extends ActionSupport implements ModelDriven {

    private StudentService studentService = new StudentServiceImpl();
    private JSONArray jsonArray;
    private String jsonstr;
    private String snumber;
    private String sname;
    private String cid;

    public String showStudent(){
        List<Students> studentsList = studentService.selectAllStudentsinfo();
        if (studentsList!=null && studentsList.size()!=0){
            jsonArray=JSONArray.fromObject(studentsList);
        }
        jsonstr=jsonArray.toString();
        return "jsonstr";

    }
    //条件查询
    public String condition(){
        List<Students> studentsList=  studentService.querystnumber(snumber,sname);
        if(studentsList!=null && studentsList.size()!=0){
           jsonArray = JSONArray.fromObject(studentsList);
        }
        jsonstr=jsonArray.toString();
        return "success";
    }



    public String insertstudent(){

        return "success";
    }



    public String getJsonstr() {
        return jsonstr;
    }

    public void setJsonstr(String jsonstr) {
        this.jsonstr = jsonstr;
    }

    @Override
    public Object getModel() {
        return null;
    }

    public String getSnumber() {
        return snumber;
    }

    public void setSnumber(String snumber) {
        this.snumber = snumber;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }
}
