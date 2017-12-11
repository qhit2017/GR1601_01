package com.jiang.dao;
import com.jiang.bean.Teachers;
import com.jiang.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by dell on 2017/11/26.
 */
public class InsertTeachersDaoImpl extends BaseDaoImpl implements InsertTeachersDao {
    @Override
    /*查询tnumber*/
    public List<Teachers> selectTeachersInfo(String tnumber) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction ts = session.beginTransaction();
        /*拼写sql文*/
        String hql = "select t from Teachers t where t.tnumber like :tnumber";
        /*创建query对象*/
        Query query = session.createQuery(hql);
        /*赋值*/
        query.setString("tnumber",tnumber);
        /*执行hql*/
        List<Teachers> list = query.list();
        ts.commit();
        HibernateUtil.close(session);
        return list;
    }

    @Override
    /*查询teachers中的tid是否出现*/
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

}
