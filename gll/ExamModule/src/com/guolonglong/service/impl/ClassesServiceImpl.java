package com.guolonglong.service.impl;

import com.guolonglong.bean.Classes;
import com.guolonglong.bean.Students;
import com.guolonglong.bean.Teachers;
import com.guolonglong.dao.ClassesDao;
import com.guolonglong.dao.StudentsDao;
import com.guolonglong.dao.impl.ClassesDaoImpl;
import com.guolonglong.dao.impl.StudentsDaoImpl;
import com.guolonglong.service.ClassesService;
import com.guolonglong.service.StudentsService;

import java.util.List;

/**
 * Created by lenovo on 2017/12/1.
 */
public class ClassesServiceImpl implements ClassesService {
    ClassesDao classesDao = new ClassesDaoImpl();
    @Override
    public List<Classes> selectClassesAll() {

        return classesDao.selectClassesAll();
    }

    @Override
    public List<Classes> selectClassesByBeginOrDirectionOrTeacherlOrTeacherh(String cbegin, String cdirection, Integer tidl, Integer tidh) {
        return classesDao.selectClassesByBeginOrDirectionOrTeacherlOrTeacherh(cbegin,cdirection,tidl,tidh);
    }

    @Override
    public Classes selectClassesById(Integer cid) {
        return classesDao.selectClassesById(cid);
    }

    @Override
    public Classes insertOrupdateClassesInfo(Classes classes) {
        classesDao.saveorupdate(classes);
        return classes;
    }
}
