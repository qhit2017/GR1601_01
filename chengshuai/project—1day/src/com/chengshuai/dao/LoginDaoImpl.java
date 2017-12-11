package com.chengshuai.dao;

import com.chengshuai.bean.users;
import com.chengshuai.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by king on 12/5/2017.
 */
public class LoginDaoImpl implements LoginDao {
    Session session = null;
    Transaction transaction = null;
    @Override
    public List<users> SelectAllbyUnameAndUpasswordDao(String uname, String upassword) {


        session=HibernateUtil.getSession();

        //拼写hql
        String hql = "select u from users u where u.uname=:uname and u.upassword=:upassword";
        //创建query对象并执行hql返回list
        Query query = session.createQuery(hql);


        query.setString("uname", uname);
        query.setString("upassword", upassword);

        List<users> list = query.list();

        transaction = session.beginTransaction();


        HibernateUtil.close(session);
        return list;
    }
}
