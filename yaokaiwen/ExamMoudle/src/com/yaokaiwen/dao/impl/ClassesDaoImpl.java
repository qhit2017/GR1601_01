package com.yaokaiwen.dao.impl;

import com.yaokaiwen.bean.Classes;
import com.yaokaiwen.bean.Teachers;
import com.yaokaiwen.dao.ClassesDao;
import com.yaokaiwen.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by DELL on 2017/11/29.
 */
public class ClassesDaoImpl extends BaseDaoImpl implements ClassesDao {
    @Override
    public List<Classes> selectClassesAll() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql ="select c from Classes c";
        //2、创建query对象
        Query query= session.createQuery(hql);
        //3、执行hql，返回list
        List<Classes> list = query.list();
        HibernateUtil.close(session);
        return list;
    }

    @Override
    public List<Classes> selectClassesAllBy(Classes classes,Integer tidl,Integer tidh) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql = "select c from Classes c WHERE 1=1 ";
        if(classes.getCbegin()!=null && !"".equals(classes.getCbegin())){
            hql= hql    +" and c.cbegin=:cbegin";
        }
        if(classes.getCdirection()!=null && !"".equals(classes.getCdirection())){
            hql= hql   +" and c.cdirection=:cdirection";
        }if(tidl!=null && !"".equals(tidl)){
            hql= hql   +" and c.tidl=:tidl";
        }
        if(tidh!=null && !"".equals(tidh)){
            hql= hql   +" and c.tidh=:tidh";
        }

        Query query= session.createQuery(hql);
        if(classes.getCbegin()!=null && !"".equals(classes.getCbegin())){
            query.setString("cbegin",classes.getCbegin());
        }
        if(classes.getCdirection()!=null && !"".equals(classes.getCdirection())){
            query.setString("cdirection",classes.getCdirection());
        }
       if(tidl!=null && !"".equals(tidl)){
            query.setInteger("tidl",tidl);
        }
        if(tidh!=null && !"".equals(tidh)){
            query.setInteger("tidh",tidh);
        }
        List<Classes> list = query.list();
        HibernateUtil.close(session);
        return list;
    }

    @Override
    public Classes selectClassesByCid(Integer cid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Classes classes = (Classes) session.get(Classes.class,cid);
        HibernateUtil.close(session);
        return classes;
    }

    @Override
    public List<Teachers> selecttidltname() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql ="select t from Teachers t where t.tjob=:tjob";
        //2、创建query对象
        Query query= session.createQuery(hql);
        query.setInteger("tjob",0);
        //3、执行hql，返回list
        List<Teachers> list = query.list();
        HibernateUtil.close(session);
        return list;
    }

    @Override
    public List<Teachers> selecttidhtname() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql ="select t from Teachers t where t.tjob = :tjob";
        //2、创建query对象
        Query query= session.createQuery(hql);
        query.setInteger("tjob",1);
        //3、执行hql，返回list
        List<Teachers> list = query.list();
        HibernateUtil.close(session);
        return list;
    }

    @Override
    public List<Classes> selectdistinctcbegin() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql ="SELECT DISTINCT(c.cbegin)FROM Classes c ";
        //2、创建query对象
        Query query= session.createQuery(hql);
        //3、执行hql，返回list
        List<Classes> list = query.list();
        HibernateUtil.close(session);
        return list;
    }

    @Override
    public Classes selectclassesbyname(String cname) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql ="SELECT c FROM Classes c where c.cname=:cname ";
        //2、创建query对象
        Query query= session.createQuery(hql);
        query.setString("cname",cname);
        //3、执行hql，返回list
        Classes classes = (Classes) query.uniqueResult();
        HibernateUtil.close(session);
        return classes;
    }
}
