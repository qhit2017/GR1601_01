package com.yaokaiwen.service.impl;

import com.yaokaiwen.bean.Teachers;
import com.yaokaiwen.dao.TeachersDao;
import com.yaokaiwen.dao.impl.TeachersDaoImpl;
import com.yaokaiwen.service.TeachersService;

import java.util.List;

/**
 * Created by DELL on 2017/11/26.
 */
public class TeachersServiceImpl implements TeachersService {
    TeachersDao teachersDao = new TeachersDaoImpl();
    @Override
    public List<Teachers> selectTeachersAllBy(Teachers teachers) {
        List<Teachers> list = teachersDao.selectTeachersAllBy(teachers);
        if(list==null||list.size()<=0){
            return null;
        }else {
            return list;
        }
    }

    @Override
    public String selectTeachersByDate(String date) {
        String stnd =  teachersDao.selectTeachersByDate(date);
        if(stnd==null){
            return null;
        }else {
            return stnd;
        }
    }
    @Override
    public void insertOrUpdateTeachers(Teachers teachers) {
        teachersDao.insertOrUpdate(teachers);
        return ;
    }

    @Override
    public Teachers selectTeachersByTnumberService(String tnumber) {
        Teachers teachers = teachersDao.selectTeachersByTnumber(tnumber);
        if(teachers==null){
            return null;
        }else {
            return teachers;
        }

    }

    @Override
    public Teachers selectTeachersByTidService(Integer tid) {
        Teachers teachers = teachersDao.selectTeachersByTid(tid);
        if(teachers==null){
            return null;
        }else {
            return teachers;
        }
    }

    @Override
    public void daleteteachersService(Teachers teachers) {
        teachersDao.delete(teachers);
        return;
    }
}
