package com.yaokaiwen.dao;

import com.yaokaiwen.bean.Questionbank;
import com.yaokaiwen.bean.Students;

import java.util.List;

/**
 * Created by DELL on 2017/12/4.
 */
public interface QuestionbankDao extends BaseDao {
    //根据suid查询试题数量
    public String selectnumberBySuid(Integer suid);
    //根据suid查询试题
    public List<Questionbank> selectQuestionbankBySuid(Integer suid);
    //导入添加试题
    public void insertsavequestionbanks(List<Questionbank> questionbankList);

}
