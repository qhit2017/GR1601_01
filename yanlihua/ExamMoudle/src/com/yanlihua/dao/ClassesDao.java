package com.yanlihua.dao;

import com.yanlihua.bean.Classes;
import com.yanlihua.bean.Students;
import com.yanlihua.bean.Teachers;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/25.
 */
public interface ClassesDao {
    //无条件查询所有班级信息(显示在table中)
    public List<Classes> selectAllClassInfoClassDao();

    //根据岗位查询班主任教师信息(用到tname显示到下拉框中)
    public List<Teachers> selectTeacherInfoByTjobClassDaob(Integer tjob);

    //根据岗位查询讲师信息(用到tname显示到下拉框中)
    public List<Teachers> selectTeacherInfoByTjobClassDaoj(Integer tjob);

    //四个条件的班级查询
    public List<Classes> selectClassByFourConditionClassDao(String cbegin,String cdirection);

    //新加班级信息save
    public void saveOrUpdateClassesinfoClassesDao(Classes classes);

    //根据cid查询Classes对象的相关信息
    public Classes selectClassesinfoByCidClassesDao(Integer cid);

    public List<Students> select(Classes classes);
}
