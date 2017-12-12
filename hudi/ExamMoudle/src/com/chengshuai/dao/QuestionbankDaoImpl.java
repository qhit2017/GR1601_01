package com.chengshuai.dao;

import com.chengshuai.bean.Questionbank;
import com.chengshuai.bean.Teachers;
import com.chengshuai.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/12/6.
 */
public class QuestionbankDaoImpl  implements QuestionbankDao{


    /**
     *
     * @param flg 0
     * @return
     */
    public List<Questionbank> selectQuestion(Integer flg){
        Session session = HibernateUtil.getSession();
        if(session==null){
            return null;
        }

        Transaction transaction = session.beginTransaction();

        String hql="";


        if(flg==0){
            hql="select q from Questionbank q where q.qtype=0 and q.qdifficulty='简单'";
        }else if(flg==1){
            hql="select q from Questionbank q where q.qtype=0 and q.qdifficulty='一般'";
        }else if(flg==2){
            hql="select q from Questionbank q where q.qtype=0 and q.qdifficulty='困难'";
        }else if(flg==3){
            hql="select q from Questionbank q where q.qtype=1 and q.qdifficulty='简单'";
        }else if(flg==4){
            hql="select q from Questionbank q where q.qtype=1 and q.qdifficulty='一般'";
        }else if(flg==5){
            hql="select q from Questionbank q where q.qtype=1 and q.qdifficulty='困难'";
        }

        Query query = session.createQuery(hql);

        List<Questionbank> questionbankList= query.list();

        transaction.commit();

        HibernateUtil.close(session);
        return questionbankList;
    }

}
