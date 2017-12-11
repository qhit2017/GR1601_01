package com.wangyinghao.dao.impl;




import com.wangyinghao.bean.Students;
import com.wangyinghao.dao.StudentDao;
import com.wangyinghao.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;


/**
 * Created by 王英豪 on 2017/11/17.
 */
public class StudentDaoImpl extends BaseDaoImpl implements StudentDao {

    @Override
    public Students selectstudents(Students students) {

        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //拼写hql
        String hql = "select  s from Students s where s.sname=:sname and s.spassword=:spassword";

        //创建query对象
        Query query = session.createQuery(hql);
        //通过students类找到getsname（面向的是整个类，因为sname是在students这个类里）
        query.setString("sname",students.getSname());
        query.setString("spassword",students.getSpassword());
        students = (Students) query.uniqueResult();
        //提交事务
        transaction.commit();

        //关闭session
        HibernateUtil.close(session);

        return students;

    }

}
