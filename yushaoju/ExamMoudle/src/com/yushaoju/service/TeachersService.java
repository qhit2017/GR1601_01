package com.yushaoju.service;

import com.yushaoju.bean.Students;
import com.yushaoju.bean.Teachers;

import java.util.List;

/**
 * Created by Svip on 2017/11/23.
 */
public interface TeachersService {
    //查询老师账号密码
    public List<Teachers> insertLand(String tname, String tpassword);
    //查询学生账号密码
    public List<Students> insertselectLand (String sname, String spassword);
    //查询所有信息
    public List<Teachers>queryTeacher();
    //查询老师信息
    public List<Teachers>selectTeacherByTnumberOrTnameOrjob(String number, String name, Integer job);
    //添加教师
    public List<Teachers> increaseTeachers(Teachers teachers);

}
