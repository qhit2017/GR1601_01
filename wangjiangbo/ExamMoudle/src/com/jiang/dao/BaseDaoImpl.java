package com.jiang.dao;

import com.jiang.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Created by dell on 2017/11/9.
 */
public class BaseDaoImpl implements BaseDao {
    @Override
    /*增*/
    public void insert(Object o) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return;
        }
        Transaction ts = session.beginTransaction();
        session.save(o);
        ts.commit();
        HibernateUtil.close(session);
    }

    @Override
    /*改*/
    public void update(Object o) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return;
        }
        Transaction ts = session.beginTransaction();
        session.update(o);
        ts.commit();
        HibernateUtil.close(session);
    }

    @Override
    /*删*/
    public void delect(Object o) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return;
        }
        Transaction ts = session.beginTransaction();
        session.delete(o);
        ts.commit();
        HibernateUtil.close(session);
    }
}
