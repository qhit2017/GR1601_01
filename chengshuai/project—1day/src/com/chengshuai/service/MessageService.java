package com.chengshuai.service;

import com.chengshuai.bean.message;

import java.util.List;

/**
 * Created by king on 12/5/2017.
 */
public interface MessageService {

    //查询所有信息的方法
    public List<message>SelectMessageAll();


    //根据条件查询

    public  List<message> SelectMessageBymidAndmname(Integer mid ,String mname);

    //增加教师

    public  void  InsertMessage(message message);

    //删除教师

    public  void DelectMessageBMidInfo(message message);


      //  根据id查询
    public message SelectMessageBymid(Integer mid);




}
