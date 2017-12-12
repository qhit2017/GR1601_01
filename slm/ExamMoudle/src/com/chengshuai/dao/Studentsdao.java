package com.chengshuai.dao;

import com.chengshuai.bean.Students;

import java.util.List;

/**
 * Created by slm on 2017/11/23.
 * 学生查询
 */
public interface Studentsdao {
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

    /*添加导入的数据*/
    public  void  SaveDao(List<Students> students);
}
