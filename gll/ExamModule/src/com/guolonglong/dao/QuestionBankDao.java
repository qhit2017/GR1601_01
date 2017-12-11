package com.guolonglong.dao;

import com.guolonglong.bean.QuestionBank;
import com.guolonglong.bean.Subject;
import com.guolonglong.dao.base.PublicDao;

import java.util.List;

/**
 * Created by lenovo on 2017/12/6.
 */
public interface QuestionBankDao extends PublicDao{
    //查询suid个数
    public List<Subject> selectSubjectSuidCount(String sudirection,String sustage);
    //通过科目查询QuestionBank
    public List<QuestionBank> selectQuestionBankBySucourse(String sucourse);
    //通过Suid查询QuestionBank
    public List<QuestionBank> selectQuestionBankBySuid(Integer suid);
    //学生的数据导入
    public void questionbankImport(List<QuestionBank> questionBankList);
    //选题组卷
    public List<QuestionBank> selectQuestionBankList();
    //通过qid组试卷
    public QuestionBank crearePaperByQid(Integer qid);
    //随机组卷的试题查询
    public QuestionBank selectQuestionBank();
}
