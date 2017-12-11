package com.yanlihua.service.impl;

import com.yanlihua.bean.Testpaper;
import com.yanlihua.dao.GradeDao;
import com.yanlihua.dao.impl.GradeDaoImpl;
import com.yanlihua.service.GradeService;

import java.util.List;

/**
 * Created by 晏利花 on 2017/12/5.
 */
public class GradeServiceImpl implements GradeService {
    private GradeDao gradeDao=new GradeDaoImpl();
    @Override
    public List<Testpaper> selectSubjectByNameAndTypeGradeService(Integer suid, String ttype) {
        return gradeDao.selectSubjectByNameAndTypeGradeDao(suid,ttype);
    }
}
