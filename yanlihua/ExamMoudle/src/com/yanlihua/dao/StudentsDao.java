package com.yanlihua.dao;

import com.yanlihua.bean.Students;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/29.
 */
public interface StudentsDao {
    //查询学生的所有信息
    public List<Students> selectStudentAllInfoStudentsDao();

    //五个条件进行条件查询
    public List<Students> selectStudentInfoFiveConditionStudentDao(String snumber,String sname,String cid,String senter,String smahor);

    //保存或和修改对象中的信息
    public void  saveOrUpdateStudentInfoStudentsDao(Students students);

    //根据sid修改信息
    public Students selectStudentInfoBySidStudentsDao(Integer sid);

    //删除学生对象
    public void deleteStudentObjectStudentDao(Students students);

    //导入学生信息
    public void importStudentInfoStudentDao(List<Students> studentsList);

    //根据班级查学生
    public List<Students> selectStudentByCid(Integer cid);

}
