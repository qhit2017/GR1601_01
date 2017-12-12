package com.jiang.service;

import com.jiang.bean.Teachers;
import com.jiang.dao.TeachersDao;
import com.jiang.dao.TeachersDaoImpl;

import java.util.List;

/**
 * Created by dell on 2017/11/23.
 */
public class TeachersServiceImpl implements TeachersService {
    @Override
    public List<Teachers> selectTeachersInfoByTnameAndTpassword(String tname, String tpassword) {
        TeachersDao dao = new TeachersDaoImpl();
        return dao.selectTeachersInfoByTnameAndTpassword(tname, tpassword);
    }
}
