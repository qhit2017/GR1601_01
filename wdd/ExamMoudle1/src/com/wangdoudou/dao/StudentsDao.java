package com.wangdoudou.dao;

import com.wangdoudou.bean.Students;

import java.util.List;

/**
 * Created by 王豆豆 on 2017/12/3.
 */
public interface StudentsDao {
    //查询学生界面信息
    public List<Students>selectAllStudentsinfo();
   //根据id查询信息
    public Students selectById(Students students);
    //条件查询信息
    public List<Students>selectStudentsBysnumberAndsname(String snumber,String sname);
    //根据学号模糊查询
    public List<Students>selectStudentBysnumber(String snumber);
    //添加学生或修改学生信息
    public void saveOrupdateStudentinfo(Students students);
    //删除
    public void deleteStudentsinfo(Students students);
}
