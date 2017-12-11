package com.guolonglong.dao.impl;

import com.guolonglong.bean.Teachers;
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
public class TeachersDaoImpl extends PublicDaoImpl implements TeachersDao {
    @Override
    public List<Teachers> selectTeachers(String tname,String tpassword) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction ts = session.beginTransaction();

        String hql="select t from Teachers t where t.tname=:tname and t.tpassword=:tpassword";

        Query query=session.createQuery(hql);
        query.setString("tname",tname);
        query.setString("tpassword",tpassword);

        List<Teachers> teachersList=query.list();

        ts.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public List<Teachers> selectTeachersAll() {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction ts = session.beginTransaction();

        String hql="select t from Teachers t";

        Query query=session.createQuery(hql);

        List<Teachers> teachersList=query.list();

        ts.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public List<Teachers> selectTeacherBynumberOrnameOrjob(String tnumber, String tname, Integer tjob) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction ts = session.beginTransaction();

        String hql="select t from Teachers t where 1=1";
        if (tnumber!=null && !tnumber.equals("")){
            hql=hql+" and t.tnumber =:tnumber";
        }
        if (tname!=null && !tname.equals("")){
            hql=hql+" and t.tname =:tname";
        }
        if (tjob!=null && !tjob.equals("")){
            hql=hql+" and t.tjob =:tjob";
        }
        System.out.println(hql);
        Query query=session.createQuery(hql);
        if (tnumber!=null && !tnumber.equals("")){
            query.setString("tnumber",tnumber);
        }
        if (tname!=null && !tname.equals("")){
            query.setString("tname",tname);
        }
        if (tjob!=null && !tjob.equals("")){
            query.setInteger("tjob",tjob);
        }

        List<Teachers> teachersList=query.list();

        ts.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public List<Teachers> selectTeacherLikeBynumber(String tnumber) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction ts = session.beginTransaction();

        String hql="select t from Teachers t where t.tnumber like :tnumber";

        Query query=session.createQuery(hql);
        query.setString("tnumber",tnumber);
        List<Teachers> teachersList=query.list();

        ts.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public List<Teachers> selectTeachersByNumber(String tnumber) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction ts = session.beginTransaction();
        String hql="select t from Teachers t where t.tnumber = :tnumber";
        System.out.println(hql);
        Query query = session.createQuery(hql);
        query.setString("tnumber",tnumber);
        List<Teachers> teachersList = query.list();

        ts.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public Teachers selectTeachersById(Integer tid) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction ts = session.beginTransaction();
        Teachers teachers = (Teachers) session.get(Teachers.class,tid);

        ts.commit();
        HibernateUtil.close(session);
        return teachers;
    }


}

