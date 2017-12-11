package com.jinmengjie.dao;

import com.jinmengjie.bean.Subject;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/12/5/005.
 */
public interface SubjectDao {
    //根据方向和阶段做精确查询
    public List<Subject>selectSubjectInfoBySudirectionAndSustage(String  sudirection,String  sustage );
    //根据科目做精确查询
    public  Subject selectSubjectBysucourse(String sucourse);
}
