package com.yanlihua.service;

import com.yanlihua.bean.Students;
import com.yanlihua.bean.Teachers;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/23.
 */
public interface LoginService {
    //角色教师登录信息
    public List<Teachers> selectTeachersLoginInfoBynamepwdroleLoginService(String tnumber, String tpassword);

    //角色学生登录信息
    public List<Students> selectStudentsLoginInfoBynamepwdroleLoginService(String snumber, String spassword);
}
