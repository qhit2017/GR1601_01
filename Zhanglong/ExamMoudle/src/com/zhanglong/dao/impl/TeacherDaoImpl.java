package com.zhanglong.dao.impl;

import com.zhanglong.bean.Teachers;
import com.zhanglong.dao.TeacherDao;
import com.zhanglong.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/11/26 0026.
 */
public class TeacherDaoImpl extends BaseDaoImpl implements TeacherDao {
    @Override
    public List<Teachers> queryteacherlist() {
      Session session =   HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //1.拼写hql
        String hql = "select t from Teachers t";
        //2.创建Query对象
        Query query = session.createQuery(hql);
        //执行hql
        List<Teachers> teacherlist = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teacherlist;
    }

    @Override
    public List<Teachers> queryteacherByTnumberTnameTrole(String tnumber, String tname, Integer tjob) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //1.拼写hql
        String hql = "select t from Teachers t where 1=1";
                 if(tnumber!=null&&!tnumber.equals("")){
                     hql=hql+" and t.tnumber=:tnumber ";
                  }
                 if(tname!=null&&!tname.equals("")){
                     hql=hql+" and t.tname=:tname ";
                  }
                 if(tjob!=null&&!tjob.equals("")){
                     hql=hql+" and t.tjob=:tjob";
                  }
        //2.创建Query对象
          Query query = session.createQuery(hql);
        //3.给占位符进行赋值
          if(tnumber!=null&&!tnumber.equals("")){
            query.setString("tnumber", tnumber);
        }
        if(tname!=null&&!tname.equals("")){
            query.setString("tname", tname);
        }
        if(tjob!=null&&!tjob.equals("")){
            query.setInteger("tjob",tjob);
        }

        //执行hql
        List<Teachers> teacherlist = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teacherlist;
    }

    @Override
    public void SaveOrUpdate(Teachers teachers) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return ;
        }
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(teachers);
        transaction.commit();
        HibernateUtil.close(session);
    }

    @Override
    public Teachers SelectTeachersByTid(Integer tid) {
        /*Session session= HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql = "select t from Teachers t where t.tid=:tid";
        //2.创建Query对象
        Query query = session.createQuery(hql);
        //3.给占位符进行赋值
        query.setInteger("tid",tid);

        //执行hql
        List<Teachers> teacherlist1 = query.list();

        transaction.commit();
        HibernateUtil.close(session);
        return (Teachers) teacherlist1;*/

         Session session= HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        Teachers teachers=(Teachers) session.get(Teachers.class,tid);
        transaction.commit();
        HibernateUtil.close(session);
        return teachers;
    }

    @Override
    public List<Teachers> selectTeacherLikeNumber(String number) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //1.拼写hql
        String hql = "select t from Teachers t where t.tnumber like :number";
        //2.创建Query对象
        Query query = session.createQuery(hql);
        //3.给占位符进行赋值
        query.setString("number",number);

        //执行hql
        List<Teachers> teacherlist1 = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teacherlist1;
    }

    @Override
    public void deleteTeacherById(Teachers teachers) {
        Session session= HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction transaction=session.beginTransaction();

        session.delete(teachers);

        transaction.commit();
        HibernateUtil.close(session);
        return ;
}

    @Override
    public Teachers selectTeacherBytid(Integer tid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //拼写hql语句
        //命名参数
        String hql = "select t from Teachers t Where t.tid like :tid";
        //创建query对象
        Query query = session.createQuery(hql);


        query.setInteger("tid",tid);

        //执行hql，返回list
        Teachers teachers = (Teachers) query.uniqueResult();
        transaction.commit();
        HibernateUtil.close(session);
        return teachers;
    }
}

