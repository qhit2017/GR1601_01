package com.jinmengjie.dao;

import com.jinmengjie.bean.Classes;
import com.jinmengjie.bean.Teachers;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/11/29/029.
 */
public interface ClassesDao  {
    //查询班级的所有信息
    public List<Classes>selectAllClassInfo();

    /*0是讲师，1是班主任*/
    //根据岗位查询讲师信息
    public List<Teachers>  selectTeacherTjobByTjob0(Integer tjob);

    //根据岗位查询班主任信息
    public List<Teachers> selectTeacherTjobByTjob1(Integer tjob);

    //查询入学年份并显示信息*（cbegin开班日期）
    public  List<Classes> sleectbeginclassBycbegin();

    //根据界面的四个条件查询所有信息并显示到table中
    public  List<Classes> selectClassesInfoBycebginOrcdirectionOrtidlortidh(String cbegin,String cdirection,Integer tidl,Integer tidh);

   //根据ID做精确查询（主界面的编辑操作）
    public  Classes selectclassesinfoBycid(Integer cid);


    //增加所有班级信息
    public  void insertOrUpdateClassesInfo(Classes classes);

    //根据班级名称查班级iD
    public  Classes selectClassescnameByCid(String cname);
}
