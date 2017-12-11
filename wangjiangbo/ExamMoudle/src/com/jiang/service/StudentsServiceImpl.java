package com.jiang.service;

import com.jiang.bean.Students;
import com.jiang.dao.BaseDaoImpl;
import com.jiang.dao.StudentsDao;
import com.jiang.dao.StudentsDaoImpl;

import java.util.List;

/**
 * Created by dell on 2017/11/23.
 */
public class StudentsServiceImpl implements StudentsService {
    @Override
    /*studens连接服务*/
    public List<Students> selectStudentsInfoBySnameAndSpassword(String sname, String spassword) {
        StudentsDao studentsDao = new StudentsDaoImpl();
         return studentsDao.selectStudentsInfoBySnameAndSpassword(sname,spassword);

    }


}
