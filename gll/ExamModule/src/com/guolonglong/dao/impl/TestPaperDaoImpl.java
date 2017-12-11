package com.guolonglong.dao.impl;

import com.guolonglong.bean.TestPaper;
import com.guolonglong.dao.TestPaperDao;
import com.guolonglong.dao.base.PublicDaoImpl;
import com.guolonglong.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by lenovo on 2017/12/9.
 */
public class TestPaperDaoImpl extends PublicDaoImpl implements TestPaperDao {
    @Override
    public List<TestPaper> selectTestPaperList() {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        String  hql = "select t from TestPaper t";
        Query query = session.createQuery(hql);
        List<TestPaper> testPaperList =  query.list();
        HibernateUtil.close(session);
        return testPaperList;
    }

    @Override
    public List<TestPaper> selectTestPaperBySudirectionOrSustageOrSucourseOrTtypeOrTstate(String sudirection, String sustage, String sucourse, String ttype, String tstate) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        String  hql = "select t from testpaper t where 1=1";
        if (sudirection!=null && !sudirection.equals("")){
            hql = hql + " and sudirection=:sudirection";
        }
        if (sustage!=null && !sustage.equals("")){
            hql = hql + " and sustage=:sustage";
        }
        if (sucourse!=null && !sucourse.equals("")){
            hql = hql + " and sucourse=:sucourse";
        }
        if (ttype!=null && !ttype.equals("")){
            hql = hql + " and ttype=:ttype";
        }
        if (tstate!=null && !tstate.equals("")){
            hql = hql + " and tstate=:tstate";
        }
        Query query = session.createQuery(hql);
        if (sudirection!=null && !sudirection.equals("")){
            query.setString("sudirection",sudirection);
        }
        if (sustage!=null && !sustage.equals("")){
            query.setString("sustage",sustage);
        }
        if (sucourse!=null && !sucourse.equals("")){
            query.setString("sucourse",sucourse);
        }
        if (ttype!=null && !ttype.equals("")){
            query.setString("ttype",ttype);
        }
        if (tstate!=null && !tstate.equals("")){
            query.setString("tstate",tstate);
        }
        List<TestPaper> testPaperList =  query.list();
        HibernateUtil.close(session);
        return testPaperList;
    }
}
