package com.chengshuai.dao;

import com.chengshuai.bean.Questionbank;
import com.chengshuai.bean.Teachers;
import com.chengshuai.bean.Testpaper;
import com.chengshuai.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.security.sasl.SaslException;
import java.util.List;

/**
 * Created by Administrator on 2017/12/6.
 */
public class TestParperDaoImpl extends  BaseDaoImpl implements  TestParperDao {
    @Override
    public void insertTestPareper(Testpaper testpaper, String[] questionid) {
        Session session = HibernateUtil.getSession();
        if(session==null){
            return ;
        }

        Transaction transaction = session.beginTransaction();

        for(int i=0;i<questionid.length;i++){
           Questionbank questionbank= (Questionbank)session.get(Questionbank.class,questionid[i]);
           testpaper.getQuestionbankSet().add(questionbank);
        }


        session.save(testpaper);
        transaction.commit();

        HibernateUtil.close(session);

        return;

    }
}
