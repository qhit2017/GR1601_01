package com.yaokaiwen.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Created by Administrator on 2017/10/31.
 */
public class HibernateUtil {

    private static SessionFactory sessionFactory;

    static {
        sessionFactory = new Configuration().configure().buildSessionFactory();
    }
    //1、提供session方法
    public  static Session getSession(){
        Session session = null;

        if(sessionFactory!=null){
            session = sessionFactory.openSession();
        }
        return session;

    }

    //2、回收session
    public static void close(Session session){
        session.close();
    }
}
