package com.chengshuai.service;

import com.chengshuai.bean.message;
import com.chengshuai.dao.MessageDao;
import com.chengshuai.dao.MessageDaoImpl;

import java.util.List;

/**
 * Created by king on 12/5/2017.
 */
public class MessageServiceImpl implements MessageService {
    @Override
    //查询全部信息显示到主页面上
    public List<message> SelectMessageAll() {
        MessageDao dao = new MessageDaoImpl();
        return  dao.SelectMessageAllDao();
    }

    @Override
    //根据条件查询
    public List<message> SelectMessageBymidAndmname(Integer mid, String mname) {
        MessageDao dao = new MessageDaoImpl();
       return dao.SelectMessageBymidAndmnameDao(mid,mname);
    }

    @Override
    public void InsertMessage(message message) {
        MessageDao dao = new MessageDaoImpl();
          dao.InsertMessageDao(message);

    }

    @Override
    public void DelectMessageBMidInfo(message message) {
        MessageDao dao =  new MessageDaoImpl();
        dao.delete(message);
        return ;
    }

    @Override
    public message SelectMessageBymid(Integer mid) {
        MessageDao dao =  new MessageDaoImpl();
       return   dao.SelectMessageBymidDao(mid);
    }
}
