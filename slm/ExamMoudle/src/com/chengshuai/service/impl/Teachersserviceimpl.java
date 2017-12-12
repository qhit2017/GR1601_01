package com.chengshuai.service.impl;

import com.chengshuai.bean.Teachers;
import com.chengshuai.dao.Teachersdao;
import com.chengshuai.dao.impl.Teachersimpl;
import com.chengshuai.service.Teachersservice;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by slm on 2017/11/23.
 */
public class Teachersserviceimpl implements Teachersservice {
    private Teachersdao teachersdao = new Teachersimpl();

    @Override
    public List<Teachers> selectByTnameandTpwd(Teachers teachers) {
          /*查询教师表  根据教师姓名 密码 角色 进行查询*/
        return teachersdao.selectByTnameandTpwd(teachers);
    }

    @Override
    public List<Teachers> selectTeachersALL() {
        return teachersdao.selectTeachersALL();
    }

    @Override
    public Teachers selectByid(Teachers teachers) {
        return teachersdao.selectByid(teachers);
    }

    @Override
    public List<Teachers> selectBytnumberOrtnameOrtjob(Teachers teachers) {
        return teachersdao.selectBytnumberOrtnameOrtjob(teachers);
    }

    @Override
    public void saveTeachers(Teachers teachers) {
        teachersdao.saveTeachers(teachers);
    }

    @Override
    public Teachers selectLiketnumber() {

        /*返回结果*/
        String nowTnumber;
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String strdate = sdf.format(date);
        /*查询数据库 */
        List<Teachers> teachersList = teachersdao.selectLiketnumber(strdate + "___");
        if (teachersList == null || teachersList.size() == 0) {
            nowTnumber = strdate + "001";
        } else {
            Integer size = teachersList.size();
            Teachers teachers1 = teachersList.get(size - 1);
            String maxtnumber = teachers1.getTnumber();
            Long l = Long.parseLong(maxtnumber);
            l = l + 1;
            nowTnumber = l.toString();
        }
        Teachers teachers = new Teachers();
        teachers.setTnumber(nowTnumber);
        teachersdao.saveTeachers(teachers);
        List<Teachers> teachersList1 = teachersdao.selectLiketnumber(nowTnumber);
        Teachers teachers1 = teachersList1.get(0);
        return teachers1;

    }

    @Override
    public void updateTeachers(Teachers teachers) {
        teachersdao.updateTeachers(teachers);
    }

    @Override
    public void deleteTeachersByid(Teachers teachers) {
        teachersdao.deleteTeachersByid(teachers);
    }
}
