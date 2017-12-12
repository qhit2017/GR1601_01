package com.yaokaiwen.service.impl;

import com.yaokaiwen.bean.Subject;
import com.yaokaiwen.dao.SubjectDao;
import com.yaokaiwen.dao.impl.SubjectDaoImpl;
import com.yaokaiwen.service.SubjectService;

import java.util.List;

/**
 * Created by DELL on 2017/12/5.
 */
public class SubjectServiceImpl implements SubjectService {
    private SubjectDao subjectDao = new SubjectDaoImpl();
    @Override
    public List<Subject> selectSubjectAllService() {
        return null;
    }

    @Override
    public Subject selectSubjectBySuidService(Integer suid) {
        Subject subject = subjectDao.selectSubjectBySuid(suid);
        if(subject==null){
            return null;
        }else {
            return subject;
        }

    }

    @Override
    public List<Subject> selectSubjectByService(String sudirection, String sustage) {
        List<Subject> list = subjectDao.selectSubjectBy(sudirection,sustage);
        if(list==null||list.size()<=0){
            return null;
        }else {
            return list;
        }
    }
}
