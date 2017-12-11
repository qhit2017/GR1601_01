package com.yanlihua.dao.impl;

import com.yanlihua.bean.Questionbank;
import com.yanlihua.bean.Subject;
import com.yanlihua.bean.Teachers;
import com.yanlihua.dao.QuestionBankDao;
import com.yanlihua.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 晏利花 on 2017/12/5.
 */
public class QuestionBankDaoImpl implements QuestionBankDao {
    @Override
    public List<Subject> selectSubjectInfoBySudAndSusQuestionDao(String sudirection, String sustage) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //1.拼写hql
        String hql = "select s from Subject s where s.sudirection =:sudirection and s.sustage =:sustage ";
        //2.创建Query对象
        Query query = session.createQuery(hql);
        query.setString("sudirection", sudirection);
        query.setString("sustage", sustage);


        //执行hql
        List<Subject> subjectList = query.list();
        transaction.commit();
        session.close();
        return subjectList;
    }

    @Override
    public List<Questionbank> selectSuidNumberInQuestionBankQuestionBankDao(Integer suid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //1.拼写hql
        String hql = "select q   from Questionbank q where q.subject.suid=:suid";
        //2.创建Query对象
        Query query = session.createQuery(hql);
        query.setInteger("suid", suid);
        List<Questionbank> questionbankList = query.list();

        transaction.commit();
        session.close();
        return questionbankList;
    }

    @Override
    public Subject selectSubjectnameBySuidQuestionBankDao(Integer suid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //1.拼写hql
        String hql = "select s from Subject s where s.suid =:suid";
        //2.创建Query对象
        Query query = session.createQuery(hql);
        query.setInteger("suid", suid);

        //执行hql
        List<Subject> subjectList = query.list();
        Subject subject = subjectList.get(0);
        transaction.commit();
        session.close();
        return subject;
    }


    @Override
    public List<Questionbank> selectQuestion(Integer flg) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }

        Transaction transaction = session.beginTransaction();

        String hql = "";

        if (flg == 0) {
            hql = "select q from Questionbank q where q.qtype=0 and q.qdifficulty='简单'";
        } else if (flg == 1) {
            hql = "select q from Questionbank q where q.qtype=0 and q.qdifficulty='一般'";
        } else if (flg == 2) {
            hql = "select q from Questionbank q where q.qtype=0 and q.qdifficulty='困难'";
        } else if (flg == 3) {
            hql = "select q from Questionbank q where q.qtype=1 and q.qdifficulty='简单'";
        } else if (flg == 4) {
            hql = "select q from Questionbank q where q.qtype=1 and q.qdifficulty='一般'";
        } else if (flg == 5) {
            hql = "select q from Questionbank q where q.qtype=1 and q.qdifficulty='困难'";
        }

        Query query = session.createQuery(hql);

        List<Questionbank> questionbankList = query.list();

        transaction.commit();

        HibernateUtil.close(session);
        return questionbankList;
    }
}
