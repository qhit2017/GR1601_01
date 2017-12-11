package com.yaokaiwen.service;

import com.yaokaiwen.bean.Subject;

import java.util.List;

/**
 * Created by DELL on 2017/12/5.
 */
public interface SubjectService {
    //查询所有
    public List<Subject> selectSubjectAllService();
    //根据suid查询
    public Subject selectSubjectBySuidService(Integer suid);
    //根据条件查询
    public List<Subject> selectSubjectByService(String sudirection,String sustage);
}
