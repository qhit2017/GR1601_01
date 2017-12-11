package com.yanlihua.dao.impl;

import com.yanlihua.dao.BaseDao;
import com.yanlihua.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/23.
 */
public class BaseDaoImpl implements BaseDao{

    @Override
    public void deleteObjectByIdBaseDao(Object object) {
            Session session= HibernateUtil.getSession();
            if (session==null){
                return ;
            }
            Transaction transaction=session.beginTransaction();
            session.delete(object);
            transaction.commit();
           HibernateUtil.close(session);
            return ;


    }
}
