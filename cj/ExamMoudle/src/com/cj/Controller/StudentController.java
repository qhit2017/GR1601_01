package com.cj.Controller;

import com.cj.Bean.Students;
import com.cj.Service.StudentsSerciceImpl;
import com.cj.Service.StudentsService;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;

import java.util.List;

/**
 * Created by cj on 2017/12/6.
 */
public class StudentController extends ActionSupport {
StudentsService studentsService=new StudentsSerciceImpl();

    private JSONArray studentJson;
    private String jsonStr;
/*显示学生数据*/
public String selectstudentall(){
  List<Students>  studentsList= studentsService.selectStudentall();
  if (studentsList!=null||studentsList.size()!=0){
      studentJson=JSONArray.fromObject(studentsList);
  }
    //把JSONarray数据转换成String
    jsonStr=studentJson.toString();
    return "student";
}



    public JSONArray getStudentJson() {
        return studentJson;
    }

    public void setStudentJson(JSONArray studentJson) {
        this.studentJson = studentJson;
    }

    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
    }
}
