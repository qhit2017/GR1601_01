package com.guolonglong.dao;

import com.guolonglong.bean.Students;
import com.guolonglong.bean.Teachers;
import com.guolonglong.dao.base.PublicDao;

import java.util.List;

/**
 * Created by lenovo on 2017/11/23.
 */
public interface StudentsDao extends PublicDao{
    //学生登录
    public List<Students> selectStudents(Students students);
    //查询学生所有信息
    public List<Students> selectStudentsAll();
    //通过 学号 + 名字 + 班级 +  入学年份 + 就读方向 查询学生信息
    public List<Students> selectStudentsByNumberOrNameOrCnameOrCdirection(String snumber,String sname,String cname,String cbegin,String cdirectiont);
    //通过ID查询学生数据
    public Students selectStudentById(Integer sid);

    //
    public void studentsImprot(List<Students> studentsList);

}
