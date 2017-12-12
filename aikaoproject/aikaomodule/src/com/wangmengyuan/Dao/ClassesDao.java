package com.wangmengyuan.Dao;

import com.wangmengyuan.bean.Classes;
import com.wangmengyuan.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/12/5.
 */
public interface ClassesDao {
    //查询班级所有信息
    public List<Classes> selectAllClassesInfo();
    // 添加班级或修改班级信息
    public  void saevOrupdateClasses(Classes classes);
    //根据岗位查询讲师信息
    public List<Teachers>  selectTeachersByTjob0(Integer tjob);
    //根据岗位查询班主任信息
    public List<Teachers> selectTeachersByTjob1(Integer tjob);
    //条件查询
    public List<Classes> selectClassesBy(String cbegin,String cdirection);
    //根据id查询班级表中的数据
    public  Classes QueryClasses(Integer id);


}
