package com.zhanglong.dao.impl;

import com.zhanglong.bean.Students;
import com.zhanglong.bean.Teachers;
import com.zhanglong.dao.LoginDao;
import com.zhanglong.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/11/23 0023.
 */
public class LoginDaoImpl extends BaseDaoImpl implements LoginDao {

    @Override
    public List<Teachers> selectBytnameandtpassword(String tname, String tpassword) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select t from Teachers t where t.tname=:tname and t.tpassword=:tpassword";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        //3.给占位符进行赋值
        query.setString("tname",tname);
        query.setString("tpassword",tpassword);

        //执行hql
        List<Teachers> teacherlist=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teacherlist;
    }

    @Override
    public List<Students> selectBysnameandspassword(String sname, String spassword) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select s from Students s where s.sname=:sname and s.spassword=:spassword";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        //3.给占位符进行赋值
        query.setString("sname",sname);
        query.setString("spassword",spassword);

        //执行hql
        List<Students> studentlist=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return studentlist;
    }
}
