package com.guolonglong.dao.impl;

import com.guolonglong.bean.Students;
import com.guolonglong.bean.Teachers;
import com.guolonglong.dao.StudentsDao;
import com.guolonglong.dao.TeachersDao;
import com.guolonglong.dao.base.PublicDaoImpl;
import com.guolonglong.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by lenovo on 2017/11/23.
 */
public class StudentsDaoImpl extends PublicDaoImpl implements StudentsDao {
    @Override
    public List<Students> selectStudents(Students students) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction ts = session.beginTransaction();

        String hql="select t from Students t where s.sname=? and s.spassword=?";
        Query query=session.createQuery(hql);
        query.setString(0,students.getSname());
        query.setString(1,students.getSpassword());

        List<Students> studentsList=query.list();

        ts.commit();
        HibernateUtil.close(session);
        return studentsList;
    }

    @Override
    public List<Students> selectStudentsAll() {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        String hql="select t from Students t";
        Query query=session.createQuery(hql);

        List<Students> studentsList=query.list();
        HibernateUtil.close(session);
        return studentsList;
    }

    @Override
    public List<Students> selectStudentsByNumberOrNameOrCnameOrCdirection(String snumber, String sname, String cbegin, String cname, String cdirectiont) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        String hql="select s from Students s where 1=1";
        if (sname!=null && !sname.equals("")) {
            hql= hql + " and s.sname =:sname";
        }
        if (snumber!=null && !snumber.equals("")) {
            hql = hql + " and s.snumber =:snumber";
        }
        if (cbegin!=null && !cbegin.equals("")) {
            hql= hql + " and c.cbegin =:cbegin";
        }
        if (cname!=null && !cname.equals("")) {
            hql= hql + " and c.cname =:cname";
        }
        if (cdirectiont!=null && !cdirectiont.equals("")) {
            hql= hql + " and c.cdirectiont =:cdirectiont";
        }

        Query query=session.createQuery(hql);

        if (sname!=null && !sname.equals("")) {
            query.setString("sname",sname);
        }
        if (snumber!=null && !snumber.equals("")) {
            query.setString("snumber",snumber);
        }
        if (cbegin!=null && !cbegin.equals("")) {
            query.setString("cbegin",cbegin);
        }
        if (cname!=null && !cname.equals("")) {
            query.setString("cname",cname);
        }
        if (cdirectiont!=null && !cdirectiont.equals("")) {
            query.setString("cdirectiont",cdirectiont);
        }

        List<Students> classesList=query.list();
        HibernateUtil.close(session);
        return classesList;
    }

    @Override
    public Students selectStudentById(Integer sid) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Students students = (Students) session.get(Students.class, sid);

        HibernateUtil.close(session);
        return students;
    }

    @Override
    public void studentsImprot(List<Students> studentsList) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction ts = session.beginTransaction();
        for (Students students:studentsList){
            session.saveOrUpdate(students);
        }
        ts.commit();
        session.close();
        HibernateUtil.close(session);

    }
}
