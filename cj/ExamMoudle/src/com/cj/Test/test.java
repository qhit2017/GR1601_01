package com.cj.Test;

import com.cj.Bean.Classes;
import com.cj.Bean.Students;
import com.cj.Bean.Teachers;
import com.cj.Dao.ClassDao;
import com.cj.Dao.Impl.ClassDaoImpl;
import com.cj.Dao.Impl.StudentsDaoImpl;
import com.cj.Dao.Impl.TeachersDaoImpl;
import com.cj.Dao.StudentsDao;
import com.cj.Dao.TeachersDao;
import com.cj.Service.TeachersService;
import com.cj.Service.TeachersServiceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by cj on 2017/11/27.
 */
public class test {
    public static void main(String[] args) {
        StudentsDao studentsDao=new StudentsDaoImpl();
       List<Students> studentsList= studentsDao.selectStudentall();
for (Students s:studentsList){
    System.out.println(s.getSname());
}
    }
}
