package com.wangmengyuan.Dao;

import com.wangmengyuan.Util.HibernateUtil;
import com.wangmengyuan.bean.Students;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/12/7.
 */
public class StudentDaoImpl implements StudentDao {
    //显示学生界面
    @Override
    public List<Students> selectAllStudentsinfo() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        //拼写HQL
        String hql="select s from Students s";
        //创建query对象
        Query query= session.createQuery(hql);
        //执行sql 返回list
        List<Students>studentsList=query.list();

        tx.commit();
        HibernateUtil.close(session);
        return studentsList;
    }
   //多条件查询
    @Override
    public List<Students> selectsnumber(String snumber, String sname) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        //拼写HQL
        String hql = "select s from Students s where 1=1";
        if (snumber !=null&&!snumber.equals("")){
            hql=hql+" and s.snumber=:snumber";
        }
        if (sname!=null&&!sname.equals("")){
            hql=hql+" and s.sname=:sname ";
        }

//创建query对象
        Query query1 = session.createQuery(hql);
        if (snumber !=null&&!snumber.equals("")){
            query1.setString("snumber",snumber);
        }
        if (sname!=null&&!sname.equals("")){
            query1.setString("sname",sname);
        }

       List<Students> studentsList = query1.list();
        //提交事务
        tx.commit();
        //关闭session
        HibernateUtil.close(session);
        return studentsList;
    }
}
