package com.chengshuai.controller;

import com.chengshuai.bean.message;
import com.chengshuai.service.MessageService;
import com.chengshuai.service.MessageServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * Created by king on 12/6/2017.
 */
public class SelectMessageController extends ActionSupport {
    private Integer mid;
    private String mname;
    private JSONObject jsonObject = new JSONObject();
    private String jsonresult;
    private JSONArray jsonarry;

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
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

    public String SelectMessage() {

        MessageService service = new MessageServiceImpl();

        List<message> list = service.SelectMessageBymidAndmname(mid, mname);
        if (list != null || list.size() != 0) {
            jsonarry = JSONArray.fromObject(list);
        }
        jsonresult = jsonarry.toString();

        return "showsuccess";

    }
}
