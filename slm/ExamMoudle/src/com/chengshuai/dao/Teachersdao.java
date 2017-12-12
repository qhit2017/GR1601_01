package com.chengshuai.dao;

import com.chengshuai.bean.Classes;
import com.chengshuai.bean.Students;
import com.chengshuai.bean.Teachers;

import java.util.List;

/**
 * Created by slm on 2017/11/23.
 * <p>
 * 教师
 */
public interface Teachersdao {

    /*登录教师角色*/
    public List<Teachers> selectByTnameandTpwd(Teachers teachers);

    /*查询所有教师信息*/
    public List<Teachers> selectTeachersALL();

    /*根据ID查询数据库中的信息*/

    public Teachers selectByid(Teachers teachers);

    /*根据条件查询教师表中的信息*/

    public List<Teachers> selectBytnumberOrtnameOrtjob(Teachers teachers);

    /*添加教师编号*/
    public void saveTeachers(Teachers teachers);

    /*模糊查询编号信息*/
    public List<Teachers> selectLiketnumber(String tnumber);

    /*修改教师信息*/
    public void updateTeachers(Teachers teachers);

    /*删除教师信息*/
    public void deleteTeachersByid(Teachers teachers);




}
