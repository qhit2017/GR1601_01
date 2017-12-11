package com.jinmengjie.dao.impl;

import com.jinmengjie.bean.Testpaper;
import com.jinmengjie.dao.TestpaperDao;
import com.jinmengjie.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/12/8/008.
 */
public class TestpaperDaoImpl implements TestpaperDao {
    //查询所有试卷信息
    @Override
    public List<Testpaper> selectAllTestpaperInfo() {
        Session session = HibernateUtil.getSession();
        if (session == null) {
            return null;
        }
        Transaction transaction = session.beginTransaction();
        //拼写hql语句
        //命名参数
        String hql = "select t from Testpaper t";
        //创建query对象
        Query query = session.createQuery(hql);

        //执行hql，返回list
        List<Testpaper> testpaperList = query.list();
        transaction.commit();
        HibernateUtil.close(session);
        return testpaperList;
    }
}
