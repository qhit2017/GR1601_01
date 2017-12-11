package com.yanlihua.service.impl;

import com.yanlihua.bean.Teachers;
import com.yanlihua.dao.TeachersDao;
import com.yanlihua.dao.impl.TeachersDaoImpl;
import com.yanlihua.service.TeachersService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by 晏利花 on 2017/11/23.
 */
public class TeachersServiceImpl  implements TeachersService {

    private TeachersDao teachersDao=new TeachersDaoImpl();
    @Override
    public List<Teachers> selectAllTeachersInfoTeachersService() {
        List<Teachers> teachersList=teachersDao.selectAllTeachersInfoTeachersDao();
        return teachersList;
    }

    @Override
    public List<Teachers> selectThreeConditionTeachersService(String tnumber, String tname, Integer tjob) {
        List<Teachers> teachersList=teachersDao.selectThreeConditionTeachersDao(tnumber, tname, tjob);
        System.out.println("service---"+tnumber+" "+tname+" "+tjob);
        return teachersList;
    }

    @Override
    public List<Teachers> selectThreeConditionTeachersService1(Teachers teachers) {
        List<Teachers> teachersList=teachersDao.selectThreeConditionTeachersDao1(teachers);
        return teachersList;
    }

    @Override
    public Teachers selectTeachersInfoByTidTeacherService(Integer tid) {
        Teachers teachers=teachersDao.selectTeachersInfoByTidTeacherDao(tid);
        return teachers;
    }

    @Override
    public void saveOrUpdateTeachersInfoTeacherService(Teachers teachers) {
        teachersDao.saveOrUpdateTeachersInfoTeacherDao(teachers);
        return ;
    }

    @Override
    public void deleteTeacherByIdBaseService(Teachers teachers) {
        teachersDao.deleteTeacherByIdBaseDao(teachers);
        return ;
    }

    @Override
    public Teachers selectEndTeacherDataByTnumberTeachersService() {
        Teachers teachers=teachersDao.selectEndTeacherDataByTnumberTeachersDao();
        return teachers;
    }

    @Override
    public Teachers selectTeacherInfoLikeTnumberTeacherService() {
        //获取当前日期 yyyyMMdd
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
        String d=sdf.format(date);

        //当前日期
        String nowtnumber="";
        List<Teachers> teachers=teachersDao.selectTeacherInfoLikeTnumberTeacherService(d+"___");
        //今天没有添加  那么去当前日期+001
        if (teachers.size()==0||teachers==null){
            nowtnumber=d+"001";
        }
        else{
            //取出当天的最后一个添加的tnumber
           Integer tsize= teachers.size();
           Teachers teachersend=teachers.get(tsize-1);
           Long endnumber=Long.valueOf(teachersend.getTnumber());
            endnumber=endnumber+1;
            nowtnumber=String.valueOf(endnumber);
        }
        Teachers teachers1=new Teachers();
        teachers1.setTnumber(nowtnumber);
        teachersDao.saveOrUpdateTeachersInfoTeacherDao(teachers1);
        return teachers1;
    }
}
