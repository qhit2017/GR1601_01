package com.yushaoju.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.yushaoju.bean.Teachers;
import com.yushaoju.service.TeachersService;
import com.yushaoju.service.impl.TeachersServiceImpl;
import net.sf.json.JSONArray;

import java.util.List;

/**
 * Created by Svip on 2017/11/26.
 */
public class Homepagecontroller extends ActionSupport {
    private TeachersService teachersService =new TeachersServiceImpl();
    private JSONArray jsonArray;
    private String jsonStr;

    public String teachershowlist() {
        List<Teachers> teachersList=teachersService.queryTeacher();
        if(teachersList!=null || teachersList.size()!=0){
            jsonArray =JSONArray.fromObject(teachersList);
         }
        jsonStr= jsonArray.toString();
        return "success";
    }

    public void setTeachersService(TeachersService teachersService) {
        this.teachersService = teachersService;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public String getJsonStr() {
        return jsonStr;
    }

    public void setJsonStr(String jsonStr) {
        this.jsonStr = jsonStr;
    }
}
