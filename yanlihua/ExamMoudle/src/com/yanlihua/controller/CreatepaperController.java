package com.yanlihua.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yanlihua.bean.Questionbank;
import com.yanlihua.bean.Subject;
import com.yanlihua.bean.Testpaper;
import com.yanlihua.service.CreatepaperService;
import com.yanlihua.service.QuestionBankService;
import com.yanlihua.service.impl.CreatepaperServiceImpl;
import com.yanlihua.service.impl.QuestionBankServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * Created by 晏利花 on 2017/12/3.
 */
public class CreatepaperController extends ActionSupport implements ModelDriven {
    private JSONArray jsonArray;
    private QuestionBankService questionBankService = new QuestionBankServiceImpl();
    private CreatepaperService createpaperService = new CreatepaperServiceImpl();
    public JSONObject jsonObject = new JSONObject();
    private String createpaperinfo;
    private Integer suid;
    private Testpaper testpaper = new Testpaper();
    private Integer [] selecttopic;
    //单选多选不同程度的题数
    private Integer ojd;
    private Integer oyb;
    private Integer okn;
    private Integer mjd;
    private Integer myb;
    private Integer mkn;

    //根据suid进行试题的显示
    public String selectsubjectinfobysuidway() {
        List<Questionbank> questionbankList = questionBankService.selectSuidNumberInQuestionBankQuestionBankService(suid);
        if (questionbankList.size() != 0 || questionbankList != null) {
            jsonArray = JSONArray.fromObject(questionbankList);
        }
        createpaperinfo = jsonArray.toString();
        System.out.println(questionbankList.size());
        System.out.println("createpaperinfo==================" + createpaperinfo);
        return "selectsubjectinfobysuidwayresult";
    }

    //选题组卷
    public String selecttopicgroup() {
       /* for(int i=0;i<selecttopic.length;i++){
            System.out.println("selecttopic+++++++++++++"+selecttopic[i]);
        }*/
        testpaper.setTtype("笔试");
        testpaper.setTstate("未开考");
        Subject subject=new Subject();
        subject.setSuid(suid);
        testpaper.setSubject(subject);
        createpaperService.insertTestPareperCreatepaperService(testpaper,selecttopic);
        System.out.println("=================================sdssssssssssssssssssss");
        jsonObject.put("result", "true");
        createpaperinfo = jsonObject.toString();
        System.out.println("createpaperinfo========="+createpaperinfo);
        return "selecttopicgroupresult";
    }
//随机组卷
public String savetestpaperinfo(){
    System.out.println("==================="+suid);
    Subject subject=new Subject();
    subject.setSuid(suid);
    testpaper.setSubject(subject);
    testpaper.setTtype("笔试");
    testpaper.setTstate("未开考");
    System.out.println("不同类型的题数："+ojd+";"+oyb+";"+okn+";"+mjd+";"+myb+";"+mkn);
    createpaperService.insertrandomTestPareperCreatepaperService(testpaper,ojd,oyb,okn,mjd,myb,mkn);
    jsonObject.put("result","true");
    createpaperinfo=jsonObject.toString();
    return "savetestpaperinforesult";
}
    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
    }

    public String getCreatepaperinfo() {
        return createpaperinfo;
    }

    public void setCreatepaperinfo(String createpaperinfo) {
        this.createpaperinfo = createpaperinfo;
    }

    public Integer getSuid() {
        return suid;
    }

    public void setSuid(Integer suid) {
        this.suid = suid;
    }

    public Testpaper getTestpaper() {
        return testpaper;
    }

    public void setTestpaper(Testpaper testpaper) {
        this.testpaper = testpaper;
    }

    public Integer[] getSelecttopic() {
        return selecttopic;
    }

    public void setSelecttopic(Integer[] selecttopic) {
        this.selecttopic = selecttopic;
    }

    public JSONObject getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(JSONObject jsonObject) {
        this.jsonObject = jsonObject;
    }

    public Integer getOjd() {
        return ojd;
    }

    public void setOjd(Integer ojd) {
        this.ojd = ojd;
    }

    public Integer getOyb() {
        return oyb;
    }

    public void setOyb(Integer oyb) {
        this.oyb = oyb;
    }

    public Integer getOkn() {
        return okn;
    }

    public void setOkn(Integer okn) {
        this.okn = okn;
    }

    public Integer getMjd() {
        return mjd;
    }

    public void setMjd(Integer mjd) {
        this.mjd = mjd;
    }

    public Integer getMyb() {
        return myb;
    }

    public void setMyb(Integer myb) {
        this.myb = myb;
    }

    public Integer getMkn() {
        return mkn;
    }

    public void setMkn(Integer mkn) {
        this.mkn = mkn;
    }

    @Override
    public Object getModel() {
        return testpaper;
    }
}
