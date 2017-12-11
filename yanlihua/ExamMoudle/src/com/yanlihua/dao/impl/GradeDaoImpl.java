package com.yanlihua.dao.impl;

import com.yanlihua.bean.Grade;
import com.yanlihua.bean.Testpaper;
import com.yanlihua.dao.GradeDao;
import com.yanlihua.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 晏利花 on 2017/12/5.
 */
public class GradeDaoImpl implements GradeDao {
    @Override
    public List<Testpaper> selectSubjectByNameAndTypeGradeDao(Integer suid, String ttype) {
        Session session= HibernateUtil.getSession();
        if(session==null){
            return null;
        }
        Transaction transaction=session.beginTransaction();
        //1.拼写hql
        String hql="select t from  Testpaper t where 1=1";
        if(suid!=null && !suid.equals("")){
            hql=hql+" and t.subject.suid=:suid ";
        }
        if(ttype!=null && !ttype.equals("")) {
            hql=hql  +" and t.ttype=:ttype ";
        }

        //2.创建Query对象
        Query query=session.createQuery(hql);
        //3.给占位符进行赋值
        if(suid!=null && !suid.equals("")){
            query.setInteger("suid",suid);
        }
        if(ttype!=null && !ttype.equals("")) {
            query.setString("ttype",ttype);
        }

        //执行hql
        List<Testpaper> testpaperList=query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return testpaperList;

    }


}
