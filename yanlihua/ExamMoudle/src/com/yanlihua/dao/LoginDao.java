package com.yanlihua.dao;

import com.yanlihua.bean.Students;
import com.yanlihua.bean.Teachers;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/23.
 */
public interface LoginDao {
    //角色教师登录信息
    public List<Teachers> selectTeachersLoginInfoBynamepwdroleLoginDao(String tnumber,String tpassword);
    //角色学生登录信息
    public List<Students> selectStudentsLoginInfoBynamepwdroleLoginDao(String snumber, String spassword);
}
