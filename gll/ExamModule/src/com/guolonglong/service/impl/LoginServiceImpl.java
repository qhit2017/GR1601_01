package com.guolonglong.service.impl;

import com.guolonglong.bean.Students;
import com.guolonglong.bean.Teachers;
import com.guolonglong.dao.StudentsDao;
import com.guolonglong.dao.TeachersDao;
import com.guolonglong.dao.impl.StudentsDaoImpl;
import com.guolonglong.dao.impl.TeachersDaoImpl;
import com.guolonglong.service.LoginService;

import java.util.List;

/**
 * Created by lenovo on 2017/11/23.
 */
public class LoginServiceImpl implements LoginService {
    private TeachersDao teachersDao = new TeachersDaoImpl();
    private StudentsDao studentsDao = new StudentsDaoImpl();
    @Override
    public List<Teachers> selectTeachers(String name,String password) {

        return teachersDao.selectTeachers(name,password);
    }

    @Override
    public List<Students> selectStudents(Students students) {

        return studentsDao.selectStudents(students);

    }
}
