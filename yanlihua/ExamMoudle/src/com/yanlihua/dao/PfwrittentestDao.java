package com.yanlihua.dao;

import com.yanlihua.bean.Questionbank;
import com.yanlihua.bean.Subject;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/30.
 */
public interface PfwrittentestDao {
    //查询所有题库信息
    public List<Questionbank> selectQuestionbankAllInfoPfwrittentestDao();

    //根据qid进行查询
    public  Questionbank selectQuestionbankInfoPfwrittentestDao(Integer qid);

    //根据qid进行删除
    public void  deleteQuestionByqidPfwrittentestDao(Questionbank questionbank);

    //保存和修改试题信息
    public void saveOrUpdateQuestionPfwrittentestDao(Questionbank questionbank);

    //模糊查询此试题题目类型是否存在
    public List<Subject> selectSubjectSucourseExtistPfwrittentestDao(String sucourse);


}
