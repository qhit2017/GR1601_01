package com.guolonglong.service;

import com.guolonglong.bean.TestPaper;

import java.util.List;

/**
 * Created by lenovo on 2017/12/9.
 */
public interface TestPaperService {
    //查询试卷
    public List<TestPaper> selectTestPaperList();
    //条件查询
    public List<TestPaper> selectTestPaperBySudirectionOrSustageOrSucourseOrTtypeOrTstate(String sudirection,String sustage,String sucourse,String ttype,String tstate);
}
