package com.wangmengyuan.Service;

import com.wangmengyuan.Dao.teacherDao;
import com.wangmengyuan.Dao.teacherDaoImpl;
import com.wangmengyuan.bean.Teachers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/12/4.
 */
public class teacherServiceImpl implements teacherService {
    private teacherDao teacherDao = new teacherDaoImpl();
    //教师查询
    @Override
    public List<Teachers> querylist() {
        List<Teachers> teachersList =teacherDao.selectAll();
        return teachersList ;
    }
    //添加数据
    @Override
    public void insertTeachers(Teachers teachers) {
        teacherDao.insertTeachers(teachers);
    }

    //根据条件查询
    @Override
    public List<Teachers> selecttnumberOrtnameOrtjob(String tnumber, String tname, String tjob) {
        List<Teachers>teachersList1=teacherDao.selecttnumberOrtnameOrtjob(tnumber,tname,tjob);
        return teachersList1;
    }
  //账号
    @Override
    public Teachers selectTeachersLike() {
        //当前日期
        Date date=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMdd");
        String strDate=simpleDateFormat.format(date);
        //根据当前日期 查询当前账号 yyyyMMdd---
        String nowTnumber="";
        List<Teachers>teachers2=teacherDao.selectTeachersLikeTnumber(strDate+"___");
        if (teachers2==null||teachers2.size()==0){
            nowTnumber=strDate+"002";
        }
        else {
            Integer size=teachers2.size();
            Teachers teachers3=teachers2.get(size-1);
            String maxTnumber=teachers3.getTnumber();

            Long Tnumbers=Long.parseLong(maxTnumber);
            Tnumbers=Tnumbers+1;
            nowTnumber=Tnumbers.toString();
        }
        //把新查询的账号保存到teachers
        Teachers teachers3=new Teachers();
        teachers3.setTnumber(nowTnumber);
        teacherDao.insertTeachers(teachers3);
        return teachers3;
    }

    //根据id查询信息
    @Override
    public Teachers selectByTid(Teachers teachers) {
        return teacherDao.selectByTid(teachers);
    }
    //修改密码
    @Override
    public void updateTeachersByTid(Teachers teachers) {
        teacherDao.updateTeachersByTid(teachers); ;
    }
    //删除
    @Override
    public void deleteTeachersByTid(Teachers teachers) {
           teacherDao.selectByTid(teachers);
    }

    @Override
    public List<Teachers> selectTjob0() {
        return null;
    }
}
