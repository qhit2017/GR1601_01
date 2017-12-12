package com.zhanglong.dao.impl;

import com.zhanglong.bean.Subject;
import com.zhanglong.bean.Testpaper;
import com.zhanglong.dao.ShijuanDao;
import com.zhanglong.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/12/9 0009.
 */
public class ShijuanDaoImpl extends BaseDaoImpl implements ShijuanDao  {
    @Override
    public List<Testpaper> selectxinxi() {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select t from Testpaper t ";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        //执行hql
        List<Testpaper> testpaperList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return testpaperList;
    }

    @Override
    public List<Subject> selectkemuxialakaung() {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select s from  Subject s";
        //2.创建Query对象
        Query query=session.createQuery(hql);


        //执行hql
        List<Subject> subjectList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return subjectList;
    }

    @Override
    public List<Testpaper> selectFivechaxun(Integer suid, String ttype, String tstate) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select t from  Testpaper t where 1=1";
        if(suid!=null && !suid.equals("")){
            hql=hql+" and t.subject.suid=:suid ";
        }
        if(ttype!=null && !ttype.equals("")) {
            hql=hql  +" and t.ttype=:ttype ";
        }
        if(tstate!=null && !tstate.equals("")) {
            hql=hql+" and t.tstate=:tstate";
        }
        //2.创建Query对象
        Query query=session.createQuery(hql);
        //3.给占位符进行赋值
        if(suid!=null && !suid.equals("")){
            query.setInteger("suid",suid);
        }
        if(ttype!=null && !ttype.equals("")) {
            query.setString("ttype",ttype);
        }
        if(tstate!=null && !tstate.equals("")) {
            query.setString("tstate",tstate);
        }

        //执行hql
        List<Testpaper> testpaperList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return testpaperList;
}

    @Override
    public void savexinxi(Testpaper testpaper) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction transaction=session.beginTransaction();
        session.saveOrUpdate(testpaper);
        transaction.commit();
        HibernateUtil.close(session);
    }
}
