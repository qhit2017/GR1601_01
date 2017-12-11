package com.wangdoudou.dao;

import com.wangdoudou.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Created by 王豆豆 on 2017/11/8.
 */
public class BaceDaoImpl implements BaceDao{
    @Override
    public void insert(Object o) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return ;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        session.save(o);
        tx.commit();
        HibernateUtil.close(session);
    }

    @Override
    public void update(Object o) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return ;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        session.update(o);
        tx.commit();
        HibernateUtil.close(session);
    }

    @Override
    public void delete(Object o) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return ;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        session.delete(o);
        tx.commit();
        HibernateUtil.close(session);
    }
}
