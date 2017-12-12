package com.yanlihua.dao;

import com.yanlihua.bean.*;

import java.util.List;
import java.util.Set;

/**
 * Created by 晏利花 on 2017/12/3.
 */
public interface ExamDao {
    //查询试卷列表信息所有
    public List<Testpaper> selectTestpaperAllInfoExamDao();

    //查询科目信息
    public List<Subject> selectSubjectAllInfoExamDao();

    //五个条件查询信息
    public List<Testpaper> selectTestpaperInfoByFiveConditionExamDao(Integer suid,String ttype,String tstate);

    //创建试卷的信息保存
    public void saveTestpaperInfoExamDao(Testpaper testpaper);

    //导入试卷信息
    public void importExamInfoExamDao(List<Questionbank> questionbankList);

    //向grade表中添加信息（添加的6同时，要把试卷信息更改成开始考试）
    public void saveinfointogradeExamDao(Grade grade, Classes classes,Testpaper testpaper);

    //根据tid查询testpaper状态
    public void updateTestpaperExamDao(Testpaper testpaper,String cname);

    public Testpaper updateTestpaperByTidExamDao(Integer tid);

    //查询最后一条数据进行修改，添加tid
    public Grade selectGradeendInfoExamDao();

    //更改grade中的信息（考试完后又成绩）
    public void updateGradeExamDao(Grade grade);
}
