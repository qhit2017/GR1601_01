package com.zhangerhui.service;

import com.zhangerhui.bean.Classes;
import com.zhangerhui.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/12/4/004.
 */
public interface ClassesService {

    public List<Classes> selectClassesallinfo();

    //根据岗位查询班主任教师信息
    public List<Teachers> selectTeacherInfoByTjobClassServiceb();

    //根据岗位查询讲师信息(用到tname显示到下拉框中)
    public List<Teachers> selectTeacherInfoByTjobClassServicej();

    //四个条件的班级查询
    public List<Classes> selectClassByFour(String cbegin, String cdirection, Integer tidh, Integer tidl);

    //新加班级信息save
    public void insertclasses(Classes classes);

    //班级信息修改update
    public void updateclasses(Classes classes);

    //根据cid查询Classes对象的相关信息
    public Classes selectClassesinfoByCidClassess(Integer cid);


}
