package com.yanlihua.dao;

import com.yanlihua.bean.Grade;
import com.yanlihua.bean.Testpaper;

import java.util.List;

/**
 * Created by 晏利花 on 2017/12/5.
 */
public interface GradeDao {
    //根据科目名或考试类型进行查询
    public List<Testpaper> selectSubjectByNameAndTypeGradeDao(Integer suid,String ttype);


}
