package com.guolonglong.service;

import com.guolonglong.bean.Teachers;

import java.util.List;

/**
 * Created by lenovo on 2017/11/26.
 */
public interface TeachersService {
    //查询所有
    public List<Teachers> selectTeachersAll();
    //通过账号 姓名 岗位查询
    public List<Teachers> selectTeacherBynumberOrnameOrjob(String tnumber,String tname,Integer tjob);
    //添加教师信息
    public Teachers queryTnumber(Teachers teachers);
    //添加教师信息
    public Teachers insertTeachersInfo(Teachers teachers);
    //通过 tnumber 查询Teachers
    public List<Teachers> selectTeachersByNumber(String tnumber);
    //通过 tid 查询Teachers
    public Teachers selectTeachersById(Integer tid);
    //修改教师信息
    public Teachers updateTeachersInfo(Teachers teachers);
    //重置密哦
    public Teachers updateTeachersPwd(Teachers teachers);
    //删除教师信息
    public boolean deleteTeachersInfo(Teachers teachers);
}
