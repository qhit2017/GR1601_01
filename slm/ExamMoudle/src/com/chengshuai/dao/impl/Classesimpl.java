package com.chengshuai.dao.impl;

import com.chengshuai.bean.Classes;
import com.chengshuai.bean.Teachers;
import com.chengshuai.dao.Classesdao;
import com.chengshuai.util.HibernateUtil;
import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by slm on 2017/11/28.
 * 班级管理实现类
 */
public class Classesimpl implements Classesdao {
    @Override
    public List<Classes> QueryClassesAll() {
        /*查询班级表中的所有数据*/
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql = "select c from Classes c";
        Query query = session.createQuery(hql);
        List<Classes> classesList = query.list();
        HibernateUtil.close(session);
        return classesList;
    }

    @Override
    public List<Teachers> QueryTeachersTjob(Integer tjob) {
      /*查询班级表中的所有数据*/
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql = "select t from Teachers t where tjob = :tjob";
        Query query = session.createQuery(hql);
        query.setInteger("tjob", tjob);
        List<Teachers> teachersList = query.list();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public List<Classes> QueryConditionalBycbeginAndcdirectionAndteacherslAndteachersh(String yers, String fx, String  tidl,String  tidh) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }

        String hql = "select c from Classes c where 1=1 ";
        if(yers!=null && !yers.equals("") ){
            hql = hql + " and cbegin like :cbegin";
        }
        if(fx!=null &&!fx.equals("")){
            hql = hql + " and  cdirection = :cdirection ";
        }
        if(tidl!=null && !tidl.equals("")){

            hql = hql + " and teachersl.tid=:tidl";
        }
        if(tidh!=null && !tidh.equals("")){
            hql = hql + " and teachersh.tid=:tidh";
        }
        Query query = session.createQuery(hql);
        if(yers!=null && !yers.equals("") ){
            query.setString("cbegin", yers);
        }
        if(fx!=null &&!fx.equals("")){
            query.setString("cdirection", fx);
        }
        if(tidl!=null && !tidl.equals("")){
            Integer tid11 = Integer.parseInt(tidl);
            query.setInteger("tidl", tid11);
        }
        if(tidh!=null && !tidh.equals("")){
            Integer tid1h = Integer.parseInt(tidh);
            query.setInteger("tidh", tid1h);
        }

        List<Classes> classesList = query.list();
        HibernateUtil.close(session);
        return classesList;
    }

    @Override
    public void saevOrupdate(Classes classes) {
       Session session =  HibernateUtil.getSession();
       if(session==null){
           return;
       }
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(classes);
        transaction.commit();
        HibernateUtil.close(session);
    }

    @Override
    public Classes QueryClasses(Integer id) {

        Session session =  HibernateUtil.getSession();
        if(session==null){
            return  null;
        }

        Transaction transaction = session.beginTransaction();
         Classes classes = (Classes) session.get(Classes.class,id);
        transaction.commit();
        HibernateUtil.close(session);
        return classes;
    }


}
