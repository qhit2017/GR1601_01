package com.guolonglong.dao.impl;

import com.guolonglong.bean.Classes;
import com.guolonglong.bean.Teachers;
import com.guolonglong.dao.ClassesDao;
import com.guolonglong.dao.base.PublicDaoImpl;
import com.guolonglong.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;;

import java.util.List;

/**
 * Created by lenovo on 2017/11/23.
 */
public class ClassesDaoImpl extends PublicDaoImpl implements ClassesDao {
    @Override
    public List<Classes> selectClassesAll() {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        String hql="select c from Classes c";
        Query query=session.createQuery(hql);

        List<Classes> classesList=query.list();
        HibernateUtil.close(session);
        return classesList;
    }

    @Override
    public List<Classes> selectClassesByBeginOrDirectionOrTeacherlOrTeacherh(String cbegin, String cdirection, Integer tidl, Integer tidh) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        String hql="select c from Classes c where 1=1";
        if (cbegin!=null && !cbegin.equals("")) {
            hql = hql + " and c.cbegin =: cbegin";
        }
        if (cdirection!=null && !cdirection.equals("")) {
            hql= hql + " and c.cdirection =: cdirection";
        }
        if (tidl!=null && !tidl.equals("")) {
            hql= hql + " and c.teacherl.tid =: tidl";
        }
        if (tidh!=null && !tidh.equals("")) {
            hql= hql + " and c.teacherh.tid =: tidh";
        }

        Query query=session.createQuery(hql);

        if (cbegin!=null && !cbegin.equals("")) {
            query.setString("cbegin",cbegin);
        }
        if (cdirection!=null && !cdirection.equals("")) {
            query.setString("cdirection",cdirection);
        }
        if (tidl!=null && !tidl.equals("")) {
            query.setInteger("tidl",tidl);
        }
        if (tidh!=null && !tidh.equals("")) {
            query.setInteger("tidh",tidh);
        }

        List<Classes> classesList=query.list();
        HibernateUtil.close(session);
        return classesList;
    }

    @Override
    public Classes selectClassesById(Integer cid) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Classes classes = (Classes) session.get(Classes.class,cid);

        HibernateUtil.close(session);
        return classes;
    }
}
