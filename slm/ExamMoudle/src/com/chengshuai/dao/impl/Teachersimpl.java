package com.chengshuai.dao.impl;

import com.chengshuai.bean.Teachers;
import com.chengshuai.dao.Teachersdao;
import com.chengshuai.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by slm on 2017/11/23.
 */
public class Teachersimpl implements Teachersdao {
    @Override
    public List<Teachers> selectByTnameandTpwd(Teachers teachers) {
        /*登录教师角色   根据用户名 密码查询*/
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        /*拼写hql*/
        String hql = "select t from Teachers t where  tname =:tname and tpassword=:tpassword  and trole=:trole ";
        Query query = session.createQuery(hql);
        query.setString("tname", teachers.getTname());
        query.setString("tpassword", teachers.getTpassword());
        query.setInteger("trole", teachers.getTrole());
        List<Teachers> teachersList = query.list();
        transaction.commit();
        ;
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public List<Teachers> selectTeachersALL() {
        /*查询所有教师信息*/
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        /*拼写hql*/
        String hql = "select t from Teachers t  ";

        Query query = session.createQuery(hql);
        List<Teachers> teachersList = query.list();
        transaction.commit();
        ;
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public Teachers selectByid(Teachers teachers) {
        /*根据ID查询数据库中的信息*/
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        System.out.println(teachers.getTid());
        Teachers teachers1 = (Teachers) session.get(Teachers.class, teachers.getTid());
        transaction.commit();
        HibernateUtil.close(session);
        return teachers1;
    }

    @Override
    public List<Teachers> selectBytnumberOrtnameOrtjob(Teachers teachers) {
        /*根据条件查询教师表中的信息*/
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();

        String hql = "select t from Teachers t where 1=1";
        if (teachers.getTnumber() != null && !teachers.getTnumber().equals("")) {
            hql = hql + " and tnumber = :tnumber";
        }
        if (teachers.getTname() != null && !teachers.getTname().equals("")) {
            hql = hql + " and tname = :tname ";
        }
        if (teachers.getTjob() != null && !teachers.getTjob().equals("")) {
            hql = hql + " and tjob = :tjob ";
        }
        Query query = session.createQuery(hql);
        if (teachers.getTnumber() != null && !teachers.getTnumber().equals("")) {
            query.setString("tnumber", teachers.getTnumber());
        }
        if (teachers.getTname() != null && !teachers.getTname().equals("")) {
            query.setString("tname", teachers.getTname());
        }
        if (teachers.getTjob() != null && !teachers.getTjob().equals("")) {
            query.setInteger("tjob", teachers.getTjob());
        }

        List<Teachers> teachersList = query.list();
        transaction.commit();
        HibernateUtil.close(session);

        return teachersList;
    }

    @Override
    public void saveTeachers(Teachers teachers) {
        /*添加教师信息*/
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return;
        }
        Transaction transaction = session.beginTransaction();
        session.save(teachers);
        transaction.commit();
        HibernateUtil.close(session);
    }

    @Override
    public List<Teachers> selectLiketnumber(String tnumber) {
        /*模糊查询编号信息*/
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        /*拼写hql*/
        String hql = "select t from Teachers t where  tnumber like  :tnumber";

        Query query = session.createQuery(hql);
        query.setString("tnumber", tnumber);
        List<Teachers> teachersList = query.list();
        transaction.commit();
        ;
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public void updateTeachers(Teachers teachers) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return;
        }
        Transaction transaction = session.beginTransaction();
        session.update(teachers);
        transaction.commit();
        HibernateUtil.close(session);
    }

    @Override
    public void deleteTeachersByid(Teachers teachers) {
        /*删除信息 */
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return;
        }
        Transaction transaction = session.beginTransaction();
        session.delete(teachers);
        transaction.commit();
        HibernateUtil.close(session);

    }
}
