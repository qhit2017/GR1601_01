package com.chengshuai.service.impl;

import com.chengshuai.bean.Classes;
import com.chengshuai.bean.Teachers;
import com.chengshuai.dao.Classesdao;
import com.chengshuai.dao.impl.Classesimpl;
import com.chengshuai.service.Classesservice;

import java.util.List;

/**
 * Created by slm on 2017/11/28.
 * 班级
 */
public class Classesserviceimpl  implements Classesservice{
    private Classesdao classesdao = new Classesimpl();
    @Override
    public List<Classes> QueryClassesAll() {
        /*查询班级表中所有的数据*/
        return classesdao.QueryClassesAll();
    }

    @Override
    public List<Teachers> QueryTeachersTjob0() {
        /*c查询班主任角色*/
        return classesdao.QueryTeachersTjob(0);
    }

    @Override
    public List<Teachers> QueryTeachersTjob1() {
          /*c查询讲师角色*/
        return classesdao.QueryTeachersTjob(1);
    }

    @Override
    public List<Classes> QueryConditionalBycbeginAndcdirectionAndteacherslAndteachersh(String yers, String fx, String tidl, String tidh) {
        return classesdao.QueryConditionalBycbeginAndcdirectionAndteacherslAndteachersh(yers,  fx,tidl, tidh);
    }

    @Override
    public void saevOrupdate(Classes classes) {
        classesdao.saevOrupdate(classes);
    }

    @Override
    public Classes QueryClasses(Integer id) {
        return classesdao.QueryClasses(id);
    }
}
