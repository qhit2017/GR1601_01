package com.chengshuai.dao.impl;

import com.chengshuai.bean.Testpaper;
import com.chengshuai.dao.Testpaperdao;
import com.chengshuai.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by slm on 2017/12/6.
 */
public class Testpaperimpl implements Testpaperdao {
    @Override
    public List<Testpaper> QueryTestpaperAll() {
       Session session = HibernateUtil.getSession();
       if(session==null){
           return null;
       }
       String hql="select t from Testpaper t ";
       Query query =  session.createQuery(hql);
       List<Testpaper> testpaperList =  query.list();
        return testpaperList;
    }
}
