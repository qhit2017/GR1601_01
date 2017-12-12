package com.zhanglong.service.impl;

import com.zhanglong.bean.Teachers;
import com.zhanglong.dao.TeacherDao;

import com.zhanglong.dao.impl.TeacherDaoImpl;
import com.zhanglong.service.TeacherService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/11/26 0026.
 */
public class TeacherServiceImpl implements TeacherService {
    private TeacherDao dao=new TeacherDaoImpl();
    @Override
    public List<Teachers> queryteacherlist() {
        TeacherDao dao=new TeacherDaoImpl();
        return dao.queryteacherlist();
    }

    @Override
    public List<Teachers> queryteacherByTnumberTnameTrole(String tnumber, String tname, Integer tjob) {
        TeacherDao dao=new TeacherDaoImpl();
        return dao.queryteacherByTnumberTnameTrole(tnumber,tname,tjob);
    }

    @Override
    public void SaveOrUpdate(Teachers teachers) {
        TeacherDao dao=new TeacherDaoImpl();
        dao.SaveOrUpdate(teachers);
        return;
    }
     //根据ID进行查询
    @Override
    public Teachers SelectTeachersByTid(Integer tid) {
        TeacherDao dao=new TeacherDaoImpl();
       Teachers teachers=dao.SelectTeachersByTid(tid);
        if (teachers==null){
            return  null;
        }else {
            return teachers;
        }
    }

    @Override
    public Teachers queryTeacherNumber() {
        TeacherDao dao=new TeacherDaoImpl();
        //当前日期
        Date date=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMdd");
        String strdate=simpleDateFormat.format(date);
        //根据当前日期 查询新的账号 yyyyMMddXXx
        String nowTnumber="";
        List<Teachers>teachers=dao.selectTeacherLikeNumber(strdate+"___");
        if ((teachers==null)||teachers.size()==0){
            nowTnumber=strdate+"001";
        }
        else{
            Integer size=teachers.size();
            Teachers teachers1=teachers.get(size-1);
            String maxnumber=teachers1.getTnumber();
            Long lnumber=Long.parseLong(maxnumber);
            lnumber=lnumber+1;
            nowTnumber=lnumber.toString();
        }
        //把新查询的账号---》保存到teacher
        Teachers teachers1=new Teachers();
        teachers1.setTnumber(nowTnumber);
        dao.insert(teachers1);
        return teachers1;
    }

    @Override
    public void deleteTeacherById(Teachers teachers) {
        dao.deleteTeacherById(teachers);
        return;
    }

    @Override
    public Teachers selectTeacherBytid(Integer tid) {
        TeacherDao dao=new TeacherDaoImpl();
        Teachers teachers=dao.SelectTeachersByTid(tid);
        if (teachers==null){
            return  null;
        }else {
            return teachers;
        }
    }
}
