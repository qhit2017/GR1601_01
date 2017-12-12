package com.cj.Dao.Impl;

import com.cj.Bean.Teachers;
import com.cj.util.HibernateUtil;
import com.cj.Dao.TeachersDao;

import org.apache.struts2.components.If;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.hql.ast.HqlASTFactory;

import java.util.List;

/**
 * Created by cj on 2017/11/23.
 */


public class TeachersDaoImpl extends BaseDaoImpl implements TeachersDao {
    //老师登陆
    @Override
    public List<Teachers> selectTeacher(String tname, String tpassword) {

        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //拼写HOLException
        String hql = "select t from Teachers t where t.tname=? and t.tpassword=?";

        //执行HQL
        Query query = session.createQuery(hql);
        query.setString(0, tname);
        query.setString(1, tpassword);

        List<Teachers> list = query.list();
        HibernateUtil.close(session);
        return list;
    }

    //查询老师所有信息
    @Override
    public List<Teachers> selectTeacherAll() {
        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //拼写HOLException
        String hql = "select t from Teachers t";

        //执行HQL
        Query query = session.createQuery(hql);

        List<Teachers> teachersList = query.list();

        HibernateUtil.close(session);
        return teachersList;
    }

    //账号信息   根据年月日获取当日第几个   //查询账号是今天的第几个
    @Override
    public List<Teachers> selecttLikeNumber(String tnumber) {
        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //拼写HQL
        String hql = "select t from Teachers t  where t.tnumber like :tnumber";

        //执行HQL

        Query query = session.createQuery(hql);
        query.setString("tnumber", tnumber);


        List<Teachers> list = query.list();

        HibernateUtil.close(session);
        return list;

    }

    //根据ID查询
    @Override
    public Teachers selectMyTid(Integer tid) {
        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }

        Teachers teachers = (Teachers) session.get(Teachers.class,tid);
        HibernateUtil.close(session);
        return teachers;

    }

    //增加老师
    @Override
    public boolean insertteacherAll(Teachers teachers) {
        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return false;
        }
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(teachers);
        tx.commit();
        HibernateUtil.close(session);
        return true;

    }
/*根据账号查询ID*/
    @Override
    public List<Teachers> selectTnumberMyId(String tnumber) {
        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //拼写HQL
        String hql = "select t from Teachers t  where t.tnumber=:tnumber";

        //执行HQL

        Query query = session.createQuery(hql);
        query.setString("tnumber", tnumber);


        List<Teachers> list = query.list();

        HibernateUtil.close(session);
        return list;


    }



    //根据  账号 姓名 角色查询
    @Override
    public List<Teachers> selectTeacherMyTnumberOrtnameOrTjob(String tnumber, String tname, Integer tjob) {

        //获取session
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;

        }

        //拼写HQL
        String hql = "select t from Teachers t where 1=1";
        if (tnumber != null && !tnumber.equals("")) {
            hql = hql + " and t.tnumber=:tnumber";
        }

        if (tname != null && !tname.equals("")) {
            hql = hql + " and t.tname=:tname";
        }
        if (tjob != null && !tjob.equals("")) {
            hql = hql + " and t.tjob =:tjob";
        }


        //执行query
        Query query = session.createQuery(hql);


        if (tnumber != null && !tnumber.equals("")) {

            query.setString("tnumber", tnumber);
        }
        if (tname != null && !tname.equals("")) {

            query.setString("tname", tname);
        }
        if (tjob != null && !tjob.equals("")) {

            query.setInteger("tjob", tjob);
        }

        List<Teachers> list = query.list();


        HibernateUtil.close(session);
        return list;

    }


}
