package com.guolonglong.controller;

import com.guolonglong.service.QuestionBankService;
import com.guolonglong.service.impl.QuestionBankServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by lenovo on 2017/12/10.
 */
public class CreatePaperController extends ActionSupport {
    private Integer [] allqid;

    private QuestionBankService service = new QuestionBankServiceImpl();
    public String selectpaper(){
        for (int i=0;i<allqid.length;i++){
            service.crearePaperByQid(allqid[i]);
        }

        return "exampaper";
    }

    public Integer[] getAllqid() {
        return allqid;
    }

    public void setAllqid(Integer[] allqid) {
        this.allqid = allqid;
    }
}
