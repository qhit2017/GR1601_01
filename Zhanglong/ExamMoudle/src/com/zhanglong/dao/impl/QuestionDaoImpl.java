package com.zhanglong.dao.impl;

import com.zhanglong.bean.Questionbank;
import com.zhanglong.bean.Subject;
import com.zhanglong.dao.QuestionDao;
import com.zhanglong.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/12/5 0005.
 */
public class QuestionDaoImpl extends BaseDaoImpl implements QuestionDao {

    @Override
    public List<Subject> selectchaxunBySudirectionandSustage(String sudirection, String sustage) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select s from Subject s where s.sudirection =:sudirection and s.sustage =:sustage ";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        query.setString("sudirection",sudirection);
        query.setString("sustage",sustage);

        //执行hql
        List<Subject> subjectList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return subjectList;
    }

    @Override
    public List<Questionbank> selectshumu(Integer suid) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select q from Questionbank q where q.subject.suid=:suid";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        query.setInteger("suid",suid);
        List<Questionbank> questionbankList= query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return questionbankList;
    }

    @Override
    public Subject selectname(Integer suid) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select s from Subject s where s.suid =:suid";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        query.setInteger("suid",suid);
        //执行hql
        List<Subject> subjectList1=query.list();
        Subject subject=subjectList1.get(0);

        transaction.commit();
        HibernateUtil.close(session);
        return subject;
    }
    //查询表格数据库所有信息
    @Override
    public List<Questionbank> selectAllxinxi() {
        Session session=HibernateUtil.getSession();
        if (session==null){
            return  null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select q from Questionbank q";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        List<Questionbank>questionbankList=query.list();

        transaction.commit();
        HibernateUtil.close(session);
        return questionbankList;
    }
    //根据qid查询所有信息
    @Override
    public Questionbank selectQuestionbankByqid(Integer qid) {
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
    //删除信息
    @Override
    public void shanxhuQuestionbank(Questionbank questionbank) {
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
    //修改信息
    @Override
    public void saveorupdatequestionbank(Questionbank questionbank) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction transaction=session.beginTransaction();
        session.saveOrUpdate(questionbank);
        transaction.commit();
        HibernateUtil.close(session);
    }
    //导入问题
    @Override
    public void daoruquestion(List<Questionbank> questionbankList) {
      Session session=HibernateUtil.getSession();
      if (session==null){
          return;
      }
      Transaction transaction=session.beginTransaction();
      for (Questionbank questionbank:questionbankList){
          session.save(questionbank);
      }
      transaction.commit();
      HibernateUtil.close(session);
    }
}
