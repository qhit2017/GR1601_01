package com.guolonglong.service;

import com.guolonglong.bean.Students;
import com.guolonglong.bean.Teachers;

import java.util.List;

/**
 * Created by lenovo on 2017/12/1.
 */
public interface StudentsService {
    //查询学生所有信息
    public List<Students> selectStudentsAll();
    //添加学生信息
    public Students insertStudentInfo(Students students);
    //通过ID查询学生数据
    public Students selectStudentById(Integer sid);
    //通过 学号 + 名字 + 班级 +  入学年份 + 就读方向 查询学生信息
    public List<Students> selectStudentsByNumberOrNameOrCnameOrCdirection(String snumber,String sname,String cname,String cbegin,String cdirectiont);
    //重置密码
    public Students updatepwd(Students students);

    //删除
    public Students deleteStudent(Students students);

    //学生的数据导出
    public String studentsExport(String path);

    //学生的数据导入
    public String studentsImport(String path);

}
