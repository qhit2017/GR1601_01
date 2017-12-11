package com.chengshuai.dao;

import com.chengshuai.bean.Students;
import com.chengshuai.bean.Testpaper;

/**
 * Created by Administrator on 2017/12/8.
 */
public interface GradeDao {
    public void insertGrade(Grade grade, Set<Students> studentsSet, Testpaper testpaper);
}
