package com.chengshuai.dao;

import com.chengshuai.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/11/23.
 */
public interface TeachersDao extends  BaseDao {
    public Teachers select(Teachers teachers);
    public List<Teachers> selectTeacherByNameAndPwd(String name,String pwd);


    public List<Teachers> selectAllTeacher();

    public List<Teachers> selectTeacherByTnumberOrTnameOrTjob(String number,String name,Integer job);



    public List<Teachers> selectTeacherLikeTnumber(String number);

    public List<Teachers> selectTeacherByTjob(Integer tjob);


    public void insert(List<Teachers> teachersList);

}
