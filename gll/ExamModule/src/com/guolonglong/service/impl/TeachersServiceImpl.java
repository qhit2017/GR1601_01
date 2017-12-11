package com.guolonglong.service.impl;

import com.guolonglong.bean.Teachers;
import com.guolonglong.dao.TeachersDao;
import com.guolonglong.dao.impl.TeachersDaoImpl;
import com.guolonglong.service.TeachersService;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * Created by lenovo on 2017/11/26.
 */
public class TeachersServiceImpl implements TeachersService {
    private TeachersDao teachersDao = new TeachersDaoImpl();
    @Override
    public List<Teachers> selectTeachersAll() {
        return teachersDao.selectTeachersAll();
    }

    @Override
    public List<Teachers> selectTeacherBynumberOrnameOrjob(String tnumber, String tname, Integer tjob) {
        return teachersDao.selectTeacherBynumberOrnameOrjob(tnumber, tname, tjob);
    }

    @Override
    public Teachers queryTnumber(Teachers teachers) {
        //获取时间
        Date date = new Date();
        //new SimpleDateFormat 转换成yyyyMMdd
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String strDate = sdf.format(date);
        String nowNumber="";
        List<Teachers> teachersList = teachersDao.selectTeacherLikeBynumber(strDate+"___");
        if (teachersList==null || teachersList.size()==0){
            nowNumber = strDate + "001";
        }
        else {
            Integer size = teachersList.size();
            teachers = teachersList.get(size-1);
            Long number = Long.parseLong(teachers.getTnumber());
            number = number+1;
            nowNumber = number.toString();

        }
        teachers.setTnumber(nowNumber);
        teachersDao.insert(teachers);
        return teachers;
    }


    @Override
    public Teachers insertTeachersInfo(Teachers teachers) {
        teachersDao.update(teachers);
        return teachers;

    }

    @Override
    public List<Teachers> selectTeachersByNumber(String tnumber) {
        List<Teachers> teachersList = teachersDao.selectTeachersByNumber(tnumber);
        if (teachersList.size()==0 || teachersList==null){
            return null;
        }
        return teachersList;
    }

    @Override
    public Teachers selectTeachersById(Integer tid) {
        return teachersDao.selectTeachersById(tid);
    }

    @Override
    public Teachers updateTeachersInfo(Teachers teachers) {
        teachersDao.update(teachers);
        return teachers;
    }

    @Override
    public Teachers updateTeachersPwd(Teachers teachers) {
        if (teachers.getTpassword()!="1234"){
            teachers.setTpassword("1234");
            teachersDao.update(teachers);
        }
        else {
            return null;
        }
        return teachers;
    }

    @Override
    public boolean deleteTeachersInfo(Teachers teachers) {
        teachersDao.delete(teachers);
        return true;
    }
}
