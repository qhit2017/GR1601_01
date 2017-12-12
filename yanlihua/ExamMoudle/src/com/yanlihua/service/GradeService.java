package com.yanlihua.service;

import com.yanlihua.bean.Testpaper;

import java.util.List;

/**
 * Created by 晏利花 on 2017/12/5.
 */
public interface GradeService {
    //根据科目名或考试类型进行查询
    public List<Testpaper> selectSubjectByNameAndTypeGradeService(Integer suid, String ttype);
}
