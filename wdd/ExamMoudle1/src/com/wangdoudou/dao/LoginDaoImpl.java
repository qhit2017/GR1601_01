package com.wangdoudou.dao;

import com.wangdoudou.bean.Students;
import com.wangdoudou.bean.Teachers;
import com.wangdoudou.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 王豆豆 on 2017/11/23.
 */
public class LoginDaoImpl implements LoginDao{
    //教师查询
    @Override
    public List<Teachers> selectByUsers(String tname, String tpassword) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        //拼写HQL
        String hql="select t from Teachers t where t.tname=:tname and t.tpassword=:tpassword";
        System.out.println(hql);
        //创建query对象
        Query query= session.createQuery(hql);
        System.out.println(query);
        //给占位符进行赋值
        query.setString("tname",tname);
        query.setString("tpassword",tpassword);

        //执行sql 返回list
        List<Teachers>teachersList=query.list();
        for (Teachers t: teachersList){
        System.out.println(t.getTname()+""+t.getTpassword());
}
        tx.commit();
        HibernateUtil.close(session);
        return teachersList;
    }
     //学生查询
    @Override
    public List<Students> selectBy(String sname, String spassword) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction tx = session.beginTransaction();
        //拼写HQL
        String hql="select s from Students s where s.sname=:sname and s.spassword=:spassword";
        //创建query对象
        Query query= session.createQuery(hql);
        //给占位符进行赋值
        query.setString("sname",sname);
        query.setString("spassword",spassword);

        //执行sql 返回list
        List<Students>studentsList=query.list();

        tx.commit();
        HibernateUtil.close(session);
        return studentsList;
    }
}
