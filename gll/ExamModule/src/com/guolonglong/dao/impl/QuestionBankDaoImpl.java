package com.guolonglong.dao.impl;

import com.guolonglong.bean.QuestionBank;
import com.guolonglong.bean.Subject;
import com.guolonglong.dao.QuestionBankDao;
import com.guolonglong.dao.base.PublicDaoImpl;
import com.guolonglong.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by lenovo on 2017/12/6.
 */
public class QuestionBankDaoImpl extends PublicDaoImpl implements QuestionBankDao {
    @Override
    public List<Subject> selectSubjectSuidCount(String sudirection, String sustage) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        String hql="select s from Subject s where s.sudirection=:sudirection and s.sustage=:sustage" ;

        Query query=session.createQuery(hql);
        query.setString("sudirection",sudirection);
        query.setString("sustage",sustage);
        List<Subject> subjectList=query.list();
        HibernateUtil.close(session);
        return subjectList;
    }

    @Override
    public List<QuestionBank> selectQuestionBankBySucourse(String sucourse) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        String hql = "select q from QuestionBank q where subject.sucourse=:sucourse";

        Query query = session.createQuery(hql);
        query.setString("sucourse",sucourse);
        List<QuestionBank> questionBankList = query.list();

        HibernateUtil.close(session);
        return questionBankList;
    }

    @Override
    public List<QuestionBank> selectQuestionBankBySuid(Integer suid) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        String hql = "select q from QuestionBank q where subject.suid=:suid";

        Query query = session.createQuery(hql);
        query.setInteger("suid",suid);
        List<QuestionBank> questionBankList = query.list();

        HibernateUtil.close(session);
        return questionBankList;
    }

    @Override
    public void questionbankImport(List<QuestionBank> questionBankList) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction ts = session.beginTransaction();
        for (QuestionBank qb:questionBankList){
            session.saveOrUpdate(qb);
        }
        ts.commit();
        session.close();
        HibernateUtil.close(session);

    }

    @Override
    public List<QuestionBank> selectQuestionBankList() {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        String hql = "select q from QuestionBank q";
        Query query = session.createQuery(hql);
        List<QuestionBank> questionBankList = query.list();
        HibernateUtil.close(session);
        return questionBankList;
    }

    @Override
    public QuestionBank crearePaperByQid(Integer qid) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        QuestionBank questionBank = (QuestionBank) session.get(QuestionBank.class, qid);

        HibernateUtil.close(session);
        return questionBank;
    }
}
