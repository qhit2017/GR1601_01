package com.jinmengjie.service.impl;

import com.jinmengjie.bean.Classes;
import com.jinmengjie.bean.Teachers;
import com.jinmengjie.dao.ClassesDao;
import com.jinmengjie.dao.impl.ClassesDaoImpl;
import com.jinmengjie.service.ClassesService;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/11/29/029.
 */
public class ClassesServiceImpl implements ClassesService {
    private ClassesDao classesDao = new ClassesDaoImpl();

    //查询班级的所有信息
    @Override
    public List<Classes> selectAllClassInfo() {

        List<Classes> classesList = classesDao.selectAllClassInfo();

        if (classesList.size() <= 0 || classesList == null) {
            return null;
        } else {
            return classesList;
        }

    }

    @Override
    public List<Teachers> selectTeacherTjobByTjob0() {
        return classesDao.selectTeacherTjobByTjob0(0);
    }

    @Override
    public List<Teachers> selectTeacherTjobByTjob1() {
        return classesDao.selectTeacherTjobByTjob1(1);
    }

    @Override
    public List<Classes> sleectbeginclassBycbegin() {

        return classesDao.sleectbeginclassBycbegin();
    }

    @Override
    public List<Classes> selectClassesInfoBycebginOrcdirectionOrtidlortidh(String cbegin, String cdirection, Integer tidl, Integer tidh) {
        List<Classes> classesList= classesDao.selectClassesInfoBycebginOrcdirectionOrtidlortidh(cbegin,cdirection,tidl,tidh);
        if (classesList.size()<= 0 || classesList == null) {
            return null;
        } else {
            return classesList;
        }

    }

    @Override
    public Classes selectclassesinfoBycid(Integer cid) {
      return   classesDao.selectclassesinfoBycid(cid);
    }

    @Override
    public Classes selectClassescnameByCid(String cname) {
        return classesDao.selectClassescnameByCid(cname);
    }

    @Override
    public void insertOrUpdateClassesInfo(Classes classes) {

        classesDao.insertOrUpdateClassesInfo(classes);
    }
}
