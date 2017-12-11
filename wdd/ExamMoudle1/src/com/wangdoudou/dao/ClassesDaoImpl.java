
package com.wangdoudou.dao;

import com.wangdoudou.bean.Classes;
import com.wangdoudou.bean.Teachers;
import com.wangdoudou.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;


/**
 * Created by 王豆豆 on 2017/12/1.
 */

public class ClassesDaoImpl implements ClassesDao {
    //查询班级信息
    @Override
    public List<Classes> selectAllClassesInfo() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        //拼写HQL
        String hql="select c from Classes c";
        //创建query对象
        Query query= session.createQuery(hql);
        //执行sql 返回list
        List<Classes>classesList=query.list();
        tx.commit();
        HibernateUtil.close(session);
        return classesList;
    }
    //根据岗位查询讲师信息
    @Override
    public List<Teachers> selectTeachersByTjob0(Integer tjob) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        //拼写HQL
        String hql="select t from Teachers t where t.tjob =:tjob";
        //创建query对象
        Query query= session.createQuery(hql);
        query.setInteger("tjob",tjob);
        //执行sql 返回list
        List<Teachers>teachersList=query.list();

        tx.commit();
        HibernateUtil.close(session);
        return teachersList;
    }
    //根据岗位查询班主任信息
    @Override
    public List<Teachers> selectTeachersByTjob1(Integer tjob) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        //拼写HQL
        String hql="select t from Teachers t where t.tjob =:tjob";
        //创建query对象
        Query query= session.createQuery(hql);
        query.setInteger("tjob",tjob);
        //执行sql 返回list
        List<Teachers>teachersList=query.list();

        tx.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    //条件查询
    @Override
    public List<Classes> selectClassesBy(String cbegin, String cdirection) {
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
    // 添加班级或修改班级信息
    @Override
    public void saevOrupdateClasses(Classes classes) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return ;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(classes);
        tx.commit();
        HibernateUtil.close(session);

    }
    //根据id查询班级表中的数据
    @Override
    public Classes QueryClasses(Integer cid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        Classes classes1 = (Classes) session.get(Classes.class,cid);
        tx.commit();
        HibernateUtil.close(session);
        return classes1;
    }

}

