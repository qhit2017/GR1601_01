package com.wangyinghao.dao.impl;


import com.wangyinghao.dao.BaseDao;
import com.wangyinghao.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Created by 王英豪 on 2017/11/8.
 */
public class BaseDaoImpl implements BaseDao {
    //添加数据
    @Override
    public void insert(Object o) {
        Session session = HibernateUtil.getSession();

        if (session==null){
            return ;
        }
        Transaction transaction =session.beginTransaction();

        session.save(o);

        transaction.commit();
        HibernateUtil.close(session);

    }
      //更新数据

    @Override
    public void update(Object o) {
        Session session = HibernateUtil.getSession();

        if (session==null){
            return ;
        }
        Transaction transaction =session.beginTransaction();

        session.update(o);

        transaction.commit();
        HibernateUtil.close(session);

    }
   //删除数据
    @Override
    public void delete(Object o) {
        Session session = HibernateUtil.getSession();

        if (session==null){
            return ;
        }
        Transaction transaction =session.beginTransaction();

        session.delete(o);

        transaction.commit();
        HibernateUtil.close(session);

    }

    @Override
    public void insertOrupdate(Object o) {
        Session session = HibernateUtil.getSession();

        if (session==null){
            return ;
        }
        Transaction transaction =session.beginTransaction();
        session.saveOrUpdate(o);


        transaction.commit();
        HibernateUtil.close(session);

    }
}
