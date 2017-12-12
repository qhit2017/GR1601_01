package com.zhangerhui.dao.impl;

import com.zhangerhui.bean.Students;
import com.zhangerhui.dao.StudentDao;
import com.zhangerhui.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;


/**
 * Created by Administrator on 2017/11/23/023.
 */
public class StudentDaoImpl extends BaseDaoImpl implements StudentDao {

    Session session = null;
    Transaction transaction = null;

    @Override
    public List<Students> queryStudentsBysnameandspassword(String sname, String spassword) {
        session = HibernateUtil.getSession();

        //拼写hql
        String hql = "select s from Students s where s.sname=:sname and s.spassword=:spassword";
        //创建query对象并执行hql返回list
        Query query = session.createQuery(hql);

        query.setString("sname", sname);
        query.setString("spassword", spassword);

        List<Students> list = query.list();

        transaction = session.beginTransaction();

        transaction.commit();
        HibernateUtil.close(session);
        return list;

    }

    @Override
    public List<Students> queryStudentsallinfo() {
        session = HibernateUtil.getSession();

        //拼写hql
        String hql = "select s from Students s";
        //创建query对象并执行hql返回list
        Query query = session.createQuery(hql);

        List<Students> list = query.list();

        transaction = session.beginTransaction();

        transaction.commit();
        HibernateUtil.close(session);
        return list;
    }

    @Override
    public List<Students> queryfive(String snumber, String sname, String cid, String senter, String smahor) {
        session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        transaction = session.beginTransaction();
        //1.拼写hql
        String hql = "select s from Students s where 1=1 ";
        if (snumber != null && !snumber.equals("")) {
            hql = hql + " and s.snumber=:snumber ";
        }
        if (sname != null && !sname.equals("")) {
            hql = hql + " and s.sname=:sname ";
        }
        if (cid != null && !cid.equals("")) {
            hql = hql + " and s.classes.cid=:cid";
        }
        if (senter != null && !senter.equals("")) {
            hql = hql + " and s.senter=:senter ";
        }
        if (smahor != null && !smahor.equals("")) {
            hql = hql + " and s.smahor=:smahor";
        }
        System.out.println(hql);
        //2.创建Query对象
        Query query = session.createQuery(hql);
        //3.给占位符进行赋值
        if (snumber != null && !snumber.equals("")) {
            query.setString("snumber", snumber);
        }
        if (sname != null && !sname.equals("")) {
            query.setString("sname", sname);
        }
        if (cid != null && !cid.equals("")) {
            Integer cid1 = Integer.parseInt(cid);
            query.setInteger("cid", cid1);
        }
        if (senter != null && !senter.equals("")) {
            query.setString("senter", senter);
        }
        if (smahor != null && !smahor.equals("")) {
            query.setString("smahor", smahor);
        }

        //执行hql
        List<Students> studentsList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return studentsList;
    }

    @Override
    public void saveOrUpdateStudent(Students students) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return;
        }
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(students);
        transaction.commit();
        HibernateUtil.close(session);
    }

    @Override
    public Students queryStudentInfoBySid(Integer sid) {
        session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        transaction = session.beginTransaction();
        Students students = (Students) session.get(Students.class, sid);
        transaction.commit();
        HibernateUtil.close(session);
        return students;
    }

    @Override
    public void importStudentInfodao(List<Students> studentsList) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return;
        }
        Transaction transaction = session.beginTransaction();
        for (Students students : studentsList) {
            session.save(students);
        }
        transaction.commit();
        HibernateUtil.close(session);

    }
}
