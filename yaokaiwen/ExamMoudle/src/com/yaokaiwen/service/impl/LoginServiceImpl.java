package com.yaokaiwen.service.impl;

import com.yaokaiwen.bean.Students;
import com.yaokaiwen.bean.Teachers;
import com.yaokaiwen.dao.StudentsDao;
import com.yaokaiwen.dao.TeachersDao;
import com.yaokaiwen.dao.impl.StudentDaoImpl;
import com.yaokaiwen.dao.impl.TeachersDaoImpl;
import com.yaokaiwen.service.LoginService;

import java.util.List;


/**
 * Created by DELL on 2017/11/24.
 */
public class LoginServiceImpl implements LoginService {
     TeachersDao teachersDao = new TeachersDaoImpl();
     StudentsDao studentsDao = new StudentDaoImpl();
    @Override
    public Boolean selectTeachersByNameandpasswordService(Teachers teachers) {
        teachers = teachersDao.selectTeachersByNameandpassword(teachers);
        if(teachers==null){
            return false;
        }else {
            return true;
        }
    }

    @Override
    public Boolean selectStudentsByNameandpasswordService(Students students) {
        students = studentsDao.selectStudentsByNameandpassword(students);
        if (students == null) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public List<Teachers> selectTeachersAllService() {
        List<Teachers> list = teachersDao.selectTeachersAll();
        if(list==null||list.size()<=0){
            return null;
        }else {
            return list;
        }
    }
}
