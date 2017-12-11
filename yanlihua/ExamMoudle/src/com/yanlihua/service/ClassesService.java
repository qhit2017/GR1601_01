package com.yanlihua.service;

import com.yanlihua.bean.Classes;
import com.yanlihua.bean.Teachers;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/25.
 */
public interface ClassesService {
    //无条件查询所有班级信息(显示在table中)
    public List<Classes> selectAllClassInfoClassService();

    //根据岗位查询班主任教师信息(用到tname显示到下拉框中)
    public List<Teachers> selectTeacherInfoByTjobClassServiceb();

    //根据岗位查询讲师信息(用到tname显示到下拉框中)
    public List<Teachers> selectTeacherInfoByTjobClassServicej();

    //四个条件的班级查询
    public List<Classes> selectClassByFourConditionClassService(String cbegin,String cdirection,Integer tidh,Integer tidl);

    //新加班级信息save
    public void saveOrUpdateClassesinfoClassesService(Classes classes);

    //根据cid查询Classes对象的相关信息
    public Classes selectClassesinfoByCidClassesService(Integer cid);
}
