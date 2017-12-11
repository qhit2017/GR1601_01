package com.chengshuai.dao;

import com.chengshuai.bean.message;
import com.chengshuai.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by king on 12/5/2017.
 */
public class MessageDaoImpl  extends  BaseDaoImpl implements MessageDao {
    @Override
    public List<message> SelectMessageAllDao() {

        Session session = HibernateUtil.getSession();

        if (session == null) {
            return  null;
        }
        //session打开事物
        Transaction transaction = session.beginTransaction();

        //拼写hql语言
        String hql="select m from message m";
        //创建查询
        Query query = session.createQuery(hql);
        //调list自己穿创建list
        List<message> messageList = query.list();

        //提交事务
        transaction.commit();
        HibernateUtil.close(session);
        //最后retrun
        return messageList ;

    }

    @Override
    //根据条件查询Dao

    public List<message> SelectMessageBymidAndmnameDao(Integer mid, String mname) {

        Session session = HibernateUtil.getSession();

        if (session == null) {
            return  null;
        }
        //session打开事物
        Transaction transaction = session.beginTransaction();


        //拼写hql
        String hql = "select m from message m where m.mid=:mid and m.mname=:mname";
        //创建query对象并执行hql返回list
        Query query = session.createQuery(hql);

        query.setInteger("mid", mid);
        query.setString("mname", mname);

        List<message> list = query.list();

        transaction = session.beginTransaction();

        transaction.commit();
        HibernateUtil.close(session);
        return list;
    }

    @Override
    public void InsertMessageDao(message message) {

        Session session = HibernateUtil.getSession();

        if (session == null) {
            return ;
        }
        //session打开事物
        Transaction transaction = session.beginTransaction();


        transaction = session.beginTransaction();

        session.saveOrUpdate(message);
        transaction.commit();
        HibernateUtil.close(session);
    }

    @Override
    public message SelectMessageBymidDao(Integer mid) {
        Session session = HibernateUtil.getSession();

        if (session == null) {
            return null;
        }
        //session打开事物
        Transaction transaction = session.beginTransaction();

        //根据get查询
        message message1 = (message) session.get(message.class, new Integer(mid));

        //提交事务
        transaction.commit();
        HibernateUtil.close(session);
        return message1 ;
    }

}
