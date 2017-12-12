package com.yanlihua.dao;

import com.yanlihua.bean.Teachers;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/23.
 */
public interface TeachersDao {
    //无条件查询教师的都有信息
    public List<Teachers> selectAllTeachersInfoTeachersDao();

    //根据三个条件查询（编号，姓名，岗位）
    public List<Teachers> selectThreeConditionTeachersDao(String tnumber,String tname,Integer tjob);
    public List<Teachers> selectThreeConditionTeachersDao1(Teachers teachers);

    //根据tid进行查询
    public Teachers selectTeachersInfoByTidTeacherDao(Integer tid);

    //教师的增加和修改
    public void saveOrUpdateTeachersInfoTeacherDao(Teachers teachers);

    //根据id进行对象的删除
    public void deleteTeacherByIdBaseDao(Teachers teachers);

    //模糊查询出今天每一次添加的最后一条数据（根据编号,进行有序的随机生成）
    public Teachers selectEndTeacherDataByTnumberTeachersDao();

    //模糊查询出tnumber(教师编号)
    public List<Teachers> selectTeacherInfoLikeTnumberTeacherService(String tnumber);
}
