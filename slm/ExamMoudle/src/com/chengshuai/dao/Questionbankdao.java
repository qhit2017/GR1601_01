package com.chengshuai.dao;

import com.chengshuai.bean.Questionbank;
import com.chengshuai.bean.Subject;

import java.util.List;

/**
 * Created by slm on 2017/12/5.
 * 试题
 */
public interface Questionbankdao {
    /*查询试题表中所有信息*/
    public List<Questionbank> QueryQuestionbankAll();

    /*根据阶段方向查询科目*/
    public List<Subject>QuerySubjectsudirectionAndsustage(String sudirection,String sustage);

    /*查询出所有数据*/
    public List<Questionbank> QuestionbankAllumber(Integer id);


    /*根据科目查询题*/
    public  List<Questionbank>QuerySubjtAndsucourse(Integer id);
}
