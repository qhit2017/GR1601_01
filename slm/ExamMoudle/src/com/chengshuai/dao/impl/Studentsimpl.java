package com.chengshuai.dao.impl;

import com.chengshuai.bean.Students;
import com.chengshuai.dao.Studentsdao;
import com.chengshuai.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by slm on 2017/11/29.
 */
public class Studentsimpl implements Studentsdao {
    @Override
    public List<Students> selectBysnameAndpwd(Students students) {
             /*登录学生角色   根据用户名 密码查询*/
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        /*拼写hql*/
        String hql = "select s from Students s where  sname =:sname and spassword=:spassword  and srole=:srole ";
        Query query = session.createQuery(hql);
        query.setString("sname", students.getSname());
        query.setString("spassword", students.getSpassword());
        query.setInteger("srole", students.getSrole());
        List<Students> studentsList = query.list();
        transaction.commit();
        ;
        HibernateUtil.close(session);
        return studentsList;
    }

    @Override
    public List<Students> QueryStudentsAll() {
        /*查询学生表中的所有数据*/
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }

        String hql = "select s from Students s";
        Query query = session.createQuery(hql);
        List<Students> studentsList = query.list();
        return studentsList;
    }

    @Override
    public List<Students> QueryBysnumberOrNameOrCnameOrsattend(String snumber, String sname, String cname, String sattend) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql = "select s from Students s where 1=1";
        if(snumber!=null && !"".equals(snumber)){
            hql = hql + " and snumber =:snumber ";
        }
        if(sname!=null && !"".equals(sname)){
            hql = hql + "and sname = :sname ";
        }
        if(cname!=null && !"".equals(cname)){
            hql = hql + "and classes.cnumber=:cname  ";
        }
        if(sattend!=null && !"".equals(sattend)){
            hql = hql + "and sattend =:sattend ";
        }
        Query query =  session.createQuery(hql);
        if(snumber!=null && !"".equals(snumber)){
            query.setString("snumber",snumber);
        }
        if(sname!=null && !"".equals(sname)){
            query.setString("sname",sname);
        }
        if(cname!=null && !"".equals(cname)){
            query.setString("cname",cname);
        }
        if(sattend!=null && !"".equals(sattend)){
            query.setString("sattend",sattend);
        }
        List<Students> studentsList =  query.list();

        return studentsList;
    }

    @Override
    public void saveORupdate(Students students) {
        /*添加或者修改*/
        Session session = HibernateUtil.getSession();
        if(session==null){
            return;
        }

        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(students);
        transaction.commit();
        HibernateUtil.close(session);
    }

    @Override
    public Students Queryandid(Integer id) {
        Session session =  HibernateUtil.getSession();
        if(session == null ){
            return  null;
        }
        Transaction transaction = session.beginTransaction();
      Students students = (Students) session.get(Students.class,id);
        transaction.commit();

        HibernateUtil.close(session);
        return  students;
    }

    @Override
    public void SaveDao(List<Students> students) {
     Session session = HibernateUtil.getSession();
     if(session ==null){
         return;
     }

     Transaction transaction = session.beginTransaction();
     for (Students s:students){
         session.save(s);
     }
     transaction.commit();
     HibernateUtil.close(session);
    }
}
