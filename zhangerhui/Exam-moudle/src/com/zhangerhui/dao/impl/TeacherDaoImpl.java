package com.zhangerhui.dao.impl;

import com.zhangerhui.bean.Teachers;
import com.zhangerhui.dao.BaseDao;
import com.zhangerhui.dao.TeacherDao;
import com.zhangerhui.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/11/23/023.
 */
public class TeacherDaoImpl extends BaseDaoImpl implements TeacherDao {

    Session session = null;
    Transaction transaction = null;

    @Override
    //根据tname 和 tpassword 查询Teachers表，
    public List<Teachers> queryTeachersBytnameandtpassword(String tname, String tpassword) {

        session = HibernateUtil.getSession();

        //拼写hql
        String hql = "select t from Teachers t where t.tname=:tname and t.tpassword=:tpassword";
        //创建query对象并执行hql返回list
        Query query = session.createQuery(hql);

        query.setString("tname", tname);
        query.setString("tpassword", tpassword);

        List<Teachers> list = query.list();

        transaction = session.beginTransaction();

        transaction.commit();
        HibernateUtil.close(session);
        return list;
    }

    //查询Teachers表，显示所有信息
    @Override
    public List<Teachers> queryTeachersallinfo() {
        session = HibernateUtil.getSession();

        //拼写hql
        String hql = "select t from Teachers t";
        //创建query对象并执行hql返回list
        Query query = session.createQuery(hql);

        List<Teachers> list = query.list();

        transaction = session.beginTransaction();

        transaction.commit();
        HibernateUtil.close(session);
        return list;
    }

    //根据tnumber 或 tname 或 tjob 查询Teachers表，

    @Override
    public List<Teachers> queryThreeTeachers(String tnumber, String tname, Integer tjob) {
        session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        transaction = session.beginTransaction();
        //1.拼写hql
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
        //2.创建Query对象
        Query query = session.createQuery(hql);
        //3.给占位符进行赋值
        if (tnumber != null && !tnumber.equals("")) {
            query.setString("tnumber", tnumber);
        }
        if (tname != null && !tname.equals("")) {
            query.setString("tname", tname);
        }
        if (tjob != null && !tjob.equals("")) {
            query.setInteger("tjob", tjob);
        }
        //执行hql
        List<Teachers> teachersList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public void saveOrUpdateTeachersInfo(Teachers teachers) {
        session = HibernateUtil.getSession();
        if (session == null) {
            return;
        }
        transaction = session.beginTransaction();

        session.saveOrUpdate(teachers);
        transaction.commit();
        HibernateUtil.close(session);
    }


    @Override
    public List<Teachers> queryTeachersLikeTnumber(String tnumber) {
        session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        transaction = session.beginTransaction();
        //1.拼写hql
        String hql = "select t from Teachers t where t.tnumber like :tnumber";
        //2.创建Query对象
        Query query = session.createQuery(hql);
        //3.给占位符进行赋值
        query.setString("tnumber", tnumber);

        //执行hql
        List<Teachers> teachersList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public List<Teachers> queryTeachersByTnumber(String tnumber) {
        session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        transaction = session.beginTransaction();
        //1.拼写hql
        String hql = "select t from Teachers t where t.tnumber like:tnumber";
        //2.创建Query对象
        Query query = session.createQuery(hql);
        //3.给占位符进行赋值
        query.setString("tnumber", tnumber);

        //执行hql
        List<Teachers> teachersList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public Teachers queryTeachersByTid(Integer tid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        Teachers teachers = (Teachers) session.get(Teachers.class, tid);
        transaction.commit();
        HibernateUtil.close(session);
        return teachers;


    }

}
