package com.wangmengyuan.Dao;

import com.wangmengyuan.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/12/4.
 */
public interface teacherDao {
    //教师查询
    public List<Teachers> selectAll();
    //添加教师账号
    public void insertTeachers(Teachers teachers);
    //根据条件查询
    public List<Teachers> selecttnumberOrtnameOrtjob(String tnumber,String tname,String tjob);
    //根据账号模糊查询
    public List<Teachers>selectTeachersLikeTnumber(String tnumber);

    //根据ID查询信息
    public Teachers selectByTid(Teachers teachers);
    //修改密码
    public void updateTeachersByTid(Teachers teachers);
    //删除
    public void deleteTeachersByTid(Teachers teachers);
    //查询tjob
    public List<Teachers> selecttjob(String tjob);



}
