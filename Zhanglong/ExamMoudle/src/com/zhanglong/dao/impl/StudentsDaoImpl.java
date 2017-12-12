package com.zhanglong.dao.impl;

import com.zhanglong.bean.Students;
import com.zhanglong.dao.StudentsDao;
import com.zhanglong.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/12/2 0002.
 */
public class StudentsDaoImpl extends BaseDaoImpl implements StudentsDao {

    @Override
    public List<Students> selectAllInfo() {
        Session session= HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        String hql="select s from Students s";

        Query query=session.createQuery(hql);
        List<Students>studentsList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return studentsList;
    }

    @Override
    public List<Students> selectchaxunfive(String snumber, String sname, String cid, String senter, String smahor) {
        Session session= HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        String hql="select s from Students s where 1=1 ";
        if(snumber!=null && !snumber.equals("")){
            hql=hql+" and s.snumber=:snumber ";
        }
        if(sname!=null && !sname.equals("")) {
            hql=hql  +" and s.sname=:sname ";
        }
        if(cid!=null && !cid.equals("")) {
            hql=hql+" and s.classes.cid=:cid";
        }
        if(senter!=null && !senter.equals("")) {
            hql=hql  +" and s.senter=:senter ";
        }
        if(smahor!=null && !smahor.equals("")) {
            hql=hql+" and s.smahor=:smahor";
        }
        Query query=session.createQuery(hql);
        if(snumber!=null && !snumber.equals("")){
            query.setString("snumber",snumber);
        }
        if(sname!=null && !sname.equals("")) {
            query.setString("sname",sname);
        }
        if(cid!=null && !cid.equals("")) {
            Integer cid1=Integer.parseInt(cid);
            query.setInteger("cid",cid1);
        }
        if(senter!=null && !senter.equals("")) {
            query.setString("senter",senter);
        }
        if(smahor!=null && !smahor.equals("")) {
            query.setString("smahor",smahor);
        }
        List<Students>studentsList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return studentsList;


    }
     //添加修改信息
    @Override
    public void SaveoruodateStudent(Students students) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction transaction=session.beginTransaction();

        session.saveOrUpdate(students);
        transaction.commit();
        HibernateUtil.close(session);
    }

    @Override
    public Students selectStudentsBysid(Integer sid) {
        Session session= HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        Students students =(Students) session.get(Students.class,sid);
        transaction.commit();
        HibernateUtil.close(session);
        return students;
    }

    @Override
    public void deleteStudent(Students students) {
        Session session= HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction transaction=session.beginTransaction();
        session.delete(students);
        transaction.commit();
        HibernateUtil.close(session);
        return ;
    }

    @Override
    public void daoruxuesheng(List<Students> studentsList) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction transaction=session.beginTransaction();
        for (Students students:studentsList){
            session.save(students);
        }
        transaction.commit();
        HibernateUtil.close(session);

    }
}
