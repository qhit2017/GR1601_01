package com.yaokaiwen.service;

import com.yaokaiwen.bean.Students;
import com.yaokaiwen.bean.Teachers;

import java.util.List;

/**
 * Created by DELL on 2017/11/24.
 */
public interface LoginService {
    //教师登录查询用户名密码
    public Boolean selectTeachersByNameandpasswordService(Teachers teachers);
    //学生登录查询用户名密码
    public Boolean selectStudentsByNameandpasswordService(Students students);
    //查询教师所有信息
    public List<Teachers> selectTeachersAllService();
}
