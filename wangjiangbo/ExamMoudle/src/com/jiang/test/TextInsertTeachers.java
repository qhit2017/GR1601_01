package com.jiang.test;

import com.jiang.bean.Teachers;
import com.jiang.dao.InsertTeachersDao;
import com.jiang.dao.InsertTeachersDaoImpl;

import java.util.List;

/**
 * Created by dell on 2017/11/26.
 */
public class TextInsertTeachers {
    public static void main(String[] args) {
        InsertTeachersDao insertTeachersDao = new InsertTeachersDaoImpl();
        Teachers teachers = new Teachers();
        teachers.setTname("daei");
        List<Teachers> teachersList = insertTeachersDao.selectTeachersInfo("t1");
        for (Teachers t:teachersList){
            System.out.println(t.getTname());
            System.out.println(t.getTnumber());
        }
    }
}
