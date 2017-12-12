package com.zhangerhui.dao;

import com.zhangerhui.bean.Classes;
import com.zhangerhui.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/12/4/004.
 */
public interface ClassesDao extends BaseDao{

    //查询Classes表，显示所有信息
    public List<Classes>queryClassesallinfo();

    //四个条件的班级查询
    public List<Classes>queryClassByFour(String cbegin, String cdirection);

    //根据cid查询Classes对象的相关信息
    public Classes queryClassesByCid(Integer cid);

    //根据岗位查询班主任教师信息
    public List<Teachers>queryTeacherInfoByTjobClassDaob(Integer tjob);

    //根据岗位查询讲师信息
    public List<Teachers>queryTeacherInfoByTjobClassDaoj(Integer tjob);

}
