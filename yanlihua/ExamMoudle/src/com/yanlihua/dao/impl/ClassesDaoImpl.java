package com.yanlihua.dao.impl;

import com.yanlihua.bean.Classes;
import com.yanlihua.bean.Students;
import com.yanlihua.bean.Teachers;
import com.yanlihua.dao.ClassesDao;
import com.yanlihua.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/25.
 */
public class ClassesDaoImpl implements ClassesDao {
    @Override
    public List<Classes> selectAllClassInfoClassDao() {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select c from Classes c";
        //2.创建Query对象
        Query query=session.createQuery(hql);

        //执行hql
        List<Classes> classList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return classList;
    }

    @Override
    public List<Teachers> selectTeacherInfoByTjobClassDaob(Integer tjob) {
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
    public List<Teachers> selectTeacherInfoByTjobClassDaoj(Integer tjob) {
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
    public List<Classes> selectClassByFourConditionClassDao(String cbegin, String cdirection) {
        {
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
           /* if(tidl!=null && !tidl.equals("")) {
                hql=hql+" and teacherl.tid=:tidl";
            }
            if(tidh!=null && !tidh.equals("")) {
                hql=hql+" and teacherh.tid=:tidh";
            }*/
            //2.创建Query对象
            Query query=session.createQuery(hql);
            //3.给占位符进行赋值
            if(cbegin!=null && !cbegin.equals("")){
                query.setString("cbegin",cbegin);
            }
            if(cdirection!=null && !cdirection.equals("")) {
                query.setString("cdirection",cdirection);
            }
           /* if(tidl!=null && !tidl.equals("")) {
           //把上面传的参数给转换类型
           //上面传String类型  下面转换
                query.setInteger("tidl",tidl);
            }
            if(tidh!=null && !tidh.equals("")) {
                query.setInteger("tidh",tidh);
            }*/
            //执行hql
            List<Classes> classesList=query.list();
            transaction.commit();
            HibernateUtil.close(session);
            return classesList;
        }
    }

    @Override
    public void saveOrUpdateClassesinfoClassesDao(Classes classes) {
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
    public Classes selectClassesinfoByCidClassesDao(Integer cid) {
        Session session= HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        Classes classes=(Classes) session.get(Classes.class,cid);
        transaction.commit();
        HibernateUtil.close(session);
        return classes;
    }

    @Override
    public List<Students> select(Classes classes) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql

        String hql="select s from Students s where s.classes.cid =:cid";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        query.setInteger("cid",classes.getCid());

        //执行hql
        List<Students> teachersList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }
}
