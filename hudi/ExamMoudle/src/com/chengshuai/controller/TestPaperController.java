package com.chengshuai.controller;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by Administrator on 2017/12/6.
 */
public class TestPaperController extends ActionSupport {
    private String title;
    private String [] timu;

    public String createTestPaper(){

        // testparper信息


        //questionid 数组
        System.out.println(timu);



        return "success";
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String[] getTimu() {
        return timu;
    }

    public void setTimu(String[] timu) {
        this.timu = timu;
    }
}
