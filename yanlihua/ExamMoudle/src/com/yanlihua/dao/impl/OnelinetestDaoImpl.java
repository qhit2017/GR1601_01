package com.yanlihua.dao.impl;

import com.yanlihua.bean.Students;
import com.yanlihua.bean.Testpaper;
import com.yanlihua.dao.OnelinetestDao;
import com.yanlihua.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 晏利花 on 2017/12/9.
 */
public class OnelinetestDaoImpl implements OnelinetestDao {
    @Override
    public Students selectStudentInfoOnelinetestDao(String sname) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select s from Students s where s.sname=:sname";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        query.setString("sname",sname);

        //执行hql
        List<Students> studentsList=query.list();
       Students students=studentsList.get(0);
        transaction.commit();
        HibernateUtil.close(session);
        return students;
    }

    @Override
    public  List<Testpaper> selectTestpaperInfolinetestDao(String cname) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select t from Testpaper t where t.cname=:cname";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        query.setString("cname",cname);

        //执行hql
        List<Testpaper> testpaperList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return testpaperList;
    }

    @Override
    public Testpaper selectTestpaperInfoByTidOnelinetestDao(Integer tid) {
        Session session= HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        Testpaper testpaper =(Testpaper) session.get(Testpaper.class,tid);
        transaction.commit();
        HibernateUtil.close(session);
        return testpaper;
    }
}
