package com.jinmengjie.service.impl;
import com.jinmengjie.bean.Subject;
import com.jinmengjie.dao.StudentDao;
import com.jinmengjie.dao.SubjectDao;
import com.jinmengjie.dao.impl.SubjectDaoImpl;
import com.jinmengjie.service.SubjectService;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/12/5/005.
 */
public class SubjectServiceImpl  implements SubjectService{
    private   SubjectDao subjectDao = new SubjectDaoImpl();
    @Override
    public List<Subject> selectSubjectInfoBySudirectionAndSustage(String sudirection, String sustage) {

        List<Subject> subject = subjectDao.selectSubjectInfoBySudirectionAndSustage(sudirection,sustage);
        if (subject.size()==0||subject==null){
            return  null;
        }else {
            return subject;
        }
    }

    @Override
    public Subject selectSubjectBysucourse(String sucourse) {
    return   subjectDao.selectSubjectBysucourse(sucourse);
    }
}
