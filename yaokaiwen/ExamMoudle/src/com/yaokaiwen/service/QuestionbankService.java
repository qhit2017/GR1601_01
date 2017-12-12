package com.yaokaiwen.service;

import com.yaokaiwen.bean.Questionbank;

import java.util.List;

/**
 * Created by DELL on 2017/12/5.
 */
public interface QuestionbankService {
    public String selectnumberBySuidService(Integer suid);
    //根据suid查询试题
    public List<Questionbank> selectQuestionbankBySuidService(Integer suid);
    //导入试题
    public void fileupInsertQuestionService(String filepath);
    //添加试题
    public void insertQuestionSerice(Questionbank questionbank);
}
