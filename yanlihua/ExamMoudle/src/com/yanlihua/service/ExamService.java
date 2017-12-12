package com.yanlihua.service;

import com.yanlihua.bean.*;

import java.util.List;
import java.util.Set;

/**
 * Created by 晏利花 on 2017/12/3.
 */
public interface ExamService {
    //查询试卷列表信息所有
    public List<Testpaper> selectTestpaperAllInfoExamService();

    //查询科目信息
    public List<Subject> selectSubjectAllInfoExamService();

    //五个条件查询信息
    public List<Testpaper> selectTestpaperInfoByFiveConditionExamService(Integer suid,String ttype,String tstate);

    //创建试卷的信息保存
    public void saveTestpaperInfoExamService(Testpaper testpaper);

    //导入试卷信息(需要传路径，动态传输)
    public String importExamInfoExamService(String path);

    //向grade表中添加信息（添加的6同时，要把试卷信息更改成开始考试）
    public void saveinfointogradeExamService(Grade grade, Classes classes, Testpaper testpaper);

    //根据tid查询testpaper状态
    public Testpaper updateTestpaperExamService(Testpaper testpaper,String cname);

    public Testpaper updateTestpaperByTidExamService(Integer tid);

    //查询最后一条数据进行修改，添加tid
    public Grade selectGradeendInfoExamService();

    //更改grade中的tid
    public void updateGradeExamService(Grade grade);

    //根据tid进行状态数据更改
    public void updatetestpapertstateExamService(Testpaper testpaper,Integer tid);
}
