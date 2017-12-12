package com.yaokaiwen.dao;

import com.yaokaiwen.bean.Subject;

import java.util.List;

/**
 * Created by DELL on 2017/12/5.
 */
public interface SubjectDao extends BaseDao {
    //查询所有
    public List<Subject> selectSubjectAll();
    //根据suid查询
    public Subject selectSubjectBySuid(Integer suid);
    //根据条件查询
    public List<Subject> selectSubjectBy(String sudirection,String sustage);
    //根据sucourse查询
    public Subject selectSubjectBySucourse(String sucourse);
}
