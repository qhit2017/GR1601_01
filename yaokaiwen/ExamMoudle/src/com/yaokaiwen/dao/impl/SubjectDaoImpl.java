package com.yaokaiwen.dao.impl;

import com.yaokaiwen.bean.Students;
import com.yaokaiwen.bean.Subject;
import com.yaokaiwen.dao.SubjectDao;
import com.yaokaiwen.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by DELL on 2017/12/5.
 */
public class SubjectDaoImpl extends BaseDaoImpl implements SubjectDao {
    @Override
    public List<Subject> selectSubjectAll() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql ="select s from Subject s";
        //2、创建query对象
        Query query= session.createQuery(hql);
        //3、执行hql，返回list
        List<Subject> list = query.list();
        HibernateUtil.close(session);
        return list;
    }
    @Override
    public Subject selectSubjectBySuid(Integer suid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Subject subject = (Subject) session.get(Subject.class,suid);
        HibernateUtil.close(session);
        return subject;
    }

    @Override
    public List<Subject> selectSubjectBy(String sudirection, String sustage) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql = "select s from Subject s WHERE 1=1 ";
        if(sudirection!=null && !"".equals(sudirection)){
            hql= hql    +"and s.sudirection =:sudirection ";
        }
        if(sustage!=null && !"".equals(sustage)){
            hql= hql   +" and s.sustage=:sustage";
        }

        Query query= session.createQuery(hql);
        if(sudirection!=null && !"".equals(sudirection)){
            query.setString("sudirection",sudirection);
        }
        if(sustage!=null && !"".equals(sustage)){
            query.setString("sustage",sustage);
        }

        List<Subject> list = query.list();
        HibernateUtil.close(session);
        return list;
    }

    @Override
    public Subject selectSubjectBySucourse(String sucourse) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql ="select s from Subject s where s.sucourse =:sucourse";
        //2、创建query对象
        Query query= session.createQuery(hql);
        query.setString("sucourse",sucourse);
        //3、执行hql，返回list
        Subject subject = (Subject) query.uniqueResult();
        HibernateUtil.close(session);
        return subject;
    }
}
