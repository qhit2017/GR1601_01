package com.cj.Dao.Impl;

import com.cj.Bean.Students;
import com.cj.Bean.Teachers;
import com.cj.util.HibernateUtil;
import com.cj.Dao.StudentsDao;

import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by cj on 2017/11/23.
 */
public class StudentsDaoImpl implements StudentsDao {
    @Override
    public List<Students> selectStudent(String sname, String spassword) {
        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //拼写HOL
        String hql="select s from Students s where s.sname=? and s.spassword=?";

        //执行HQL
        Query query= session.createQuery(hql);

        query.setString(0,sname);
        query.setString(1,spassword);

        List<Students> list=query.list();
        for(Students s:list){
            System.out.println(s.getSname()+""+s.getSpassword());
        }

        HibernateUtil.close(session);
        return list;
    }

    @Override
    public List<Students> selectStudentall() {
        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //拼写HOLException
        String hql = "select s from Students s";

        //执行HQL
        Query query = session.createQuery(hql);

        List<Students> StudentsList = query.list();

        HibernateUtil.close(session);
        return StudentsList;
    }
}
