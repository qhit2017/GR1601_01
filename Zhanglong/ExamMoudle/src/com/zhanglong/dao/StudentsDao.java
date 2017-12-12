package com.zhanglong.dao;

import com.zhanglong.bean.Students;

import java.util.List;

/**
 * Created by Administrator on 2017/12/2 0002.
 */
public interface StudentsDao extends BaseDao {
    //查询所有学生信息
    public List<Students> selectAllInfo();
    //5个条件进行查询
    public List<Students>selectchaxunfive(String snumber,String sname,String cid,String senter,String smahor);
    //添加信息
    public void SaveoruodateStudent(Students students);
    //根据ID进行查询
    public Students selectStudentsBysid(Integer sid);
    //删除信息
    public void deleteStudent(Students students);
    //导入学生信息
    public void daoruxuesheng(List<Students>studentsList);
}
