package com.wangmengyuan.Dao;

import com.wangmengyuan.Util.HibernateUtil;
import com.wangmengyuan.bean.Teachers;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/12/4.
 */
public class teacherDaoImpl implements teacherDao {
    @Override
    public List<Teachers> selectAll() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction transaction = session.beginTransaction();

        //拼写hql
        String hql="select t from Teachers t";
        //创建query对象
        Query query= session.createQuery(hql);

        List<Teachers> teachersList=query.list();

        //提交事务
        transaction.commit();
        //关闭session
        HibernateUtil.close(session);
        return teachersList;
    }
    //添加教师
    @Override
    public void insertTeachers(Teachers teachers) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return ;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        Teachers teachers1 = (Teachers) session.get(Teachers.class, teachers.getTid());
        session.save(teachers);
        tx.commit();
        HibernateUtil.close(session);
    }

    //根据条件查询
    @Override
    public List<Teachers> selecttnumberOrtnameOrtjob(String tnumber, String tname, String tjob) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction transaction = session.beginTransaction();
        //拼写hql
        String hql="select t from Teachers t where 1=1";
        if (tnumber !=null&&!tnumber.equals("")){
            hql=hql+"and t.tnumber=:tnumber";
        }
        if (tname!=null&&!tname.equals("")){
            hql=hql+" and t.tname ";
        }
        if (tjob!=null&&!tjob.equals("")){
            hql=hql+"and t.tjob=:tjob";
        }

        //创建query对象
        Query query1 = session.createQuery(hql);
        if (tnumber !=null&&!tnumber.equals("")){
            query1.setString("tnumber",tnumber);
        }
        if (tname!=null&&!tname.equals("")){
            query1.setString("tname",tname);
        }
        if (tjob!=null&&!tjob.equals("")){
            Integer tjob1=Integer.parseInt(tjob);
            query1.setInteger("tjob",tjob1);
        }

        List<Teachers> teachersList=query1.list();

        //提交事务
        transaction.commit();
        //关闭session
        HibernateUtil.close(session);
        return teachersList;
    }
    //根据账号模糊查询
    @Override
    public List<Teachers> selectTeachersLikeTnumber(String tnumber) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        //拼写HQL
        String hql="select t from Teachers t where t.tnumber like:tnumber ";
        //创建query对象
        Query query= session.createQuery(hql);
        //给占位符进行赋值
        query.setString("tnumber",tnumber);
        //执行sql 返回list
        List<Teachers>teachersList=query.list();

        tx.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    //根据id查询信息
    @Override
    public Teachers selectByTid(Teachers teachers) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        Teachers teachers1 = (Teachers) session.get(Teachers.class, teachers.getTid());
        session.save(teachers);
        tx.commit();
        HibernateUtil.close(session);
        return teachers1;
    }
    //修改密码
    @Override
    public void updateTeachersByTid(Teachers teachers) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return ;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        session.update(teachers);
        tx.commit();
        HibernateUtil.close(session);
    }
    //删除
    @Override
    public void deleteTeachersByTid(Teachers teachers) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return ;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        session.delete(teachers);
        tx.commit();
        HibernateUtil.close(session);
    }

    @Override
    public List<Teachers> selecttjob(String tjob) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
       String hql ="select t from Teachers t where t.tjob like:tjob ";
        //创建query对象
        Query query= session.createQuery(hql);
        //给占位符进行赋值
        query.setString("tjob",tjob);
        //执行sql 返回list
        List<Teachers>teachersList=query.list();

        tx.commit();
        HibernateUtil.close(session);
        return teachersList;
    }
}
