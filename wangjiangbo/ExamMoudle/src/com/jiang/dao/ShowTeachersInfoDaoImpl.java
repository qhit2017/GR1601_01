package com.jiang.dao;

import com.jiang.bean.Teachers;
import com.jiang.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * 显示学生信息
 * Created by dell on 2017/11/26.
 */
public class ShowTeachersInfoDaoImpl implements ShowTeachersInfoDao {
    @Override
    public List<Teachers> ShowTeachersInfo() {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction ts = session.beginTransaction();
        /*拼写hql语言*/
        String hql = "select t  from Teachers t";
        Query query = session.createQuery(hql);
        List<Teachers> list = query.list();
        ts.commit();
        HibernateUtil.close(session);
        return list;
    }

    @Override
    public Teachers queryTidAppear(Integer tid) {
        /*获取session*/
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        /*开启事物*/
        Transaction ts = session.beginTransaction();
        Teachers teachers = (Teachers) session.get(Teachers.class, tid);
        ts.commit();
        HibernateUtil.close(session);
        return teachers;

    }

    @Override
    public Teachers queryByTid(Integer tid) {
        Session session=HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction  transaction=session.beginTransaction();
        Teachers teachers= (Teachers) session.get(Teachers.class,tid);
        transaction.commit();
        HibernateUtil.close(session);
        return  teachers;
    }

}
