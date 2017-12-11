package com.zhanglong.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zhanglong.bean.Subject;
import com.zhanglong.bean.Testpaper;
import com.zhanglong.service.ShijuanService;
import com.zhanglong.service.impl.ShijuanServiceImpl;
import net.sf.json.JSONArray;

import java.util.List;

/**
 * Created by Administrator on 2017/12/10 0010.
 */
public class ShijuanController extends ActionSupport implements ModelDriven {
    private Testpaper testpaper=new Testpaper();
    private ShijuanService service=new ShijuanServiceImpl();
    private JSONArray jsonArray;
    private String jsonstr;
    private Integer suid;

    //查询所有Testpaper
    public String selectTestpaper(){
        List<Testpaper>testpaperList=service.selectxinxi();
        if(testpaperList.size()!=0||testpaperList!=null){
            jsonArray=JSONArray.fromObject(testpaperList);
        }
         jsonstr=jsonArray.toString();
         return "selectTestpaper";

    }
    //下拉框查询科目
    public String xialakuang(){
       List<Subject>subjectList= service.selectkemuxialakaung();
       if (subjectList.size()!=0||subjectList!=null){
           jsonArray=JSONArray.fromObject(subjectList);
       }
       jsonstr=jsonArray.toString();
       return "xialakuang";
    }
    //根据5个条件查询
    public String fivechaxun(){
        List<Testpaper>testpaperList= service.selectFivechaxun(suid,testpaper.getTtype(),testpaper.getTstate());
        if (testpaperList.size()!=0||testpaperList!=null){
            jsonArray=JSONArray.fromObject(testpaperList);
        }
        jsonstr=jsonArray.toString();
        return "fivechaxun";
    }

    public Integer getSuid() {
        return suid;
    }

    public void setSuid(Integer suid) {
        this.suid = suid;
    }

    public ShijuanService getService() {
        return service;
    }

    public void setService(ShijuanService service) {
        this.service = service;
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public String getJsonstr() {
        return jsonstr;
    }

    public void setJsonstr(String jsonstr) {
        this.jsonstr = jsonstr;
    }

    public Testpaper getTestpaper() {
        return testpaper;
    }

    public void setTestpaper(Testpaper testpaper) {
        this.testpaper = testpaper;
    }

    @Override
    public Object getModel() {
        return testpaper;
    }
}
