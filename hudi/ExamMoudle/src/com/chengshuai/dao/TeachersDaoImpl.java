package com.chengshuai.dao;

import com.chengshuai.bean.Teachers;
import com.chengshuai.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/11/23.
 */
public class TeachersDaoImpl extends  BaseDaoImpl implements TeachersDao {
    @Override
    public Teachers select(Teachers teachers) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        String hql = "select t from Teachers t where t.tname=:tname";
        Query query = session.createQuery(hql);
        query.setString("tname",teachers.getTname());
        teachers = (Teachers) query.uniqueResult();
        return teachers;
    }

    @Override
    public List<Teachers> selectTeacherByNameAndPwd(String name, String pwd) {

        Session session = HibernateUtil.getSession();
        if(session==null){
            return null;
        }

        Transaction transaction = session.beginTransaction();

        String hql = "select t from Teachers t where t.tname=:tname and t.tpassword=:tpassword";
          Query query = session.createQuery(hql);

        query.setString("tname",name);
        query.setString("tpassword",pwd);

        List<Teachers> teachersList= query.list();

        transaction.commit();

        HibernateUtil.close(session);

        return teachersList;
    }

    @Override
    public List<Teachers> selectAllTeacher() {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return null;
        }

        Transaction transaction = session.beginTransaction();

        String hql = "select t from Teachers t";


        Query query = session.createQuery(hql);

        List<Teachers> teachersList= query.list();

        transaction.commit();

        HibernateUtil.close(session);

        return teachersList;
    }

    @Override
    public List<Teachers> selectTeacherByTnumberOrTnameOrTjob(String number, String name, Integer job) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return null;
        }

        Transaction transaction = session.beginTransaction();

        String hql = "select t from Teachers t where 1=1";

        if(number!=null && !number.equals("")){
            hql = hql +" and t.tnumber = :number";
        }

        if(name!=null && !name.equals("")) {
            hql = hql +" and t.tname=:name ";
        }

        if(job!=null && !job.equals("")){
            hql = hql +" and t.tjob = :job";
        }

        Query query = session.createQuery(hql);

            if(number!=null && !number.equals("")){
                query.setString("number",number);
            }

            if(name!=null && !name.equals("")) {
                query.setString("name",name);
            }

            if(job!=null && !job.equals("")){
            query.setInteger("job",job);
        }


        List<Teachers> teachersList= query.list();

        transaction.commit();

        HibernateUtil.close(session);

        return teachersList;
    }

    @Override
    public List<Teachers> selectTeacherLikeTnumber(String number) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return null;
        }

        Transaction transaction = session.beginTransaction();

        String hql = "select t from Teachers t where t.tnumber like :number";
        Query query = session.createQuery(hql);


        query.setString("number",number);

        List<Teachers> teachersList= query.list();



        transaction.commit();

        HibernateUtil.close(session);

        return teachersList;
    }

    @Override
    public List<Teachers> selectTeacherByTjob(Integer tjob) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return null;
        }

        Transaction transaction = session.beginTransaction();

        String hql = "select t from Teachers t where t.tjob = :tjob";
        Query query = session.createQuery(hql);


        query.setInteger("tjob",tjob);

        List<Teachers> teachersList= query.list();



        transaction.commit();

        HibernateUtil.close(session);

        return teachersList;
    }

    @Override
    public void insert(List<Teachers> teachersList) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return ;
        }

        Transaction transaction = session.beginTransaction();

        for(Teachers t:teachersList){

            session.saveOrUpdate(t);

        }
        transaction.commit();

        session.close();


    }
}
