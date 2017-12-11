package com.jiang.service;
import com.jiang.bean.Teachers;
import com.jiang.dao.BaseDaoImpl;
import com.jiang.dao.InsertTeachersDao;
import com.jiang.dao.InsertTeachersDaoImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
/**
 * Created by dell on 2017/11/26.
 */
public class InsertTeachersInfoServiceImpl extends BaseDaoImpl implements InsertTeachersInfoService {
    @Override
    public Teachers selectTeachersInfo() {
        InsertTeachersDao insertTeachersDao = new InsertTeachersDaoImpl();
        //当前日期 yyyyMMdd
        Date date =new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        String strDate = simpleDateFormat.format(date);
        //根据当前日期  查询新的账号 yyyyMMddXX0
        String nowTnumber ="";
        List<Teachers> teachers= insertTeachersDao.selectTeachersInfo(strDate+"___");
        if(teachers==null || teachers.size()==0){
            nowTnumber = strDate+"001";
        }
        else{
            Integer size = teachers.size();
            Teachers teachers1 = teachers.get(size-1);
            String maxTnumber = teachers1.getTnumber();
            Long lTnumber =Long.parseLong(maxTnumber);
            lTnumber = lTnumber+1;
            nowTnumber = lTnumber.toString();
        }
        //把新查询的账号 ---》保存到teacher
        Teachers teachers1 = new Teachers();
        teachers1.setTnumber(nowTnumber);
        insertTeachersDao.insert(teachers1);
        return teachers1;
    }

    @Override
    /*根据id查询*/
    public Teachers queryTidAppear(Integer tid) {
        InsertTeachersDao insertTeachersDao = new InsertTeachersDaoImpl();
        return insertTeachersDao.queryTidAppear(tid);
    }

    @Override
    /*更新*/
    public Teachers updateInsertTeachers(Teachers teachers) {
        InsertTeachersDao insertTeachersDao = new InsertTeachersDaoImpl();
        insertTeachersDao.update(teachers);
        return teachers;
    }

    @Override
    /*取消*/
    public boolean delectTeachers(Teachers teachers) {
        InsertTeachersDao insertTeachersDao = new InsertTeachersDaoImpl();
        insertTeachersDao.delect(teachers);
        return false;
    }


}
