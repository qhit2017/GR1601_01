package com.wangdoudou.service;

import com.wangdoudou.bean.Students;
import com.wangdoudou.bean.Teachers;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 王豆豆 on 2017/11/23.
 */
public interface LoginService {

    //教师查询
    public List<Teachers> selectByUsers(String tname, String tpassword);
    //学生查询
    public List<Students> selectBy(String sname, String spassword);
}
