package com.chengshuai.service;

import com.chengshuai.bean.Students;
import com.chengshuai.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/11/24.
 */
public interface LoginService {

//查老师
    public List<Teachers>  loginTeacher(String name,String pwd);
// 查学生
    public List<Students>  loginStudent(String name, String pwd);
}
