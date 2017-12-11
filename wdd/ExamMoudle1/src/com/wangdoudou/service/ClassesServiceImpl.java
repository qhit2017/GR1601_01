
package com.wangdoudou.service;

import com.wangdoudou.bean.Classes;
import com.wangdoudou.bean.Teachers;
import com.wangdoudou.dao.ClassesDao;
import com.wangdoudou.dao.ClassesDaoImpl;

import java.util.ArrayList;
import java.util.List;


/**
 * Created by 王豆豆 on 2017/12/1.
 */

public class ClassesServiceImpl implements ClassesService {
    private ClassesDao dao=new ClassesDaoImpl();
    @Override
    public List<Classes> selectAllClassesInfo() {
        List<Classes> classesList= dao.selectAllClassesInfo();
        return classesList;
    }
    //根据岗位查询讲师信息
    @Override
    public List<Teachers> selectTeachersByTjob0(Integer tjob) {
        return dao.selectTeachersByTjob0(0);
    }
    //根据岗位查询班主任信息
    @Override
    public List<Teachers> selectTeachersByTjob1(Integer tjob) {
        return dao.selectTeachersByTjob1(1);
    }
    //条件查询
    @Override
    public List<Classes> selectClassesBy(String cbegin, String cdirection, Integer tidh, Integer tidl) {
        List<Classes> classesList= dao.selectClassesBy(cbegin,cdirection);
      /*  List<Classes> classesList1=new ArrayList<Classes>();
        for (Classes c:classesList){
            Integer t1=c.getTeachersh().getTid();
            Integer t2=c.getTeachersl().getTid();
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
   //添加或修改
    @Override
    public void saevOrupdateClasses(Classes classes) {
        dao.saevOrupdateClasses(classes);
    }
    //根据id查询班级表中的数据
    @Override
    public Classes QueryClasses(Integer cid) {
        return dao.QueryClasses(cid);
    }
}

