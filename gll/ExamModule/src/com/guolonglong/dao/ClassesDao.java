package com.guolonglong.dao;

import com.guolonglong.bean.Classes;
import com.guolonglong.bean.Teachers;
import com.guolonglong.dao.base.PublicDao;

import java.util.List;

/**
 * Created by lenovo on 2017/11/23.
 */
public interface ClassesDao extends PublicDao{
    //查询班级所有信息
    public List<Classes> selectClassesAll();
    //通过入学年份，所属方向，讲师，班主任查询班级信息
    public List<Classes> selectClassesByBeginOrDirectionOrTeacherlOrTeacherh(String cbegin, String cdirection ,Integer tidl, Integer tidh);
    //通过ID查询Classes
    public Classes selectClassesById(Integer cid);
}
