package com.jiang.dao;

import com.jiang.bean.Students;
import com.jiang.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by dell on 2017/11/23.
 */
public class StudentsDaoImpl extends BaseDaoImpl implements StudentsDao {
    @Override
    /*根据名字密码查询！*/
    public List<Students> selectStudentsInfoBySnameAndSpassword(String sname, String spassword) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction ts = session.beginTransaction();
        /*拼写sql文*/
        String hql = "select s from Students s where s.sname=? and s.spassword=?";
        /*创建query对象*/
        Query query = session.createQuery(hql);
        /*赋值*/
        query.setString(0,sname);
        query.setString(1,spassword);
        /*执行hql*/
        List<Students> list = query.list();
        ts.commit();
        HibernateUtil.close(session);
        return list;
    }

}
