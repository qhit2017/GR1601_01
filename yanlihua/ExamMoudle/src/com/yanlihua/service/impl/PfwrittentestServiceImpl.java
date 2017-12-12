package com.yanlihua.service.impl;

import com.yanlihua.bean.Questionbank;
import com.yanlihua.bean.Subject;
import com.yanlihua.dao.PfwrittentestDao;
import com.yanlihua.dao.impl.PfwrittentestDaoImpl;
import com.yanlihua.service.PfwrittentestService;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/30.
 */
public class PfwrittentestServiceImpl implements PfwrittentestService {
    private PfwrittentestDao pfwrittentestDao=new PfwrittentestDaoImpl();

    @Override
    public List<Questionbank> selectQuestionbankAllInfoPfwrittentestService() {
        List<Questionbank> questionbankList=pfwrittentestDao.selectQuestionbankAllInfoPfwrittentestDao();
        return questionbankList;
    }

    @Override
    public Questionbank selectQuestionbankInfoPfwrittentestService(Integer qid) {
        return pfwrittentestDao.selectQuestionbankInfoPfwrittentestDao(qid);
    }

    @Override
    public void deleteQuestionByqidPfwrittentestService(Questionbank questionbank) {
        pfwrittentestDao.deleteQuestionByqidPfwrittentestDao(questionbank);
        return;
    }

    @Override
    public void saveOrUpdateQuestionPfwrittentestService(Questionbank questionbank) {
        pfwrittentestDao.saveOrUpdateQuestionPfwrittentestDao(questionbank);
        return;
    }

    @Override
    public  List<Subject> selectSubjectSucourseExtistPfwrittentestService(String sucourse) {
         List<Subject> subjectList=pfwrittentestDao.selectSubjectSucourseExtistPfwrittentestDao(sucourse);
        return subjectList;
    }
}
