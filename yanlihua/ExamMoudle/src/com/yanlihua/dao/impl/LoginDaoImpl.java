package com.yanlihua.dao.impl;

import com.yanlihua.bean.Students;
import com.yanlihua.bean.Teachers;
import com.yanlihua.dao.LoginDao;
import com.yanlihua.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/23.
 */
public class LoginDaoImpl implements LoginDao {
    @Override
    public List<Teachers> selectTeachersLoginInfoBynamepwdroleLoginDao(String tnumber, String tpassword) {
            Session session= HibernateUtil.getSession();
            if(session==null){
                return null;
            }
            Transaction transaction=session.beginTransaction();
            //1.拼写hql
            String hql="select t from Teachers t where (t.tnumber=:tnumber or t.tname=:tnumber) and t.tpassword=:tpassword";
            //2.创建Query对象
            Query query=session.createQuery(hql);
            //3.给占位符进行赋值
            query.setString("tnumber",tnumber);
            query.setString("tpassword",tpassword);

            //执行hql
            List<Teachers> teachersList=query.list();
            transaction.commit();
            session.close();
            return teachersList;

    }

    @Override
    public List<Students> selectStudentsLoginInfoBynamepwdroleLoginDao(String snumber, String spassword) {
            Session session= HibernateUtil.getSession();
            if(session==null){
                return null;
            }
            Transaction transaction=session.beginTransaction();
            //1.拼写hql
            String hql="select s from Students s where (s.snumber=:snumber or s.sname=:snumber)  and s.spassword=:spassword";
            //2.创建Query对象
            Query query=session.createQuery(hql);
            //3.给占位符进行赋值
            query.setString("snumber",snumber);
            query.setString("spassword",spassword);

            //执行hql
            List<Students> studentsList=query.list();
            transaction.commit();
            session.close();
            return studentsList;
    }
}
