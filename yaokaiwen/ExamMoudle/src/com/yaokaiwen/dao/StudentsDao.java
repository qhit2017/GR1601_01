package com.yaokaiwen.dao;

import com.yaokaiwen.bean.Classes;
import com.yaokaiwen.bean.Students;
import com.yaokaiwen.bean.Teachers;

import java.util.List;

/**
 * Created by DELL on 2017/11/24.
 */
public interface StudentsDao extends BaseDao {
    //学生登录查询用户名密码
    public Students selectStudentsByNameandpassword(Students students );
    //查询班级所有信息
    public List<Students> selectStudentsAll();
    //根据sid查询
    public Students selectStudentsBysid(Integer sid);
    //根据条件询查教师信息
    public List<Students> selectStudentsAllBy(Students students,Integer cid);
    //导入添加学生
    public void insertsavestudent(List<Students> studentsList);

}
