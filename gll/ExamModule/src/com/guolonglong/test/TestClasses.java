package com.guolonglong.test;

import com.guolonglong.bean.Classes;
import com.guolonglong.bean.Teachers;
import com.guolonglong.service.ClassesService;
import com.guolonglong.service.impl.ClassesServiceImpl;

import java.util.List;

/**
 * Created by lenovo on 2017/12/1.
 */
public class TestClasses {
    public static void main(String[] args) {
        ClassesService service = new ClassesServiceImpl();
        Classes classes = new Classes();
        classes.setCnumber("2222");
        Teachers teachers = new Teachers();
        teachers.setTid(2);
        classes.setTeachersl(teachers);
       service.insertOrupdateClassesInfo(classes);
    }
}
