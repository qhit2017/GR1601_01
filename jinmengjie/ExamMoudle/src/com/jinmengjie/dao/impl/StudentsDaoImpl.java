package com.jinmengjie.dao.impl;

import com.jinmengjie.bean.Classes;
import com.jinmengjie.bean.Students;

import com.jinmengjie.dao.StudentDao;
import com.jinmengjie.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;


/**
 * Created by 金梦杰 on 2017/11/23/023.
 */
public class StudentsDaoImpl implements StudentDao{
    @Override
    public Students selectstudents(Students students) {

        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //拼写hql
        String hql = "select  s from Students s where s.sname=:sname and s.spassword=:spassword";

        //创建query对象
        Query query = session.createQuery(hql);
        //通过students类找到getsname（面向的是整个类，因为sname是在students这个类里）
        query.setString("sname",students.getSname());
        query.setString("spassword",students.getSpassword());
        students = (Students) query.uniqueResult();
        //提交事务
        transaction.commit();

        //关闭session
        HibernateUtil.close(session);

        return students;

    }

    @Override
    public List<Students> selectAllStudentInfo() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //拼写hql语句
        //命名参数
        String hql = "select s from Students s";
        //创建query对象
        Query query = session.createQuery(hql);

        //执行hql，返回list
        List<Students> studentsList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return studentsList;
    }

    @Override
    public List<Students> selectSutdentInfoBysnumberOrsnameOrsenterOrcid(String snumber, String sname, Integer cid, String senter, String studydirection) {
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
        if(cid!=null && !cid.equals("")){
            hql=hql+" and s.cid=:cid ";
        }
        if(senter!=null && !senter.equals("")){
            hql=hql+" and s.senter=:senter ";
        }
        if(studydirection!=null && !studydirection.equals("")) {
            hql=hql  +" and s.studydirection=:studydirection ";
        }

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
            query.setInteger("cid",cid);
        }
        if(senter!=null && !senter.equals("")){
            query.setString("senter",senter);
        }
        if(studydirection!=null && !studydirection.equals("")) {
            query.setString("studydirection",studydirection);
        }


        //执行hql，返回list
        List<Students> studentsList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return studentsList;
    }

    //根据班级ID做精确查询
    @Override
    public Students selectStudentInfoBySid(Integer sid) {

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
    public void saveOrupdateStudentInfo(Students students) {
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
    public void deleteStudentObject(Students students) {
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

    //学生界面模板上传
    @Override
    public void insert(List<Students> studentsList) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return ;
        }

        Transaction transaction = session.beginTransaction();

        for(Students s:studentsList){

            session.saveOrUpdate(s);

        }
        transaction.commit();

        session.close();

    }
}
