package com.chengshuai.service.impl;

import com.chengshuai.bean.Questionbank;
import com.chengshuai.bean.Subject;
import com.chengshuai.dao.Questionbankdao;
import com.chengshuai.dao.impl.Questionbankimpl;
import com.chengshuai.service.Questionbankservice;

import java.util.List;

/**
 * Created by slm on 2017/12/5.
 */
public class Questionbankserviceimpl implements Questionbankservice {
    private Questionbankdao questionbankdao = new Questionbankimpl();
    @Override
    public List<Questionbank> QueryQuestionbankAll() {
        return questionbankdao.QueryQuestionbankAll();
    }

    @Override
    public List<Subject> QuerySubjectsudirectionAndsustage(String sudirection, String sustage) {
        return questionbankdao.QuerySubjectsudirectionAndsustage(sudirection,sustage);
    }

    @Override
    public List<Questionbank> QuestionbankAllumber(Integer id) {
        return questionbankdao.QuestionbankAllumber(id);
    }
}
