package com.yanlihua.dao.impl;

import com.yanlihua.bean.Questionbank;
import com.yanlihua.bean.Testpaper;
import com.yanlihua.dao.CreatepaperDao;
import com.yanlihua.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Created by 晏利花 on 2017/12/6.
 */
public class CreatepaperDaoImpl implements CreatepaperDao {
    @Override
    public void insertTestPareperCreatepaperDao(Testpaper testpaper, Integer[] questionid) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return ;
        }
        Transaction transaction = session.beginTransaction();

        //for循环  根据题号进行循环保存
        for(int i=0;i<questionid.length;i++){
            //循环取对象
            Questionbank questionbank=(Questionbank)session.get(Questionbank.class,questionid[i]);
            System.out.println("questionbank--------------"+questionbank);
            //取完后放入testpaper对象中（级联保存，产生关系）
            testpaper.getQuestionbankSet().add(questionbank);
        }

        //保存需要保存的对象
        session.save(testpaper);
        transaction.commit();

        HibernateUtil.close(session);

        return;

    }
}
