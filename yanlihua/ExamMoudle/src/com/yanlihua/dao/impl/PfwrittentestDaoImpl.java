package com.yanlihua.dao.impl;

import com.yanlihua.bean.Questionbank;
import com.yanlihua.bean.Students;
import com.yanlihua.bean.Subject;
import com.yanlihua.bean.Teachers;
import com.yanlihua.dao.PfwrittentestDao;
import com.yanlihua.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/30.
 */
public class PfwrittentestDaoImpl implements PfwrittentestDao {
    @Override
    public List<Questionbank> selectQuestionbankAllInfoPfwrittentestDao() {
            Session session= HibernateUtil.getSession();
            if(session==null){
                return null;
            }
            Transaction transaction=session.beginTransaction();
            //1.拼写hql
            String hql="select q from  Questionbank q";
            //2.创建Query对象
            Query query=session.createQuery(hql);


            //执行hql
            List<Questionbank> questionbankList=query.list();
            transaction.commit();
            HibernateUtil.close(session);
            return questionbankList;

    }

    @Override
    public Questionbank selectQuestionbankInfoPfwrittentestDao(Integer qid) {
        Session session= HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        Questionbank questionbank =(Questionbank) session.get(Questionbank.class,qid);
        transaction.commit();
        HibernateUtil.close(session);
        return questionbank;
    }

    @Override
    public void deleteQuestionByqidPfwrittentestDao(Questionbank questionbank) {
            Session session= HibernateUtil.getSession();
            if (session==null){
                return ;
            }
            Transaction transaction=session.beginTransaction();
            session.delete(questionbank);
            transaction.commit();
            HibernateUtil.close(session);
            return ;

    }

    @Override
    public void saveOrUpdateQuestionPfwrittentestDao(Questionbank questionbank) {
        {
            Session session = HibernateUtil.getSession();
            if (session==null){
                return ;
            }
            Transaction transaction=session.beginTransaction();
            session.saveOrUpdate(questionbank);
            transaction.commit();
            HibernateUtil.close(session);
        }
    }

    @Override
    public List<Subject> selectSubjectSucourseExtistPfwrittentestDao(String sucourse) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        //users和bikes都要存在（先去查询他们是否存在）
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select s from Subject s where s.sucourse =:sucourse";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        //3.给占位符进行赋值
        query.setString("sucourse",sucourse);
        //执行hql
        List<Subject> subjectList=query.list();

        transaction.commit();
        HibernateUtil.close(session);
        return subjectList;

    }
}
