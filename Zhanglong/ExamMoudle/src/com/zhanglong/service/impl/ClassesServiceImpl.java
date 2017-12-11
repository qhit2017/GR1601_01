package com.zhanglong.service.impl;

import com.zhanglong.bean.Classes;
import com.zhanglong.bean.Teachers;
import com.zhanglong.dao.ClassesDao;

import com.zhanglong.dao.impl.ClassesDaoImpl;
import com.zhanglong.service.ClassesService;

import java.util.List;

/**
 * Created by Administrator on 2017/11/29 0029.
 */
public class ClassesServiceImpl implements ClassesService {
    private ClassesDao dao=new ClassesDaoImpl();
    @Override
    public List<Classes> selectAllClassInfo() {
        return dao.selectAllClassInfo();
    }

    @Override
    public List<Teachers> selectTeacherBytjobjiangshi(Integer tjob) {
       return dao.selectTeacherBytjobjiangshi(0);
    }

    @Override
    public List<Teachers> selectTeacherBytjobbanzhuren(Integer tjob) {
        return dao.selectTeacherBytjobbanzhuren(1);
    }

    @Override
    public List<Classes> selectChaxun(String cbegin, String cdirection, String tidl, String tidh) {
        return dao.selectChaxun(cbegin,cdirection,tidl,tidh);
    }

    @Override
    public void saveOrUpdateClasses(Classes classes) {
        dao.saveOrUpdateClasses(classes);
        return;
    }

    @Override
    public Classes selectClassById(Integer cid) {
        return dao.selectClassById(cid);
    }


}

