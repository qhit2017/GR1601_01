package com.chengshuai.dao.impl;

import com.chengshuai.bean.Questionbank;
import com.chengshuai.bean.Subject;
import com.chengshuai.dao.Questionbankdao;
import com.chengshuai.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by slm on 2017/12/5.
 */
public class Questionbankimpl implements Questionbankdao {
    @Override
    public List<Questionbank> QueryQuestionbankAll() {
        /*查询试题表中所有信息*/
        Session session=  HibernateUtil.getSession();
        if(session==null){
            return  null;
        }

        String hql = "select q from Questionbank q";

        Query query =  session.createQuery(hql);
       List<Questionbank> questionbankList =   query.list();
        return questionbankList;
    }

    @Override
    public List<Subject> QuerySubjectsudirectionAndsustage(String sudirection, String sustage) {
        /*根据阶段方向查询科目*/
       Session session = HibernateUtil.getSession();
       if(session==null){
           return  null;
       }
       String hql = "select  s from Subject s where s.sudirection = :sudirection and s.sustage =:sustage";
       Query query =  session.createQuery(hql);
       query.setString("sudirection",sudirection);
       query.setString("sustage",sustage);
        List<Subject> subjectList =query.list();
        return subjectList;
    }

    @Override
    public List<Questionbank> QuestionbankAllumber(Integer id) {
        Session session =  HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        String hql = "select q from Questionbank  q where subject.suid=:suid";
        Query query =  session.createQuery(hql);
        query.setInteger("suid",id);
        List<Questionbank> questionbanks =  query.list();

        return questionbanks;
    }

    @Override
    public List<Questionbank> QuerySubjtAndsucourse(Integer id) {
          /*根据科目查询题*/
         Session session =  HibernateUtil.getSession();
        return null;
    }
}
