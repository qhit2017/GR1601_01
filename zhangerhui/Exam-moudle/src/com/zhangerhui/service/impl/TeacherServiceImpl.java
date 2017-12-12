package com.zhangerhui.service.impl;

import com.zhangerhui.bean.Teachers;
import com.zhangerhui.dao.TeacherDao;
import com.zhangerhui.dao.impl.TeacherDaoImpl;
import com.zhangerhui.service.TeacherService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/11/23/023.
 */
public class TeacherServiceImpl implements TeacherService {
    private TeacherDao dao = new TeacherDaoImpl();

    @Override
    public List<Teachers> selectTeachersBytnameAndtpassword(String tname, String tpassword) {
        return dao.queryTeachersBytnameandtpassword(tname, tpassword);
    }

    @Override
    public List<Teachers> selectTeachersallinfo() {
        return dao.queryTeachersallinfo();
    }

    @Override
    public boolean insertTeachers() {
        return false;
    }

    @Override
    public List<Teachers> selectThreeTeacher(String tnumber, String tname, Integer tjob) {
        return dao.queryThreeTeachers(tnumber, tname, tjob);
    }


    @Override
    public void updateTeachersInfo(Teachers teachers) {
        dao.upadte(teachers);
        return;
    }

    @Override
    public void deleteTeachersInfo(Teachers teachers) {
        dao.delete(teachers);
        return;
    }

    @Override
    public Teachers selectTeacherTnumber() {

        //当前日期
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        String strdate = simpleDateFormat.format(date);
        //根据当前日期 查询新的账号 yyyyMMdd
        String nowTnumber = "";
        List<Teachers> teachers = dao.queryTeachersLikeTnumber(strdate + "___");
        if ((teachers == null) || teachers.size() == 0) {
            nowTnumber = strdate + "001";
        } else {
            Integer size = teachers.size();
            Teachers teachers1 = teachers.get(size - 1);
            String maxnumber = teachers1.getTnumber();
            Long lnumber = Long.parseLong(maxnumber);
            lnumber = lnumber + 1;
            nowTnumber = lnumber.toString();
        }
        //把新查询的账号---》保存到teacher
        Teachers teachers1 = new Teachers();
        teachers1.setTnumber(nowTnumber);

        dao.insert(teachers1);

        return teachers1;
    }

    @Override
    public List<Teachers>selectTeacherByTnumber(String tnumber) {
        List<Teachers> teachersList = dao.queryTeachersByTnumber(tnumber);
        return teachersList;
    }

    @Override
    public Teachers selectTeacherByTid(Integer tid) {
        return dao.queryTeachersByTid(tid);
    }
}
