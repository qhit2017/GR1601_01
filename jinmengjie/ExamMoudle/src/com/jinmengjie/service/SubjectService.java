package com.jinmengjie.service;

import com.jinmengjie.bean.Subject;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/12/5/005.
 */
public interface SubjectService {
    //根据科目和方向做精确查询
    public List<Subject> selectSubjectInfoBySudirectionAndSustage(String  sudirection, String  sustage );
    //根据科目做精确查询
    public  Subject selectSubjectBysucourse(String sucourse);
}
