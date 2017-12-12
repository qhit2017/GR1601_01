package com.wangdoudou.service;

import com.wangdoudou.bean.Students;
import com.wangdoudou.dao.StudentsDao;
import com.wangdoudou.dao.StudentsDaoImpl;

import java.util.List;

/**
 * Created by 王豆豆 on 2017/12/3.
 */
public class StudentsServiceImpl implements StudentsService {
    private StudentsDao dao=new StudentsDaoImpl();
    @Override
    public List<Students> selectAllStudentsinfo() {
       List<Students>studentsList=dao.selectAllStudentsinfo();
       return studentsList;
    }
    //根据id查询信息
    @Override
    public Students selectById(Students students) {
     return dao.selectById(students);
    }
    //条件查询
    @Override
    public List<Students> selectStudentsBysnumberAndsname(String snumber, String sname) {
        List<Students>studentsList=dao.selectStudentsBysnumberAndsname(snumber,sname);
        return studentsList;
    }
    //根据学号查询
    @Override
    public List<Students> selectStudentBysnumber(String snumber) {
        List<Students>studentsList=dao.selectStudentBysnumber(snumber);
        return studentsList;
    }
   //添加或修改学生信息
    @Override
    public void saveOrupdateStudentinfo(Students students) {
          dao.saveOrupdateStudentinfo(students);
    }
   //删除
    @Override
    public void deleteStudentsinfo(Students students) {
        dao.deleteStudentsinfo(students);
    }
}
