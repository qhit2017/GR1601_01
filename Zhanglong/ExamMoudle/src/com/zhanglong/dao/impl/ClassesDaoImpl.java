package com.zhanglong.dao.impl;

import com.zhanglong.bean.Classes;
import com.zhanglong.bean.Teachers;
import com.zhanglong.dao.ClassesDao;
import com.zhanglong.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/11/29 0029.
 */
public class ClassesDaoImpl extends BaseDaoImpl implements ClassesDao {
    @Override
    public List<Classes> selectAllClassInfo() {
        Session session= HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();

        String hql= " select c from Classes c ";

        Query query=session.createQuery(hql);

        List<Classes> classList=query.list();

        transaction.commit();
        HibernateUtil.close(session);
        return classList;

    }

    @Override
    public List<Teachers> selectTeacherBytjobjiangshi(Integer tjob) {
        Session session= HibernateUtil.getSession();
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
    public List<Teachers> selectTeacherBytjobbanzhuren(Integer tjob) {
        Session session= HibernateUtil.getSession();
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
    public List<Classes> selectChaxun(String cbegin, String cdirection, String tidl, String tidh) {
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
        if(tidl!=null && !tidl.equals("")) {
                hql=hql+" and c.teachersl.tid=:tidl";
            }
            if(tidh!=null && !tidh.equals("")) {
                hql=hql+" and c.teachersh.tid=:tidh";
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
        if(tidl!=null && !tidl.equals("")) {
            Integer tidl1=Integer.parseInt(tidl);
                query.setInteger("tidl",tidl1);
            }
        if(tidh!=null && !tidh.equals("")) {
            Integer tidh1=Integer.parseInt(tidh);
            query.setInteger("tidh",tidh1);
            }
        System.out.println("66666666666666666666666"+hql);
        //执行hql
        List<Classes> classesList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return classesList;
    }

    @Override
    public void saveOrUpdateClasses(Classes classes) {
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
    public Classes selectClassById(Integer cid) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        Classes classes=(Classes) session.get(Classes.class,cid);
        transaction.commit();
        HibernateUtil.close(session);
        return classes;
    }
}
