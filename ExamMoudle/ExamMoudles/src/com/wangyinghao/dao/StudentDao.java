package com.wangyinghao.dao;



import com.wangyinghao.bean.Students;

import java.util.List;

/**
 * Created by 王英豪 on 2017/11/17.
 */
public interface StudentDao extends BaseDao {

   //实现登陆功能（查询students表）
   public Students selectstudents(Students students);
   //
   public List<Students> select(Students students);

}
