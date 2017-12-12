package com.guolonglong.dao.impl;

import com.guolonglong.bean.Teachers;
import com.guolonglong.dao.PageDao;
import com.guolonglong.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by lenovo on 2017/11/30.
 */
public class PageDaoImpl implements PageDao {
    @Override
    public List<Teachers> selectTeachersTotalCountList() {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        String hql = "select t from Teachers t";

        Query query = session.createQuery(hql);

        List<Teachers> teachersList = query.list();

        HibernateUtil.close(session);
        return teachersList;

    }

    @Override
    public List<Teachers> selectTeachersBydataStartAnddataEnd(Integer dataStart, Integer dataEnd) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        String hql = "select top "+(dataEnd-dataStart+1)+" t from Teachers t where t.tid not in (select top "+(dataStart-1)+" titd from Teachers t)";

        Query query = session.createQuery(hql);

        List<Teachers> teachersList = query.list();

        HibernateUtil.close(session);
        return teachersList;
    }
}
