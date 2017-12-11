package com.cj.Dao.Impl;

import com.cj.Bean.Classes;
import com.cj.Bean.Teachers;
import com.cj.Dao.ClassDao;
import com.cj.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Date;
import java.util.List;

/**
 * Created by cj on 2017/12/4.
 */
public class ClassDaoImpl implements ClassDao {
    /*查询所有*/
    @Override
    public List<Classes> selectClassAll() {
        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //拼写HOLException
        String hql = "select c from Classes  c";

        //执行HQL
        Query query = session.createQuery(hql);

        List<Classes> classesList = query.list();

        HibernateUtil.close(session);
        return classesList;
    }

    /*条件查询*/
    @Override
    public List<Classes> sleectMycbeginOrcdirectionOrtidlOrtidh(Date cbegin, String cdirection, Integer tidl, Integer tidh) {
        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;

        }

        //拼写HQL
        String hql = "select c from Classes c where 1=1";

        if (cbegin != null && !cbegin.equals("")) {
            hql = hql + " and c.cbegin=:cbegin";
        }

        if (cdirection != null && !cdirection.equals("")) {
            hql = hql + " and c.cdirection=:cdirection";
        }
        if (tidl != null && !tidl.equals("")) {
            hql = hql + " and c.tidl =:tidl";
        }

        if (tidh != null && !tidh.equals("")) {
            hql = hql + " and c.tidh =:tidh";
        }


        //执行query
        Query query = session.createQuery(hql);
        if (cbegin != null && !cbegin.equals("")) {
            query.setDate("cbegin", cbegin);
        }

        if (cdirection != null && !cdirection.equals("")) {
            query.setString("cdirection", cdirection);
        }
        if (tidl != null && !tidl.equals("")) {
            query.setInteger("tidl", tidl);
        }

        if (tidh != null && !tidh.equals("")) {
            query.setInteger("tidh", tidh);
        }

        List<Classes> list = query.list();
        HibernateUtil.close(session);
        return list;
    }

    /*增加班级*/
    @Override
    public boolean inseertClassall(Classes classes) {
        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return false;
        }
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(classes);
        tx.commit();
        HibernateUtil.close(session);
        return true;
    }
}
