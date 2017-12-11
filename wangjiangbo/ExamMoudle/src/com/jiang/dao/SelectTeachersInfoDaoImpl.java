package com.jiang.dao;
import com.jiang.bean.Teachers;
import com.jiang.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;
/**
 * Created by dell on 2017/11/26.
 */
public class SelectTeachersInfoDaoImpl implements SelectTeachersInfoDao {
    @Override
    public List<Teachers> selectTeachersByTnumberOrTnameOrTjob(String tnumber, String tname,Integer tjob) {
        Session session = HibernateUtil.getSession();
        if (session==null){
            return null;
        }
        Transaction ts = session.beginTransaction();
        /*拼写sql文*/
        /*动态hql文*/
        String hql = "select t from Teachers t where 1=1" ;
            if(tnumber!=null && !tnumber.equals("")){
               hql =hql+"and  t.tnumber=:tnumber " ;
            }
            if(tname!=null && !tname.equals("")){
               hql =hql+"and t.tname=:tname " ;
            }
            if(tjob!=null && !tjob.equals("")){
               hql =hql+"and t.tjob=:tjob";
            }
        /*创建query对象*/
        Query query = session.createQuery(hql);
        /*赋值*/
        if(tnumber!=null && !tnumber.equals("")){
                query.setString("tnumber",tnumber);
        }
        if(tname!=null && !tname.equals("")){
                query.setString("tname",tname);
        }
        if(tjob!=null && !tjob.equals("")){
                query.setInteger("tjob",tjob);
        }
        /*执行hql*/
        List<Teachers> list = query.list();
        ts.commit();
        HibernateUtil.close(session);
        return list;
    }
}
