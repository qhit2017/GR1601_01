package com.yaokaiwen.dao.impl;

import com.yaokaiwen.bean.Classes;
import com.yaokaiwen.bean.Students;
import com.yaokaiwen.bean.Teachers;
import com.yaokaiwen.dao.StudentsDao;
import com.yaokaiwen.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by DELL on 2017/11/24.
 */
public class StudentDaoImpl extends BaseDaoImpl implements StudentsDao{
    @Override
    public Students selectStudentsByNameandpassword(Students students) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //1、拼写HQL
        //String hql ="select d from Dept d where t.tname=? and t.tpassword=?";
        String hql ="select s from Students s where (s.sname=:sname and s.spassword=:spassword) or(s.snumber=:snumber and s.spassword=:spassword ) ";

        //2、创建query对象
        Query query= session.createQuery(hql);

        //给占位符进行赋值
        query.setString("sname",students.getSname());//preparedStament赋值 从1开始， query赋值 从0开始
        query.setString("spassword",students.getSpassword());
        query.setString("snumber",students.getSnumber());
        //3、执行hql，返回list
        students = (Students) query.uniqueResult();

        HibernateUtil.close(session);
        return students;
    }

    @Override
    public List<Students> selectStudentsAll() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql ="select s from Students s";
        //2、创建query对象
        Query query= session.createQuery(hql);
        //3、执行hql，返回list
        List<Students> list = query.list();
        HibernateUtil.close(session);
        return list;
    }


    @Override
    public Students selectStudentsBysid(Integer sid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Students students = (Students) session.get(Students.class,sid);
        HibernateUtil.close(session);
        return students;
    }

    @Override
    public List<Students> selectStudentsAllBy(Students students,Integer cid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql = "select s from Students s WHERE 1=1 ";
        if(students.getSnumber()!=null && !"".equals(students.getSnumber())){
            hql= hql    +"and s.snumber =:snumber ";
        }
        if(students.getSname()!=null && !"".equals(students.getSname())){
            hql= hql   +" and s.sname=:sname";
        }
        if(cid!=null && !"".equals(cid)){
            hql= hql   +" and s.cid=:cid";
        }
        if(students.getSbirthday()!=null && !"".equals(students.getSbirthday())){
            hql= hql   +" and s.sbirthday=:sbirthday";
        }
        if(students.getSattend()!=null&&!"".equals(students.getSattend())){
            hql= hql   +" and s.sattend=:sattend";
        }

        Query query= session.createQuery(hql);
         if(students.getSnumber()!=null && !"".equals(students.getSnumber())){
            query.setString("snumber",students.getSnumber());
        }
         if(students.getSname()!=null && !"".equals(students.getSname())){
            query.setString("sname",students.getSname());
        }
       if(cid!=null && !"".equals(cid)){
            query.setInteger("cid",cid);
        }
        if(students.getSbirthday()!=null && !"".equals(students.getSbirthday())){
            query.setString("sbirthday",students.getSbirthday());
        }
        if(students.getSattend()!=null&&!"".equals(students.getSattend())){
            query.setString("sattend",students.getSattend());
        }
        List<Students> list = query.list();
        HibernateUtil.close(session);
        return list;
    }

    @Override
    public void insertsavestudent(List<Students> studentsList) {
        Session session =  HibernateUtil.getSession();
        if(session==null){
            return ;
        }
        Transaction transaction = session.beginTransaction();
        for (Students s : studentsList){
            session.saveOrUpdate(s);
        }
        transaction.commit();
        HibernateUtil.close(session);
    }

}
