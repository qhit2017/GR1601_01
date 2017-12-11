package com.zhangerhui.dao.impl;

import com.zhangerhui.bean.Classes;
import com.zhangerhui.bean.Teachers;
import com.zhangerhui.dao.ClassesDao;
import com.zhangerhui.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/12/4/004.
 */
public class ClassesDaoImpl extends BaseDaoImpl implements ClassesDao {

    Session session = null;
    Transaction transaction = null;

    @Override
    public List<Classes> queryClassesallinfo() {
        session = HibernateUtil.getSession();

        //拼写hql
        String hql = "select c from Classes c";
        //创建query对象并执行hql返回list
        Query query = session.createQuery(hql);

        List<Classes> list = query.list();

        transaction = session.beginTransaction();

        transaction.commit();
        HibernateUtil.close(session);
        return list;

    }

    @Override
    public List<Classes> queryClassByFour(String cbegin, String cdirection) {
        session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        transaction=session.beginTransaction();
        //1.拼写hql

        String hql="select c from Classes c where 1=1 " ;

        if(cbegin!=null && !cbegin.equals("")){
            hql=hql+" and c.cbegin=:cbegin ";
        }

        if(cdirection!=null && !cdirection.equals("")) {
            hql=hql  +" and c.cdirection=:cdirection ";
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

        //执行hql
        List<Classes> classesList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return classesList;
    }

    @Override
    public Classes queryClassesByCid(Integer cid) {
        session= HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        transaction=session.beginTransaction();
        Classes classes=(Classes) session.get(Classes.class,cid);
        transaction.commit();
        HibernateUtil.close(session);
        return classes;
    }

    @Override
    public List<Teachers> queryTeacherInfoByTjobClassDaob(Integer tjob) {
        session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        transaction=session.beginTransaction();
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
    public List<Teachers> queryTeacherInfoByTjobClassDaoj(Integer tjob) {
        session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        transaction=session.beginTransaction();
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
}
