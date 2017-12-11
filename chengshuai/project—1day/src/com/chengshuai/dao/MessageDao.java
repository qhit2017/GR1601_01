package com.chengshuai.dao;

import com.chengshuai.bean.message;

import java.util.List;

/**
 * Created by king on 12/5/2017.
 */
public interface MessageDao extends BaseDao {
    //查询所有信息的方法
    public List<message> SelectMessageAllDao();

    //根据条件查询Dao

    public  List<message> SelectMessageBymidAndmnameDao(Integer mid ,String mname);


    //增加教师

    public  void  InsertMessageDao(message message);

    //  根据id查询
    public  message SelectMessageBymidDao(Integer mid);

}
