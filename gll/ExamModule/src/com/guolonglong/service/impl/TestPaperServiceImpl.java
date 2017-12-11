package com.guolonglong.service.impl;

import com.guolonglong.bean.TestPaper;
import com.guolonglong.dao.TestPaperDao;
import com.guolonglong.dao.impl.TestPaperDaoImpl;
import com.guolonglong.service.TestPaperService;

import java.util.List;

/**
 * Created by lenovo on 2017/12/9.
 */
public class TestPaperServiceImpl implements TestPaperService {
    TestPaperDao testPaperDao = new TestPaperDaoImpl();
    @Override
    public List<TestPaper> selectTestPaperList() {
        return testPaperDao.selectTestPaperList();
    }

    @Override
    public List<TestPaper> selectTestPaperBySudirectionOrSustageOrSucourseOrTtypeOrTstate(String sudirection, String sustage, String sucourse, String ttype, String tstate) {
        return testPaperDao.selectTestPaperBySudirectionOrSustageOrSucourseOrTtypeOrTstate(sudirection,sustage,sucourse,ttype,tstate);
    }
}
