package com.zhanglong.service;

import com.zhanglong.bean.Students;
import com.zhanglong.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/11/23 0023.
 */
public interface LoginService {
    //教师登录
    public List<Teachers> selectBytnameandtpassword(String tname, String tpassword);
    //学生登录
    public List<Students> selectBysnameandspassword(String sname, String spassword);
}
