package com.yushaoju.service.impl;

import com.yushaoju.bean.Students;
import com.yushaoju.bean.Teachers;
import com.yushaoju.dao.TeachersDao;
import com.yushaoju.dao.impl.TeachersDaoImpl;
import com.yushaoju.service.TeachersService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Svip on 2017/11/23.
 */
public class TeachersServiceImpl  implements TeachersService{
    @Override
    public List<Teachers> insertLand(String tname, String tpassword) {
        TeachersDao  teachersDao=new TeachersDaoImpl();
        List<Teachers>teachersList=teachersDao.insertLand(tname,tpassword);
        return teachersList;
    }

    @Override
    public List<Students> insertselectLand(String sname, String spassword) {
        TeachersDao teachersDao=new TeachersDaoImpl();
        List<Students> studentsList=teachersDao.insertselectLand(sname,spassword);
        return studentsList;
    }

    @Override
    public List<Teachers> queryTeacher() {
        TeachersDao teachersDao=new TeachersDaoImpl();
        return  teachersDao.selectAllTeacher();

    }

    @Override
    public List<Teachers> selectTeacherByTnumberOrTnameOrjob(String number, String name, Integer job) {
        TeachersDao teachersDao=new TeachersDaoImpl();
        return   teachersDao.selectTeacherByTnumberOrTnameOrjob(number,name,job);
    }

    @Override
    public List<Teachers> increaseTeachers(Teachers teachers) {
        TeachersDao teachersDao=new TeachersDaoImpl();
        return  teachersDao.increaseTeachers(teachers);
    }
}
