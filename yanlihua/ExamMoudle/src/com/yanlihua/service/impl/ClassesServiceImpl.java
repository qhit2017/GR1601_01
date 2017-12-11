package com.yanlihua.service.impl;

import com.yanlihua.bean.Classes;
import com.yanlihua.bean.Teachers;
import com.yanlihua.dao.ClassesDao;
import com.yanlihua.dao.impl.ClassesDaoImpl;
import com.yanlihua.service.ClassesService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 晏利花 on 2017/11/25.
 */
public class ClassesServiceImpl implements ClassesService {
    private ClassesDao classDao=new ClassesDaoImpl();
    @Override
    public List<Classes> selectAllClassInfoClassService() {
       return classDao.selectAllClassInfoClassDao();
    }

    @Override
    public List<Teachers> selectTeacherInfoByTjobClassServiceb() {
        return classDao.selectTeacherInfoByTjobClassDaob(0);
    }

    @Override
    public List<Teachers> selectTeacherInfoByTjobClassServicej() {
        return classDao.selectTeacherInfoByTjobClassDaoj(1);
    }

    /**
     *
     * @param cbegin
     * @param cdirection
     * @param tidh 班主任
     * @param tidl 讲师
     * @return
     */
    @Override
    public List<Classes> selectClassByFourConditionClassService(String cbegin, String cdirection,Integer tidh,Integer tidl) {
        List<Classes> classesList= classDao.selectClassByFourConditionClassDao(cbegin,cdirection);
       // System.out.println("----tidl"+classesList.size());
        List<Classes> classesList1=new ArrayList<Classes>();
        for (Classes c:classesList){
            Integer tb=c.getTeachersh().getTid();
            Integer tj=c.getTeachersl().getTid();
            /*System.out.println("bbb"+tb);
            System.out.println("jjj"+tj);*/
            if(tidh!=null && tidh!=-1){
                if (tidh!=tb){
                    continue;
                }
            }
            if(tidl!=null && tidl!=-1){
                if (tj!=tidl){
                  continue;
                }
            }
            classesList1.add(c);

        }
        return classesList1;
    }

    @Override
    public void saveOrUpdateClassesinfoClassesService(Classes classes) {
        classDao.saveOrUpdateClassesinfoClassesDao(classes);
        return;
    }

    @Override
    public Classes selectClassesinfoByCidClassesService(Integer cid) {
       return classDao.selectClassesinfoByCidClassesDao(cid);
    }
}
