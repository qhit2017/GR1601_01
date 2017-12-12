package com.guolonglong.dao.base;

import com.guolonglong.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Created by lenovo on 2017/11/8.
 */
public class PublicDaoImpl implements PublicDao {
    @Override
    public void insert(Object o) {
        Session session= HibernateUtil.getSession();
        if (session==null){
            return;
        }
        Transaction ts=session.beginTransaction();
        session.save(o);
        ts.commit();
        HibernateUtil.close(session);
    }

    @Override
    public void update(Object o) {
        Session session=HibernateUtil.getSession();
        if (session==null){
            return;
        }
        Transaction ts=session.beginTransaction();
        session.update(o);
        ts.commit();
        HibernateUtil.close(session);
    }

    @Override
    public void delete(Object o) {
        Session session=HibernateUtil.getSession();
        if (session==null){
            return;
        }
        Transaction ts=session.beginTransaction();
        session.delete(o);
        ts.commit();
        HibernateUtil.close(session);
    }

    @Override
    public void saveorupdate(Object o) {
        Session session=HibernateUtil.getSession();
        if (session==null){
            return;
        }
        Transaction ts=session.beginTransaction();
        session.saveOrUpdate(o);
        ts.commit();
        HibernateUtil.close(session);
    }
}
