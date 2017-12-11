package com.cj.Service;

import com.cj.Bean.Classes;
import com.cj.Dao.ClassDao;
import com.cj.Dao.Impl.ClassDaoImpl;

import java.util.Date;
import java.util.List;

/**
 * Created by cj on 2017/12/4.
 */
public class ClassServiceImpl implements ClassService{
    private ClassDao classDao=new ClassDaoImpl();
    /*查询所有显示班级*/
    @Override
    public List<Classes> selectClassAll() {

       return classDao.selectClassAll();
    }
/*根据四个条件*/
    @Override
    public List<Classes> sleectMycbeginOrcdirectionOrtidlOrtidh(Date cbegin, String cdirection, Integer tidl, Integer tidh) {
        return classDao.sleectMycbeginOrcdirectionOrtidlOrtidh(cbegin,cdirection,tidl,tidh);
    }
/*增加班级*/
    @Override
    public boolean inseertClassall(Classes classes) {
        return classDao.inseertClassall(classes);
    }
}
