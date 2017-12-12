package com.chengshuai.service;

import com.chengshuai.bean.Students;
import com.chengshuai.bean.Teachers;
import com.chengshuai.dao.TeachersDao;
import com.chengshuai.dao.TeachersDaoImpl;

import java.util.List;

/**
 * Created by Administrator on 2017/11/24.
 */
public class LoginServiceImpl implements  LoginService {
    @Override
    public List<Teachers> loginTeacher(String name, String pwd) {
        TeachersDao teachersDao = new TeachersDaoImpl();
         return   teachersDao.selectTeacherByNameAndPwd(name,pwd);
    }

    @Override
    public List<Students> loginStudent(String name, String pwd) {

        return null;
    }
}
