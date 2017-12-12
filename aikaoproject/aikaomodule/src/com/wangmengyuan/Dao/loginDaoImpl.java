package com.wangmengyuan.Dao;

import com.wangmengyuan.Util.HibernateUtil;
import com.wangmengyuan.bean.Students;
import com.wangmengyuan.bean.Teachers;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Administrator on 2017/12/4.
 */
public class loginDaoImpl implements loginDao {
    //教师账号密码查询
    @Override
    public List<Teachers> selecttnameAndTpassword(String tname, String tpassword) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction transaction = session.beginTransaction();
        //拼写hql
        String hql="select t from Teachers t where t.tname=:tname and t.tpassword=:tpassword";
        //创建query对象
        Query query1= session.createQuery(hql);
        //赋值
        query1.setString("tname",tname);
        query1.setString("tpassword",tpassword);

        List<Teachers> teachersList=query1.list();
        for (Teachers t:teachersList){
            System.out.println(t.getTname()+""+t.getTpassword());
        }

        //提交事务
        transaction.commit();
        //关闭session
        HibernateUtil.close(session);
        return teachersList;
    }
    //学生账号密码查询
    @Override
    public List<Students> selectsnameAndspassword(String sname, String spassword) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        //打开事务
        Transaction transaction = session.beginTransaction();
        //拼写hql
        String hql="select s from Students s where s.sname=:sname and s.spassword=:spassword";
        //创建query对象
        Query query= session.createQuery(hql);
        //赋值
        query.setString("sname",sname);
        query.setString("spassword",spassword);

        List<Students> studentsList=query.list();
        for (Students s:studentsList){
            System.out.println(s);
        }

        //提交事务
        transaction.commit();
        //关闭session
        HibernateUtil.close(session);
        return studentsList;
    }
}
