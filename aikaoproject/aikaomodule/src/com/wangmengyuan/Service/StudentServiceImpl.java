package com.wangmengyuan.Service;

import com.wangmengyuan.Dao.StudentDao;
import com.wangmengyuan.Dao.StudentDaoImpl;
import com.wangmengyuan.bean.Students;

import java.util.List;

/**
 * Created by Administrator on 2017/12/7.
 */
public class StudentServiceImpl implements StudentService {
    private StudentDao studentDao = new StudentDaoImpl();
    @Override
    public List<Students> selectAllStudentsinfo() {
        List<Students>studentsList=studentDao.selectAllStudentsinfo();
        return studentsList;
    }

    @Override
    public List<Students> querystnumber(String snumber, String sname) {
       List<Students> studentsList = studentDao.selectsnumber(snumber, sname);
        return studentsList;
    }
}
