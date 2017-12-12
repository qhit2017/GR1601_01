package com.jiang.dao;

import com.jiang.bean.Students;
import com.jiang.bean.Teachers;
import com.jiang.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by dell on 2017/11/23.
 */
public class TeachersDaoImpl implements TeachersDao {
    @Override
    public List<Teachers> selectTeachersInfoByTnameAndTpassword(String tname, String tpassword) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction ts = session.beginTransaction();
        /*拼写sql文*/
        String hql = "select t from Teachers t where t.tname=:tname and t.tpassword=:tpassword";
        /*创建query对象*/
        Query query = session.createQuery(hql);
        /*赋值*/
        query.setString("tname",tname);
        query.setString("tpassword",tpassword);
        /*执行hql*/
        List<Teachers> list = query.list();
        ts.commit();
        HibernateUtil.close(session);
        return list;
    }
}
