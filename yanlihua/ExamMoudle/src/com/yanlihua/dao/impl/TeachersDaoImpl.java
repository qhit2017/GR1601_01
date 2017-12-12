package com.yanlihua.dao.impl;

import com.sun.org.apache.xpath.internal.operations.Or;
import com.yanlihua.bean.Students;
import com.yanlihua.bean.Teachers;
import com.yanlihua.dao.TeachersDao;
import com.yanlihua.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/23.
 */
public class TeachersDaoImpl  implements TeachersDao{
    @Override
    public List<Teachers> selectAllTeachersInfoTeachersDao() {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select t from Teachers t";
        //2.创建Query对象
        Query query=session.createQuery(hql);


        //执行hql
        List<Teachers> teachersList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public List<Teachers> selectThreeConditionTeachersDao(String tnumber, String tname, Integer tjob) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select t from Teachers t where 1=1 " ;
                if(tnumber!=null && !tnumber.equals("")){
                     hql=hql+" and t.tnumber=:tnumber ";
                }
                if(tname!=null && !tname.equals("")) {
                    hql=hql  +" and t.tname=:tname ";
                }
                if(tjob!=null && !tjob.equals("")) {
                    hql=hql+" and t.tjob=:tjob";
                }
        System.out.println(hql);
        //2.创建Query对象
        Query query=session.createQuery(hql);
        //3.给占位符进行赋值
        if(tnumber!=null && !tnumber.equals("")) {
            query.setString("tnumber",tnumber);
        }
        if(tname!=null && !tname.equals("")) {
            query.setString("tname",tname);
        }
        if(tjob!=null && !tjob.equals("")) {
            query.setInteger("tjob",tjob);
        }

        //执行hql
        List<Teachers> teachersList=query.list();
        System.out.println("selectThreeConditionTeachersDao-------"+teachersList.size());
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public List<Teachers> selectThreeConditionTeachersDao1(Teachers teachers) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
       /* System.out.println("ffffffffffffffffffffff"+""+tnumber+" "+tname+" "+tjob);*/
        String hql="select t from Teachers t where 1=1 " ;
        if(teachers.getTnumber()!=null && !teachers.getTnumber().equals("")){
            hql=hql+" and t.tnumber=:tnumber ";
        }
        if(teachers.getTname()!=null && !teachers.getTname().equals("")) {
            hql=hql  +" and t.tname=:tname ";
        }
        if(teachers.getTjob()!=null && !teachers.getTjob().equals("")) {
            hql=hql+" and t.tjob=:tjob";
        }
        //2.创建Query对象
        Query query=session.createQuery(hql);
        //3.给占位符进行赋值
        if(teachers.getTnumber()!=null && !teachers.getTnumber().equals("")){
            query.setString("tnumber",teachers.getTnumber());
        }
        if(teachers.getTname()!=null && !teachers.getTname().equals("")) {
            query.setString("tname",teachers.getTname());
        }
        if(teachers.getTjob()!=null && !teachers.getTjob().equals("")) {
            query.setInteger("tjob",teachers.getTjob());
        }

        //执行hql
        List<Teachers> teachersList=query.list();
        System.out.println("selectThreeConditionTeachersDao-------"+teachersList.size());
        transaction.commit();
        HibernateUtil.close(session);
        return teachersList;
    }

    @Override
    public Teachers selectTeachersInfoByTidTeacherDao(Integer tid) {
        Session session= HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        Teachers teachers=(Teachers) session.get(Teachers.class,tid);
        transaction.commit();
        HibernateUtil.close(session);
        return teachers;
    }

    @Override
    public void saveOrUpdateTeachersInfoTeacherDao(Teachers teachers) {
            Session session = HibernateUtil.getSession();
            if (session==null){
                return ;
            }
            Transaction transaction=session.beginTransaction();
            session.saveOrUpdate(teachers);
            transaction.commit();
            HibernateUtil.close(session);

    }

    @Override
    public void deleteTeacherByIdBaseDao(Teachers teachers) {
            Session session= HibernateUtil.getSession();
            if (session==null){
                return ;
            }
            Transaction transaction=session.beginTransaction();
            session.delete(teachers);
            transaction.commit();
            HibernateUtil.close(session);
            return ;
    }

    @Override
    public Teachers selectEndTeacherDataByTnumberTeachersDao() {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select t from Teachers t order by  tnumber desc ";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(1);


        //执行hql
        List<Teachers> teachersList=query.list();
        transaction.commit();
        session.close();
        return teachersList.get(0);
    }

    @Override
    public List<Teachers> selectTeacherInfoLikeTnumberTeacherService(String tnumber) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select t from Teachers t where t.tnumber like:tnumber ";
        //2.创建Query对象
        Query query=session.createQuery(hql);
        query.setString("tnumber",tnumber);


        //执行hql
        List<Teachers> teachersList=query.list();
        transaction.commit();
        session.close();
        return teachersList;
    }


}
