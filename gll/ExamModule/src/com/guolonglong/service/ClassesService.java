package com.guolonglong.service;

import com.guolonglong.bean.Classes;
import com.guolonglong.bean.Students;
import com.guolonglong.bean.Teachers;

import java.util.List;

/**
 * Created by lenovo on 2017/12/1.
 */
public interface ClassesService {
    //查询班级所有信息
    public List<Classes> selectClassesAll();
    //通过入学年份，所属方向，讲师，班主任查询班级信息
    public List<Classes> selectClassesByBeginOrDirectionOrTeacherlOrTeacherh(String cbegin, String cdirection, Integer tdil, Integer tidh);
   //通过ID查询Classes
    public Classes selectClassesById(Integer cid);
    //添加 或 修改 班级信息
    public Classes insertOrupdateClassesInfo(Classes classes);


}
