package com.zhangerhui.service.impl;

import com.zhangerhui.bean.Classes;
import com.zhangerhui.bean.Teachers;
import com.zhangerhui.dao.ClassesDao;
import com.zhangerhui.dao.impl.ClassesDaoImpl;
import com.zhangerhui.service.ClassesService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/4/004.
 */
public class ClassesServiceImpl implements ClassesService {

    private ClassesDao dao = new ClassesDaoImpl();

    @Override
    public List<Classes> selectClassesallinfo() {
        return dao.queryClassesallinfo();
    }

    @Override
    public List<Teachers> selectTeacherInfoByTjobClassServiceb() {
        return dao.queryTeacherInfoByTjobClassDaob(0);
    }

    @Override
    public List<Teachers> selectTeacherInfoByTjobClassServicej() {
        return dao.queryTeacherInfoByTjobClassDaoj(1);
    }

    @Override
    public List<Classes> selectClassByFour(String cbegin, String cdirection, Integer tidh, Integer tidl) {
        List<Classes> classesList = dao.queryClassByFour(cbegin, cdirection);

        List<Classes> classesList1 = new ArrayList<Classes>();
        for (Classes c : classesList) {
            Integer tb = c.getTeachersh().getTid();
            Integer tj = c.getTeachersl().getTid();

            if (tidh != null) {
                if (tidh != tb) {
                    continue;
                }
            }
            if (tidl != null) {
                if (tj != tidl) {
                    continue;
                }
            }
            classesList1.add(c);
        }
        return classesList1;
    }

    @Override
    public void insertclasses(Classes classes) {
        dao.insert(classes);
        return;
    }

    @Override
    public void updateclasses(Classes classes) {
        dao.upadte(classes);
        return;
    }

    @Override
    public Classes selectClassesinfoByCidClassess(Integer cid) {
        return dao.queryClassesByCid(cid);
    }
}
