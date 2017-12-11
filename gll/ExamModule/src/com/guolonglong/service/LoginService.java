package com.guolonglong.service;

import com.guolonglong.bean.Students;
import com.guolonglong.bean.Teachers;

import java.util.List;

/**
 * Created by lenovo on 2017/11/23.
 */
public interface LoginService {
    //查询老师
    public List<Teachers> selectTeachers(String tname,String tpassword);
    //查询学生
    public List<Students> selectStudents(Students students);
}
