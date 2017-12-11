package com.jinmengjie.dao.impl;

import com.jinmengjie.bean.Classes;
import com.jinmengjie.bean.Teachers;
import com.jinmengjie.dao.ClassesDao;
import com.jinmengjie.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/11/29/029.
 */
public class ClassesDaoImpl implements ClassesDao {

   /*查询所有班级信息*/
    @Override
    public List<Classes> selectAllClassInfo() {

        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //拼写hql语句
        //命名参数
        String hql = "select c from Classes c";
        //创建query对象
        Query query = session.createQuery(hql);

        //执行hql，返回list
        List<Classes> classList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return classList;
    }

    @Override
    public List<Teachers> selectTeacherTjobByTjob0(Integer tjob) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql

        String hql="select t from Teachers t where t.tjob =:tjob";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        query.setInteger("tjob",tjob);

        //执行hql
        List<Teachers> teachersList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public List<Teachers> selectTeacherTjobByTjob1(Integer tjob) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql

        String hql="select t from Teachers t where t.tjob =:tjob";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        query.setInteger("tjob",tjob);

        //执行hql
        List<Teachers> teachersList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public List<Classes> sleectbeginclassBycbegin() {

        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();

        String hql = "SELECT DISTINCT (c.cbegin) FROM Classes c";

        //创建query对象
        Query query = session.createQuery(hql);
        //执行hql
        List<Classes> classesList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return classesList;




    }

    //根据界面四个条件查询信息你
    @Override
    public List<Classes> selectClassesInfoBycebginOrcdirectionOrtidlortidh(String cbegin, String cdirection,Integer tidl,Integer tidh) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql

        String hql="select c from Classes c where 1=1 " ;
        if(cbegin!=null && !cbegin.equals("")){
            hql=hql+" and c.cbegin=:cbegin ";
        }
        if(cdirection!=null && !cdirection.equals("")) {
            hql=hql  +" and c.cdirection=:cdirection ";
        }
        if(tidl!=null && !tidl.equals("")){
            hql=hql+" and c.tidl=:tidl ";
        }
        if(tidh!=null && !tidh.equals("")) {
            hql=hql  +" and c.tidh=:tidh ";
        }

        //2.创建Query对象
        Query query=session.createQuery(hql);
        //3.给占位符进行赋值
        if(cbegin!=null && !cbegin.equals("")){
            query.setString("cbegin",cbegin);
        }
        if(cdirection!=null && !cdirection.equals("")) {
            query.setString("cdirection",cdirection);
        }
        if(tidl!=null && !tidl.equals("")){
           query.setInteger("tidl",tidl);
        }
        if(tidh!=null && !tidh.equals("")) {
            query.setInteger("tidh",tidh);
        }


        //执行hql
        List<Classes> classesList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return classesList;

    }

    @Override
    public Classes selectclassesinfoBycid(Integer cid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //拼写hql语句
        //命名参数
        String hql = "select c from Classes c Where c.cid like :cid";
        //创建query对象
        Query query = session.createQuery(hql);


        query.setInteger("cid",cid);

        //执行hql，返回list
        Classes classes = (Classes) query.uniqueResult();
        transaction.commit();
        HibernateUtil.close(session);
        return classes;
    }

    //增加所有信息
    @Override
    public void insertOrUpdateClassesInfo(Classes classes) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction transaction=session.beginTransaction();
        session.saveOrUpdate(classes);
        transaction.commit();
        HibernateUtil.close(session);
    }

    @Override
    public Classes selectClassescnameByCid(String cname) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //拼写hql语句
        //命名参数
        String hql = "select c from Classes c Where c.cname=:cname";
        //创建query对象
        Query query = session.createQuery(hql);
        query.setString("cname",cname);

        //执行hql，返回list
        Classes classes = (Classes) query.uniqueResult();
        transaction.commit();
        HibernateUtil.close(session);
        return classes;
    }
}
