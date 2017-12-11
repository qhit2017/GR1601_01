package com.wangmengyuan.Service;

import com.wangmengyuan.bean.Classes;
import com.wangmengyuan.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/12/5.
 */
public interface ClassesService {
    //查询班级所有信息
    public List<Classes> selectAllClasses();
    // 添加班级或修改班级信息
    public  void saevOrupdateClasses(Classes classes);
    //根据岗位查询讲师信息
    public List<Teachers>  selectTeachersByTjob0();
    //根据岗位查询班主任信息
    public List<Teachers> selectTeachersByTjob1();
    //条件查询
    public List<Classes> selectClassesBy(String cbegin,String cdirection,Integer tidh,Integer tidl);
    //根据id查询班级表中的数据
    public  Classes QueryClasses(Integer id);
}
