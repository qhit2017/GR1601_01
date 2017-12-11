package com.yanlihua.dao.impl;

import com.yanlihua.bean.Classes;
import com.yanlihua.bean.Students;
import com.yanlihua.bean.Teachers;
import com.yanlihua.dao.StudentsDao;
import com.yanlihua.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/29.
 */
public class StudentDaoImpl implements StudentsDao {
    @Override
    public List<Students> selectStudentAllInfoStudentsDao() {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select s from Students s";
        //2.创建Query对象
        Query query=session.createQuery(hql);

        //执行hql
        List<Students> studentsList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return studentsList;
    }

    @Override
        public List<Students> selectStudentInfoFiveConditionStudentDao(String snumber, String sname, String cid, String senter, String smahor) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select s from Students s where 1=1 " ;
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
        System.out.println(hql);
        //2.创建Query对象
        Query query=session.createQuery(hql);
        //3.给占位符进行赋值
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

        //执行hql
        List<Students> teachersList=query.list();
        System.out.println("selectThreeConditionTeachersDao-------"+teachersList.size());
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public void saveOrUpdateStudentInfoStudentsDao(Students students) {
        {
            Session session = HibernateUtil.getSession();
            if (session==null){
                return ;
            }
            Transaction transaction=session.beginTransaction();
            session.saveOrUpdate(students);
            transaction.commit();
            HibernateUtil.close(session);
        }
    }

    @Override
    public Students selectStudentInfoBySidStudentsDao(Integer sid) {
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
    public void deleteStudentObjectStudentDao(Students students) {
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
    public void importStudentInfoStudentDao(List<Students> studentsList) {

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

    @Override
    public List<Students> selectStudentByCid(Integer cid) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select s from Students s where s.classes.cid = :cid";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        query.setInteger("cid",cid);

        //执行hql
        List<Students> studentsList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return studentsList;
    }
}
