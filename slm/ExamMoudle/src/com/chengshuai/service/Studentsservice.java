package com.chengshuai.service;

import com.chengshuai.bean.Students;

import java.util.List;

/**
 * Created by slm on 2017/11/23.
 */
public interface Studentsservice {
    /*学生角色登录查询*/
    public List<Students> selectBysnameAndpwd(Students students);

    /*查询学生表中的所有数据*/
    public  List<Students>QueryStudentsAll();

    /*根据条件查询学生表的数据*/
    public  List<Students>QueryBysnumberOrNameOrCnameOrsattend(String snumber,String sname,String cname,String fx);

    /*添加或者修改*/
    public  void saveORupdate(Students students );

        /*根据ID查询数据库中的数据*/

    public  Students Queryandid( Integer id);
    /*导出数据表格*/
    public  String dowloadStudentsAll( String pash);

    /*导入数据表格*/
    public  String doloadStudentsSave(String path);














}
