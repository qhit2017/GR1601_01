package com.yaokaiwen.service;

import com.yaokaiwen.bean.Classes;
import com.yaokaiwen.bean.Teachers;

import java.util.List;

/**
 * Created by DELL on 2017/11/26.
 */
public interface TeachersService {
    //根据条件询查教师信息
    public List<Teachers> selectTeachersAllBy(Teachers teachers);
    //根据日期做模糊询查
    public String selectTeachersByDate(String date);
    //修改教师
    public void insertOrUpdateTeachers(Teachers teachers);
    //根据tnumber查询
    public Teachers selectTeachersByTnumberService(String tnumber);
    //根据tid查询
    public Teachers selectTeachersByTidService(Integer tid);
    //根据tid删除
    public void daleteteachersService(Teachers teachers);
}
