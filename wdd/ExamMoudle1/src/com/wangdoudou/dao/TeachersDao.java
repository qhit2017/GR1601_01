package com.wangdoudou.dao;

import com.wangdoudou.bean.Teachers;

import java.util.List;

/**
 * Created by 王豆豆 on 2017/11/23.
 */
public interface TeachersDao {
    //查询教师所有数据
    public List<Teachers> selectByAllinfo();
    //添加教师账号
    public void insertTeachers(Teachers teachers);
    //根据id查询信息
    public Teachers selectByTid(Teachers teachers);
    //根据条件查询
    public List<Teachers>selectTeachersByTnumberAndTname(String tnumber,String tname,String tjob);
    //根据账号模糊查询
    public List<Teachers>selectTeachersLikeTnumber(String tnumber);
    //修改密码
    public void updateTeachersByTid(Teachers teachers);
    //删除
    public void deleteTeachersByTid(Teachers teachers);


}
