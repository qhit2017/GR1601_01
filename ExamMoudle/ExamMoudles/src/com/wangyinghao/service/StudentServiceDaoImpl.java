package com.wangyinghao.service;

import com.wangyinghao.bean.Students;
import com.wangyinghao.dao.StudentDao;
import com.wangyinghao.dao.impl.StudentDaoImpl;

/**
 * Created by 王英豪 on 2017/12/7.
 */
public class StudentServiceDaoImpl implements StudentServiceDao {

    private StudentDao studentDao = new StudentDaoImpl();
    @Override
    public Students selectstudents(Students students) {
        return studentDao.selectstudents(students);
    }
}
