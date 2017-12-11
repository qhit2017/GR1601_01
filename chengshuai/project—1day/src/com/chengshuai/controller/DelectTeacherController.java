package com.chengshuai.controller;

import com.chengshuai.bean.message;
import com.chengshuai.service.MessageService;
import com.chengshuai.service.MessageServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by king on 12/7/2017.
 */
public class DelectTeacherController extends ActionSupport {

    private Integer mid ;

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    MessageService service = new MessageServiceImpl();

    public String deleteteacher(){

        System.out.println(mid);

        message message1 =service.SelectMessageBymid(mid);
        service.DelectMessageBMidInfo(message1);

        return "test";

    }

}
