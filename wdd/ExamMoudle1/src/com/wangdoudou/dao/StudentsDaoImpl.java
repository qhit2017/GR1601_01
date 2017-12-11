package com.wangdoudou.dao;

import com.wangdoudou.bean.Students;
import com.wangdoudou.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 王豆豆 on 2017/12/3.
 */
public class StudentsDaoImpl implements StudentsDao {
    //显示学生界面
    @Override
    public List<Students> selectAllStudentsinfo() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        //拼写HQL
        String hql="select s from Students s";
        //创建query对象
        Query query= session.createQuery(hql);
        //执行sql 返回list
        List<Students>studentsList=query.list();

        tx.commit();
        HibernateUtil.close(session);
        return studentsList;
    }

    //根据id查询信息
    @Override
    public Students selectById(Students students) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        Students students1 = (Students) session.get(Students.class, students.getSid());
        session.save(students);
        tx.commit();
        HibernateUtil.close(session);
        return students1;
    }
    //条件查询
    @Override
    public List<Students> selectStudentsBysnumberAndsname(String snumber, String sname) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        //拼写HQL
        String hql="select s from Students s where 1=1";
        if (snumber!=null && !snumber.equals("")){
            hql=hql +" and s.snumber=:snumber";
        }
        if (sname!=null && !sname.equals("")){
            hql=hql +" and s.sname=:sname";
        }


        //创建query对象
        Query query= session.createQuery(hql);
        //给占位符进行赋值
        if (snumber!=null && !snumber.equals("")){
            query.setString("snumber",snumber);
        }
        if (sname!=null && !sname.equals("")){
            query.setString("sname",sname);
        }

        //执行sql 返回list
        List<Students>studentsList=query.list();

        tx.commit();
        HibernateUtil.close(session);
        return studentsList;
    }
    @Override
    public List<Students> selectStudentBysnumber(String snumber) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        //拼写HQL
        String hql="select s from Students s where s.snumber like:snumber ";
        //创建query对象
        Query query= session.createQuery(hql);
        //给占位符进行赋值
        query.setString("snumber",snumber);
        //执行sql 返回list
        List<Students>studentsList=query.list();

        tx.commit();
        HibernateUtil.close(session);
        return studentsList;
    }
    //添加或修改学生信息
    @Override
    public void saveOrupdateStudentinfo(Students students) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return ;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(students);
        tx.commit();
        HibernateUtil.close(session);
    }
    //删除
    @Override
    public void deleteStudentsinfo(Students students) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return ;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        session.delete(students);
        tx.commit();
        HibernateUtil.close(session);
    }
}
