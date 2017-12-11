package com.yaokaiwen.dao.impl;


import com.yaokaiwen.bean.Students;
import com.yaokaiwen.bean.Testpaper;
import com.yaokaiwen.dao.TestpaperDao;
import com.yaokaiwen.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by DELL on 2017/12/6.
 */
public class TestpaperDaoImpl extends BaseDaoImpl implements TestpaperDao {
    @Override
    public List<Testpaper> selecttestpaper(Integer suid, String tstate) {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        String hql = "select t from Testpaper t WHERE 1=1 ";
        if(suid!=null && !"".equals(suid)){
            hql= hql    +"and t.suid =:suid ";
        }
        if(tstate!=null && !"".equals(tstate)){
            hql= hql   +" and t.tstate=:tstate";
        }
        Query query= session.createQuery(hql);
        if(suid!=null && !"".equals(suid)){
            query.setInteger("suid",suid);
        }
        if(tstate!=null && !"".equals(tstate)){
            query.setString("tstate",tstate);
        }

        List<Testpaper> list = query.list();
        HibernateUtil.close(session);
        return list;
    }
}
