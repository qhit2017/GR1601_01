package com.yaokaiwen.dao.impl;

import com.yaokaiwen.bean.Classes;
import com.yaokaiwen.bean.Questionbank;
import com.yaokaiwen.bean.Students;
import com.yaokaiwen.dao.QuestionbankDao;
import com.yaokaiwen.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by DELL on 2017/12/4.
 */
public class QuestionbankDaoImpl extends BaseDaoImpl implements QuestionbankDao {
    @Override
    public String selectnumberBySuid(Integer suid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql ="SELECT COUNT(q) FROM Questionbank q where q.suid=:suid";
        //2、创建query对象
        Query query= session.createQuery(hql);
        query.setInteger("suid",suid);
        //3、执行hql，返回list
        String number = query.uniqueResult().toString();
        return number;
    }

    @Override
    public List<Questionbank> selectQuestionbankBySuid(Integer suid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql ="SELECT q FROM Questionbank q where q.suid=:suid";
        //2、创建query对象
        Query query= session.createQuery(hql);
        query.setInteger("suid",suid);
        //3、执行hql，返回list
        List<Questionbank> list = query.list();
        return list;
    }

    @Override
    public void insertsavequestionbanks(List<Questionbank> questionbankList) {
        Session session =  HibernateUtil.getSession();
        if(session==null){
            return ;
        }
        Transaction transaction = session.beginTransaction();
        for (Questionbank q : questionbankList){
            session.saveOrUpdate(q);
        }
        transaction.commit();
        HibernateUtil.close(session);
    }
}
