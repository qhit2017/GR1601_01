package com.chengshuai.dao;

import com.chengshuai.bean.Questionbank;

import java.util.List;

/**
 * Created by Administrator on 2017/12/6.
 */
public interface QuestionbankDao {

/*    //查询单选简单题
    public List<Questionbank> selectdEasy();
    //查询单选一般题
    public List<Questionbank> selectdMiddle();
    //查询单选困难题
    public List<Questionbank> selectdDef();*/

/*    //查询多选简单题
    public List<Questionbank> select();
    //查询多选一般题.
    public List<Questionbank> select();
    //查询多选困难题
    public List<Questionbank> select();*/


    public List<Questionbank> selectQuestion(Integer flg);



}
