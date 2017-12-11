package com.wangyinghao.service;

import com.wangyinghao.bean.Students;

/**
 * Created by 王英豪 on 2017/12/7.
 */
public interface StudentServiceDao {
    //实现登陆功能（查询students表）
    public Students selectstudents(Students students);
}
