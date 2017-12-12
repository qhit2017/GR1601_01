package com.guolonglong.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


/**
 * Created by lenovo on 2017/10/31.
 */
public class HibernateUtil {
    private static SessionFactory sf;

    static {
        sf = new Configuration().configure().buildSessionFactory();
    }

    //1 提供session方法
    public static Session getSession(){
        Session session=null;
        if (sf!=null){
            session=sf.openSession();
        }
        return session;
    }

    //2 回收session
    public static void close(Session session){
        session.close();
    }
}
