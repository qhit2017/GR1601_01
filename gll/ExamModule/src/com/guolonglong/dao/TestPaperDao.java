package com.guolonglong.dao;

import com.guolonglong.bean.QuestionBank;
import com.guolonglong.bean.TestPaper;
import com.guolonglong.dao.base.PublicDao;

import java.util.List;

/**
 * Created by lenovo on 2017/12/9.
 */
public interface TestPaperDao extends PublicDao {
    //查询试卷
    public List<TestPaper> selectTestPaperList();
    //条件查询
    public List<TestPaper> selectTestPaperBySudirectionOrSustageOrSucourseOrTtypeOrTstate(String sudirection,String sustage,String sucourse,String ttype,String tstate);


}
