package com.yanlihua.dao.impl;

import com.yanlihua.bean.*;
import com.yanlihua.dao.ClassesDao;
import com.yanlihua.dao.ExamDao;
import com.yanlihua.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;
import java.util.Set;

/**
 * Created by 晏利花 on 2017/12/3.
 */
public class ExamDaoImpl implements ExamDao {
    @Override
    public List<Testpaper> selectTestpaperAllInfoExamDao() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //1.拼写hql
        String hql = "select t from  Testpaper t ";
        //2.创建Query对象
        Query query = session.createQuery(hql);


        //执行hql
        List<Testpaper> testpaperList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return testpaperList;

    }

    @Override
    public List<Subject> selectSubjectAllInfoExamDao() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //1.拼写hql
        String hql = "select s from  Subject s";
        //2.创建Query对象
        Query query = session.createQuery(hql);


        //执行hql
        List<Subject> subjectList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return subjectList;

    }

    @Override
    public List<Testpaper> selectTestpaperInfoByFiveConditionExamDao(Integer suid, String ttype, String tstate) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //1.拼写hql
        String hql = "select t from  Testpaper t where 1=1";
        if (suid != null && !suid.equals("")) {
            hql = hql + " and t.subject.suid=:suid ";
        }
        if (ttype != null && !ttype.equals("")) {
            hql = hql + " and t.ttype=:ttype ";
        }
        if (tstate != null && !tstate.equals("")) {
            hql = hql + " and t.tstate=:tstate";
        }
        //2.创建Query对象
        Query query = session.createQuery(hql);
        //3.给占位符进行赋值
        if (suid != null && !suid.equals("")) {
            query.setInteger("suid", suid);
        }
        if (ttype != null && !ttype.equals("")) {
            query.setString("ttype", ttype);
        }
        if (tstate != null && !tstate.equals("")) {
            query.setString("tstate", tstate);
        }

        //执行hql
        List<Testpaper> testpaperList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return testpaperList;

    }

    @Override
    public void saveTestpaperInfoExamDao(Testpaper testpaper) {

        Session session = HibernateUtil.getSession();
        if (session == null) {
            return;
        }
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(testpaper);
        transaction.commit();
        HibernateUtil.close(session);

    }

    @Override
    public void importExamInfoExamDao(List<Questionbank> questionbankList) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return;
        }
        Transaction transaction = session.beginTransaction();
        for (Questionbank questionbank : questionbankList) {
            session.save(questionbank);
        }
        transaction.commit();
        HibernateUtil.close(session);
    }

    @Override
    public void saveinfointogradeExamDao(Grade grade,Classes classes, Testpaper testpaper) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return;
        }
        Transaction transaction = session.beginTransaction();
        System.out.println("dao========"+testpaper.getTid());

        if (testpaper.getTid() != null) {
            testpaper = (Testpaper) session.get(Testpaper.class, testpaper.getTid());
            testpaper.setTstate("考试中");
        }

        List<Students> studentsList = null;
        if(classes.getCid() !=null){
            //1.拼写hql
            String hql="select s from Students s where s.classes.cid = :cid";
            //2.创建Query对象
            Query query=session.createQuery(hql);
            query.setInteger("cid",classes.getCid());
            //执行hql
            studentsList =query.list();
        }

        for (Students students : studentsList) {
            Grade grade1 =new Grade();
            grade1.setGendtime(grade.getGendtime());
            grade1.setGanswer(grade.getGanswer());
            grade1.setGscore(grade.getGscore());
            grade1.setGbegintime(grade.getGbegintime());
            //要循环建立关系
            //在这里可以说成绩是一样的，但是学生不同
            //这样就对应了一个学生一个成绩
            //循环保存
            grade1.setStudents(students);
            grade1.setTestpaper(testpaper);
            session.saveOrUpdate(grade1);

        }

        transaction.commit();

        HibernateUtil.close(session);

        return;

    }

    @Override
    public void updateTestpaperExamDao(Testpaper testpaper,String cname) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction transaction=session.beginTransaction();
        testpaper.setCname(cname);
        testpaper.setTstate("考试中");
        session.saveOrUpdate(testpaper);
        transaction.commit();
        HibernateUtil.close(session);
    }

    @Override
    public Testpaper updateTestpaperByTidExamDao(Integer tid) {
        Session session= HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        Testpaper testpaper=(Testpaper) session.get(Testpaper.class,tid);
        transaction.commit();
        HibernateUtil.close(session);
        return testpaper;

    }

    @Override
    public Grade selectGradeendInfoExamDao() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //1.拼写hql
        String hql = "select g from  Grade g";
        //2.创建Query对象
        Query query = session.createQuery(hql);


        //执行hql
        List<Grade> gradeList = query.list();
        Integer size=gradeList.size();
        //System.out.println(size);
        Grade grade=gradeList.get(size-1);
        transaction.commit();
        HibernateUtil.close(session);
        return grade;

    }

    @Override
    public void updateGradeExamDao(Grade grade) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction transaction=session.beginTransaction();
        session.saveOrUpdate(grade);
        transaction.commit();
        HibernateUtil.close(session);
    }

    @Override
    public void updatetestpapertstateExamDao(Testpaper testpaper,Integer tid) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction transaction=session.beginTransaction();
        testpaper.setTstate("考试结束");
        session.saveOrUpdate(testpaper);
        transaction.commit();
        HibernateUtil.close(session);
    }
}
