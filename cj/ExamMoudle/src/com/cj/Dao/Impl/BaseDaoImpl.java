package com.cj.Dao.Impl;

import com.cj.Dao.BaseDao;
import com.cj.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Created by cj on 2017/11/8.
 */
public class BaseDaoImpl implements BaseDao {
    //增
    @Override
    public void insert(Object o) {
        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return;
        }
        Transaction tx = session.beginTransaction();
        session.save(o);
        tx.commit();
        HibernateUtil.close(session);
        return;
    }

    //删
    @Override
    public void update(Object o) {
        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return;
        }
        Transaction tx = session.beginTransaction();
        session.update(o);
        tx.commit();
        HibernateUtil.close(session);
        return;
    }

    //改
    @Override
    public void delete(Object o) {
        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return;
        }
        Transaction tx = session.beginTransaction();
        session.delete(o);
        tx.commit();
        HibernateUtil.close(session);
        return;
    }
}
