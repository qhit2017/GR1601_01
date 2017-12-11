package com.yaokaiwen.dao;

import com.yaokaiwen.bean.Teachers;

import java.util.List;

/**
 * Created by DELL on 2017/11/24.
 */
public interface TeachersDao extends BaseDao {
    //教师登录查询用户名密码
    public Teachers selectTeachersByNameandpassword(Teachers teachers);
    //查询教师所有信息
    public List<Teachers> selectTeachersAll();
    //根据条件询查教师信息
    public List<Teachers> selectTeachersAllBy(Teachers teachers);
    //根据日期做模糊询查
    public String selectTeachersByDate(String date);
    //根据tnumber查询
    public Teachers selectTeachersByTnumber(String tnumber);
    //根据tid查询
    public Teachers selectTeachersByTid(Integer tid);
}
