package com.cj.Dao;

import com.cj.Bean.Students;


import java.util.List;

/**
 * Created by cj on 2017/11/23.
 */
public interface StudentsDao {
    //学生登陆
    List<Students> selectStudent(String sname, String spassword);
    /*查询所有显示学生数据*/
    List<Students>selectStudentall();
    /*根据条件查询*/
    /*增加学生*/


}
