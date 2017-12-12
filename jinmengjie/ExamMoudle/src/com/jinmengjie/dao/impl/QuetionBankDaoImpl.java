package com.jinmengjie.dao.impl;

import com.jinmengjie.bean.Questionbank;
import com.jinmengjie.dao.QuetionBankDao;
import com.jinmengjie.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/12/5/005.
 */
public class QuetionBankDaoImpl implements QuetionBankDao {
    @Override
    public List<Questionbank> selectAllInfoBySuid(Integer suid) {

        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //拼写hql语句
                                                                //命名参数
        String hql = "select q from Questionbank q Where q.suid =:suid";
        //创建query对象
        Query query = session.createQuery(hql);
        query.setInteger("suid",suid);
        //执行hql，返回list
        List<Questionbank> questionbank =  query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return questionbank;
    }

    @Override
    public void insertOrUpdate(Questionbank questionbank) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction transaction=session.beginTransaction();
        session.saveOrUpdate(questionbank);
        transaction.commit();
        HibernateUtil.close(session);
    }

    @Override
    public void insert(List<Questionbank> questionbankList) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return ;
        }

        Transaction transaction = session.beginTransaction();

        for(Questionbank q:questionbankList){

            session.saveOrUpdate(q);

        }
        transaction.commit();

        session.close();
    }

}
