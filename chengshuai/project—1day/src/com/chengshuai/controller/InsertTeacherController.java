package com.chengshuai.controller;

import com.chengshuai.bean.message;
import com.chengshuai.service.MessageService;
import com.chengshuai.service.MessageServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by king on 12/7/2017.
 */
public class InsertTeacherController extends ActionSupport {


    private String mname ;
    private String maddr ;
    private String mage ;
    private String msex ;
    private String mphone ;


    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMaddr() {
        return maddr;
    }

    public void setMaddr(String maddr) {
        this.maddr = maddr;
    }

    public String getMage() {
        return mage;
    }

    public void setMage(String mage) {
        this.mage = mage;
    }

    public String getMsex() {
        return msex;
    }

    public void setMsex(String msex) {
        this.msex = msex;
    }

    public String getMphone() {
        return mphone;
    }

    public void setMphone(String mphone) {
        this.mphone = mphone;
    }



    public String insertteacherinfo(){

        message message = new message();

        message.setMname(mname);
        message.setMaddr(maddr);
        message.setMsex(msex);
        message.setMage(mage);
        message.setMphone(mphone);


        System.out.println(maddr+mage+mname+mphone+msex);
        MessageService service = new MessageServiceImpl();
        service.InsertMessage(message);

        return  "test";


    }



}
