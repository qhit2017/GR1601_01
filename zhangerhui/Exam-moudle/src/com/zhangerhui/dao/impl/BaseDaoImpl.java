package com.zhangerhui.dao.impl;

import com.zhangerhui.dao.BaseDao;
import com.zhangerhui.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Created by Administrator on 2017/11/8/008.
 */
public class BaseDaoImpl implements BaseDao {

    Session session = null;
    Transaction transaction = null;

    @Override
    public void insert(Object o) {
        session = HibernateUtil.getSession();

        if (session==null){
            return;
        }
        transaction = session.beginTransaction();
        session.save(o);

        //关闭实例session并释放资源
        transaction.commit();
        HibernateUtil.close(session);

    }

    @Override
    public void upadte(Object o) {

        session = HibernateUtil.getSession();

        transaction = session.beginTransaction();

        session.update(o);

        transaction.commit();
        HibernateUtil.close(session);

    }

    @Override
    public void delete(Object o) {
        session = HibernateUtil.getSession();

        transaction = session.beginTransaction();

        session.delete(o);

        transaction.commit();
        HibernateUtil.close(session);

    }
}
