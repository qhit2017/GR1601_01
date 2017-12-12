package com.zhanglong.service;

import com.zhanglong.bean.Questionbank;
import com.zhanglong.bean.Subject;

import java.util.List;

/**
 * Created by Administrator on 2017/12/5 0005.
 */
public interface QuestionService {
    //根据方向和阶段查询
    public List<Subject> selectchaxunBySudirectionandSustage(String sudirection, String sustage);
    //根据ID查数目
    public List<Questionbank>selectshumu(Integer suid);
    //根据ID查科目名字
    public Subject selectname(Integer suid);

    //查询所有题库信息
    public List<Questionbank>selectAllxinxi();
    //根据qid查询Questionbank所有信息
    public Questionbank selectQuestionbankByqid(Integer qid);
    //根据qid删除信息
    public void shanxhuQuestionbank(Questionbank questionbank);
    //修改信息
    public void saveorupdatequestionbank(Questionbank questionbank);
    //导入问题
    public String daoruquestion(String path);
}
