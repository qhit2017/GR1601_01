package com.yanlihua.service.impl;

import com.yanlihua.bean.Questionbank;
import com.yanlihua.bean.Subject;
import com.yanlihua.dao.QuestionBankDao;
import com.yanlihua.dao.impl.QuestionBankDaoImpl;
import com.yanlihua.service.QuestionBankService;

import java.util.List;

/**
 * Created by 晏利花 on 2017/12/5.
 */
public class QuestionBankServiceImpl implements QuestionBankService {
    private QuestionBankDao questionBankDao=new QuestionBankDaoImpl();
    @Override
    public List<Subject> selectSubjectInfoBySudAndSusQuestionService(String sudirection, String sustage) {
        return questionBankDao.selectSubjectInfoBySudAndSusQuestionDao(sudirection,sustage);
    }

    @Override
    public List<Questionbank> selectSuidNumberInQuestionBankQuestionBankService(Integer suid) {
        return questionBankDao.selectSuidNumberInQuestionBankQuestionBankDao(suid);
    }

    @Override
    public Subject selectSubjectnameBySuidQuestionBankService(Integer suid) {
        return questionBankDao.selectSubjectnameBySuidQuestionBankDao(suid);
    }
}
