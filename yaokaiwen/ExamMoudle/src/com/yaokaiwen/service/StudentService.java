package com.yaokaiwen.service;

import com.yaokaiwen.bean.Classes;
import com.yaokaiwen.bean.Students;
import com.yaokaiwen.bean.Teachers;

import java.util.List;

/**
 * Created by DELL on 2017/11/30.
 */
public interface StudentService {
    //查询学生所有信息
    public List<Students> selectStudentsAllService();
    //根据sid查询
    public Students selectStudentsBysidService(Integer sid);
    //根据条件询查教师信息
    public List<Students> selectStudentAllByService(Students students,Integer cid);
    //添加修改
    public void insertOrUpdateStudents(Students students);
    //删除
    public void daleteStudentsService(Students students);
    //查询班级
    public List<Classes> selectclassesService();
    //导出所有学生信息
    public String filedownstudentService(String path);
    //导入学生信息
    public void fileupinsertstudentService(String filepath);
}
