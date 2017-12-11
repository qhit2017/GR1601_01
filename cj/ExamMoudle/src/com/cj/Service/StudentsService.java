package com.cj.Service;

import com.cj.Bean.Students;

import java.util.List;

/**
 * Created by cj on 2017/11/23.
 */
public interface StudentsService {
    /*登陆*/
    List<Students> selectStudents(String sname, String spassword);
    /*查询所有  显示学生*/
    List<Students>selectStudentall();
}
