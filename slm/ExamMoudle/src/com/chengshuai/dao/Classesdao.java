package com.chengshuai.dao;

import com.chengshuai.bean.Classes;
import com.chengshuai.bean.Teachers;

import java.util.List;

/**
 * Created by slm on 2017/11/28.
 * 班级管理
 */
public interface Classesdao {
    /*查询班级表中的所有数据*/
    public List<Classes>QueryClassesAll();

    public  List<Teachers> QueryTeachersTjob(Integer tjob);

    /*根据条件查询班级表中的信息*/
    public List<Classes>QueryConditionalBycbeginAndcdirectionAndteacherslAndteachersh(String yers,String fx,String  tidl,String  tidh);

    /*添加班级或修改班级信息*/
    public  void saevOrupdate(Classes classes);
    /*根据id查询班级表中的数据*/
    public  Classes QueryClasses(Integer id);

}
