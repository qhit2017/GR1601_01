package com.wangmengyuan.Service;

import com.wangmengyuan.Dao.ClassesDao;
import com.wangmengyuan.Dao.ClassesDaoImpl;
import com.wangmengyuan.bean.Classes;
import com.wangmengyuan.bean.Teachers;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/5.
 */
public class ClassesServiceImpl implements ClassesService {
    private ClassesDao classesDao = new ClassesDaoImpl();
    //查询班级所有信息
    @Override
    public List<Classes> selectAllClasses() {
        List<Classes> classesList= classesDao.selectAllClassesInfo();
        return classesList;
    }

    @Override
    public void saevOrupdateClasses(Classes classes) {
        classesDao.saevOrupdateClasses(classes);
    }
   //根据岗位查询讲师信息
    @Override
    public List<Teachers> selectTeachersByTjob0() {
        return classesDao.selectTeachersByTjob0(0);
    }
    //根据岗位查询班主任信息
    @Override
    public List<Teachers> selectTeachersByTjob1() {
        return classesDao.selectTeachersByTjob1(1);
    }
   //多条件查询
    @Override
    public List<Classes> selectClassesBy(String cbegin, String cdirection, Integer tidh, Integer tidl) {
        List<Classes> classesList= classesDao.selectClassesBy(cbegin,cdirection);
       /* List<Classes> classesList1=new ArrayList<Classes>();
        for (Classes c:classesList){
            Integer t1=c.getTidh().getTid();
            Integer t2=c.getTidl().getTid();
            if(tidh!=null && tidh!=-1){
                if (tidh!=t1){
                    continue;
                }
            }
            if(tidl!=null && tidl!=-1){
                if (t2!=tidl){
                    continue;
                }
            }
            classesList1.add(c);
        }*/
        return classesList;
    }
    //根据id查询班级表中的数据
    @Override
    public Classes QueryClasses(Integer id) {
        return classesDao.QueryClasses(id);
    }
}
