package com.zhangerhui.test;

import com.zhangerhui.bean.Teachers;
import com.zhangerhui.service.TeacherService;
import com.zhangerhui.service.impl.TeacherServiceImpl;

public class Test{


    private static Teachers teachers = new Teachers();

/*
    public void login(){

        Integer id = teachers.getTid();
        TeacherService service = new TeacherServiceImpl();
        teachers =service.selectTeacherByTid(id);
        System.out.println("Tid为"+teachers.getTid());


    }*/

    public static void main(String[] args) {

        Integer id = teachers.getTid();
        TeacherService service = new TeacherServiceImpl();
        teachers =service.selectTeacherByTid(1);
        System.out.println("Tid为"+teachers.getTnumber());



    }

    public Teachers getTeachers() {
        return teachers;
    }

    public void setTeachers(Teachers teachers) {
        this.teachers = teachers;
    }
}