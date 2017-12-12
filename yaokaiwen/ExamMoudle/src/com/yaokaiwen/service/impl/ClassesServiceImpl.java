package com.yaokaiwen.service.impl;

import com.yaokaiwen.bean.Classes;
import com.yaokaiwen.bean.Teachers;
import com.yaokaiwen.dao.ClassesDao;
import com.yaokaiwen.dao.impl.ClassesDaoImpl;
import com.yaokaiwen.service.ClassesService;

import java.util.List;

/**
 * Created by DELL on 2017/11/29.
 */
public class ClassesServiceImpl implements ClassesService {
    ClassesDao classesDao = new ClassesDaoImpl();
    @Override
    public List<Classes> selectClassesAllService() {
        List<Classes> list = classesDao.selectClassesAll();
        if(list==null||list.size()<=0){
            return null;
        }else {
            return list;
        }
    }
    @Override
    public List<Classes> selectClassesAllByService(Classes classes, Integer tidl, Integer tidh) {
        List<Classes> list = classesDao.selectClassesAllBy(classes,tidl,tidh);
        if(list.size()<=0||list==null){
            return null;
        }else {
            return list;
        }
    }
    @Override
    public Classes selectClassesByCidService(Integer cid) {
        Classes classes = classesDao.selectClassesByCid(cid);
        if(classes==null){
            return null;
        }else {
            return classes;
        }
    }

    @Override
    public List<Teachers> selecttidltname() {
        List<Teachers> list = classesDao.selecttidltname();
        if(list==null||list.size()<=0){
            return null;
        }else {
            return list;
        }
    }

    @Override
    public List<Teachers> selecttidhtname() {
        List<Teachers> list = classesDao.selecttidhtname();
        if(list==null||list.size()<=0){
            return null;
        }else {
            return list;
        }

    }

    @Override
    public List<Classes> selectdistinctcbeginService() {
        List<Classes> list = classesDao.selectdistinctcbegin();
        if(list==null||list.size()<=0){
            return null;
        }else {
            return list;
        }
    }

    @Override
    public void insertorupdateService(Classes classes) {
        classesDao.insertOrUpdate(classes);
        return;
    }
}
