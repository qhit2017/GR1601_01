package com.yushaoju.dao.impl;

import com.yushaoju.bean.Students;
import com.yushaoju.bean.Teachers;
import com.yushaoju.dao.TeachersDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.yushaoju.util.HibernateUtil;

import java.util.List;

/**
 * Created by Svip on 2017/11/23.
 */
public class TeachersDaoImpl implements TeachersDao {

    @Override
    public List<Teachers> insertLand(String tname, String tpassword) {

        Session session=   HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction= session.beginTransaction();
        String hql="select t from Teachers t where t.tname=? and t.tpassword=?";
        Query query=session.createQuery(hql);
        query.setString(0,tname);
        query.setString(1,tpassword);
       List<Teachers>teachersList= query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;

    }

    @Override
    public List<Students> insertselectLand(String sname, String spassword) {

        Session session=   HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction= session.beginTransaction();

        String hql="select t from students t where sname=? and spassword=?";
        Query query=session.createQuery(hql);
        query.setString(0,sname);
        query.setString(1,spassword);
        List<Students>studentsList= query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return studentsList;

    }

    @Override
    public List<Teachers> selectAllTeacher() {
       Session session=  HibernateUtil.getSession();
       if(session==null){
           return null;
       }
      Transaction transaction=  session.beginTransaction();
       String hql="select t from Teachers t";
       Query query =session.createQuery(hql);
       List<Teachers> teachersList=query.list();
       transaction.commit();
       HibernateUtil.close(session);
       return teachersList;
    }

    @Override
    public List<Teachers> selectTeacherByTnumberOrTnameOrjob(String number, String name, Integer job) {
      Session session=  HibernateUtil.getSession();
      if (session==null){
          return null;
      }
        Transaction transaction= session.beginTransaction();

      String hql = "select t from Teachers t where 1=1 ";
      if (number!=null && !number.equals("")){
          hql = hql + "and t.tnumber=:number";
      }
      if (name!=null && !name.equals("")){
          hql = hql+"and t.tname=:name";
        }
        if (job!=null  && !job.equals("")){
          hql = hql+"and t.tjob =:job";
        }
        Query query =session.createQuery(hql);
        if (number!=null && !number.equals("")){
            query.setString("number",number);
        }
        if (name!=null && !name.equals("")){
            query.setString("name",name);
        }
        if (job!=null && !job.equals("")){
            query.setInteger("job",job);
        }
        List<Teachers>teachersList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public List<Teachers> increaseTeachers(Teachers teachers) {
        //获取session

        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //拼写HOL
        String hql = "select t from Teachers t  where :tnumber like :tnumber";

        //执行HQL
        Query query = session.createQuery(hql);
        query.setString("tnumber","tnumber");

        List<Teachers> list = query.list();

        HibernateUtil.close(session);

        return list;
    }
}
