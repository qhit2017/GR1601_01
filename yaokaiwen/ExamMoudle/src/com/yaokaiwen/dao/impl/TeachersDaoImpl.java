package com.yaokaiwen.dao.impl;


import com.yaokaiwen.bean.Teachers;
import com.yaokaiwen.dao.TeachersDao;
import com.yaokaiwen.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by DELL on 2017/11/24.
 */
public class TeachersDaoImpl extends BaseDaoImpl implements TeachersDao {
   @Override
    public Teachers selectTeachersByNameandpassword(Teachers teachers) {
       Session session = HibernateUtil.getSession();
       if (session == null) {
           return null;
       }
       //1、拼写HQL
       //String hql ="select d from Dept d where t.tname=? and t.tpassword=?";
       String hql ="select t from Teachers t where (t.tname=:tname and t.tpassword=:tpassword) or(t.tnumber=:tnumber and t.tpassword=:tpassword ) ";

       //2、创建query对象
       Query query= session.createQuery(hql);

       //给占位符进行赋值
       query.setString("tname",teachers.getTname());//preparedStament赋值 从1开始， query赋值 从0开始
       query.setString("tpassword",teachers.getTpassword());
       query.setString("tnumber",teachers.getTnumber());
       //3、执行hql，返回list
       teachers = (Teachers) query.uniqueResult();

       HibernateUtil.close(session);
       return teachers;
    }

    @Override
    public List<Teachers> selectTeachersAll() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql ="select t from Teachers t";
        //2、创建query对象
        Query query= session.createQuery(hql);
        //3、执行hql，返回list
        List<Teachers> list = query.list();
        HibernateUtil.close(session);
        return list;
    }

    @Override
    public List<Teachers> selectTeachersAllBy(Teachers teachers) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql = "SELECT t FROM Teachers t WHERE 1=1 ";
        if(teachers.getTnumber()!=null && !"".equals(teachers.getTnumber())){
            hql= hql    +" and t.tnumber=:tnumber";
        }
        if(teachers.getTname()!=null && !"".equals(teachers.getTname())){
            hql= hql   +" and tname=:tname";
        }
        if(teachers.getTjob()!=null && !"".equals(teachers.getTjob())){
            hql= hql  +" and tjob=:tjob";
        }
        Query query= session.createQuery(hql);
        if(teachers.getTnumber()!=null && !"".equals(teachers.getTnumber())){
            query.setString("tnumber",teachers.getTnumber());
        }
        if(teachers.getTname()!=null && !"".equals(teachers.getTname())){
            query.setString("tname",teachers.getTname());
        }
        if(teachers.getTjob()!=null && !"".equals(teachers.getTjob())){
            query.setInteger("tjob",teachers.getTjob());
        }
        List<Teachers> list = query.list();
        HibernateUtil.close(session);
        return list;
    }
    @Override
    public String selectTeachersByDate(String date) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //1、拼写HQL
        //String hql ="select d from Dept d where t.tname=? and t.tpassword=?";
        String hql ="SELECT t.tnumber FROM Teachers t where t.tnumber like :tnumber ORDER BY tnumber desc";
        //2、创建query对象
        Query query= session.createQuery(hql);
        query.setString("tnumber",date+"___");
        query.setFirstResult(0);
        query.setMaxResults(1);
        //3、执行hql，返回list
        String sdate = (String) query.uniqueResult();
        HibernateUtil.close(session);
        return sdate;
    }
    @Override
    public Teachers selectTeachersByTnumber(String tnumber) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //1、拼写HQL
        //String hql ="select d from Dept d where t.tname=? and t.tpassword=?";
        String hql ="SELECT t FROM Teachers t where t.tnumber =:tnumber ";
        //2、创建query对象
        Query query= session.createQuery(hql);
        query.setString("tnumber",tnumber);
        //3、执行hql，返回list
        Teachers teachers = (Teachers) query.uniqueResult();
        HibernateUtil.close(session);
        return teachers;
    }
    @Override
    public Teachers selectTeachersByTid(Integer tid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Teachers teachers = (Teachers) session.get(Teachers.class,tid);
        HibernateUtil.close(session);
        return teachers;
    }
}
