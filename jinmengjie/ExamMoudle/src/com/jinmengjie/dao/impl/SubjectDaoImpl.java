package com.jinmengjie.dao.impl;

import com.jinmengjie.bean.Subject;
import com.jinmengjie.dao.SubjectDao;
import com.jinmengjie.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/12/5/005.
 */
public class SubjectDaoImpl implements SubjectDao {
    //根据科目和方向做精确查询
    @Override
    public List<Subject> selectSubjectInfoBySudirectionAndSustage(String sudirection, String sustage) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql

        String hql="select s from Subject s where 1=1 " ;
        if(sudirection!=null && !sudirection.equals("")){
            hql=hql+" and s.sudirection=:sudirection ";
        }
        if(sustage!=null && !sustage.equals("")) {
            hql=hql  +" and s.sustage=:sustage ";
        }
        //2.创建Query对象
        Query query=session.createQuery(hql);
        //3.给占位符进行赋值
        if(sudirection!=null && !sudirection.equals("")){
            query.setString("sudirection",sudirection);
        }
        if(sustage!=null && !sustage.equals("")) {
            query.setString("sustage",sustage);
        }
        //执行hql，返回list
        List<Subject> subjectsList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return subjectsList;
    }

    @Override
    public Subject selectSubjectBysucourse(String sucourse) {
        Session session= HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();

        //???????????????????????????????????????????????????????????????????
        String hql="select s from Subject s where s.sucourse=:sucourse " ;
        Query query = session.createQuery(hql);
        //???????????????????????????????????????????????????????????????????
        query.setString("sucourse",sucourse);
        Subject subject = (Subject) query.uniqueResult();

        transaction.commit();
        HibernateUtil.close(session);
        return subject;
    }
}
