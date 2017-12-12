package com.cj.Service;

import com.cj.Bean.Students;
import com.cj.Dao.Impl.StudentsDaoImpl;
import com.cj.Dao.StudentsDao;

import java.util.List;

/**
 * Created by cj on 2017/11/23.
 */
public class StudentsSerciceImpl implements  StudentsService {

    StudentsDao studentsDao=new StudentsDaoImpl();
    @Override
    public List<Students>  selectStudents(String sname, String spassword) {

        return  studentsDao.selectStudent(sname,spassword);

    }

    @Override
    public List<Students> selectStudentall() {
        return  studentsDao.selectStudentall();
    }
}
