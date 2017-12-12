package com.wangyinghao.dao.impl;

import com.wangyinghao.bean.Teachers;
import com.wangyinghao.dao.TeachersDao;
import com.wangyinghao.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 王英豪 on 2017/11/26.
 */
public class TeachersDaoImpl extends BaseDaoImpl implements TeachersDao{
    @Override
    public List<Teachers> selectteachers(String tname, String password) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //拼写hql语句
        //命名参数
        String hql = "select t from Teachers t where t.tname=:tname and t.tpassword=:password";
        //创建query对象
        Query query = session.createQuery(hql);
        query.setString("tname",tname);
        query.setString("password",password);
        //执行hql，返回list
        List<Teachers> teachersList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;


    }

    @Override
    public List<Teachers> selectAllTechers() {
        //查询所有

        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //拼写hql语句
        //命名参数
        String hql = "select t from Teachers t";
        //创建query对象
        Query query = session.createQuery(hql);

        //执行hql，返回list
        List<Teachers> teachersList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }



    //根据账号，姓名，岗位做查询并显示到页面
    @Override
    public List<Teachers> selectteachertBynameOrtnumberOrtjob(Teachers teachers) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String tnumber = teachers.getTnumber();
        String tname = teachers.getTname();
        Integer tjob = teachers.getTjob();
        System.out.println("selectteachertBynameOrtnumberOrtjob"+tnumber+" "+tname+" "+tjob);
        Transaction transaction = session.beginTransaction();
        //拼写hql语句
        //命名参数
        String hql = "select t from Teachers t Where 1=1" ;
        if (tnumber!=null && !tnumber.equals("")) {
            hql = hql + " and t.tnumber=:tnumber ";
        }
        if (tname!=null && !tname.equals("")){
            hql =hql+" and t.tname=:tname ";
        }
        if (tjob!=null && !tjob.equals("")){
            hql =hql+" and t.tjob=:tjob";
        }

        //创建query对象
        Query query = session.createQuery(hql);

        if (tnumber!=null && !tnumber.equals("")) {
            query.setString("tnumber", tnumber);
        }

        if (tname!=null && !tname.equals("")) {
            query.setString("tname", tname);
        }

        if (tjob!=null && !tjob.equals("")) {
            query.setInteger("tjob", tjob);
        }


        //执行hql，返回list
        List<Teachers> teachersList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    //根据id查询编辑页面的所有信息（教师页面点击编辑要做的处理）
    @Override
    public Teachers selectteacherByttid(Integer tid) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //拼写hql语句
        //命名参数
        String hql = "select t from Teachers t Where t.tid like :tid";
        //创建query对象
        Query query = session.createQuery(hql);


        query.setInteger("tid",tid);

        //执行hql，返回list
        Teachers teachers = (Teachers) query.uniqueResult();
        transaction.commit();
        HibernateUtil.close(session);
        return teachers;
    }




    //模糊查询(根据账号)
    @Override
    public List<Teachers> selectteacherBytid(String tnumber) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //拼写hql语句
        //命名参数
        String hql = "select t from Teachers t Where t.tnumber like :tnumber";
        //创建query对象
        Query query = session.createQuery(hql);


        query.setString("tnumber",tnumber);

        //执行hql，返回list
        List<Teachers> teachersList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public void saveTeacherInfoAndUpdate(Teachers teachers) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return ;
        }
        Transaction transaction=session.beginTransaction();
        session.saveOrUpdate(teachers);
        transaction.commit();
        HibernateUtil.close(session);

    }
}
