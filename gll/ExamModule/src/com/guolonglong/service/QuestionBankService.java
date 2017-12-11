package com.guolonglong.service;

import com.guolonglong.bean.QuestionBank;
import com.guolonglong.bean.Subject;

import java.util.List;

/**
 * Created by lenovo on 2017/12/6.
 */
public interface QuestionBankService {
    //查询suid个数
    public List<Subject> selectSubjectSuidCount(String sudirection, String sustage);
    //通过科目查询QuestionBank
    public List<QuestionBank> selectQuestionBankBySucourse(String sucourse);
    //通过Suid查询QuestionBank
    public List<QuestionBank> selectQuestionBankBySuid(Integer suid);
    //学生的数据导入
    public String questionbankImport(String path);
    //选题组卷
    public List<QuestionBank> selectQuestionBankList();
    //通过qid组试卷
    public QuestionBank crearePaperByQid(Integer qid);
}
