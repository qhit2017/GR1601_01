package com.jinmengjie.service;

import com.jinmengjie.bean.Teachers;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/11/23/023.
 */
public interface TeachersServiceDao  {
    //实现教师登录（查询姓名和密码）
    public boolean selectteachers(String tname, String password);

    //显示教师的所有信息，查询所有（教师表）
    public List<Teachers> selectAllTechers();

    //根据账号，姓名，岗位做查询并显示到页面
    public  List<Teachers> selectteachertBynameOrtnumberOrtjob(Teachers teachers);

    //根据ID做精确查询（教师页面点击编辑要做的处理）
    public Teachers selectteacherByttid(Integer tid);

    //删除所有信息
    public  void deleteTeacherInfo(Teachers teachers);

    //模糊查询
    public  Teachers selectBytid(String tnumber);

    //增加教师信息
    public  void  saveTeacherInfoAndUpdate(Teachers teachers);
}
