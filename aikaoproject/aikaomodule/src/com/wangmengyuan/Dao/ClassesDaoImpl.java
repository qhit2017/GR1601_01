package com.wangmengyuan.Dao;

import com.wangmengyuan.Util.HibernateUtil;
import com.wangmengyuan.bean.Classes;
import com.wangmengyuan.bean.Teachers;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/12/5.
 */
public class ClassesDaoImpl implements ClassesDao {
    //查询班级所有信息
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
    //添加  修改班级信息
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
    //多条件查询
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
    //根据id查询班级表中的数据
    @Override
    public Classes QueryClasses(Integer id) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        Classes classes = (Classes) session.get(Classes.class,id);
        tx.commit();
        HibernateUtil.close(session);
        return classes;
    }
}
