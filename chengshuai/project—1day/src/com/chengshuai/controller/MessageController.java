package com.chengshuai.controller;

import com.chengshuai.bean.message;
import com.chengshuai.service.MessageService;
import com.chengshuai.service.MessageServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * Created by king on 12/5/2017.
 */
public class MessageController extends ActionSupport {

    private String jsonresult;
    private JSONArray jsonarry;

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

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    private JSONObject jsonObject = new JSONObject();
    MessageService service = new MessageServiceImpl();



    public String showteacherinfo() {



        List<message> messageList = service.SelectMessageAll();
        if (messageList != null || messageList.size() != 0) {
            jsonarry = JSONArray.fromObject(messageList);
        }
        jsonresult = jsonarry.toString();

        return "showsuccess";

    }

}
