package com.cj.Service;

import com.cj.Bean.Teachers;
import com.cj.Dao.Impl.TeachersDaoImpl;
import com.cj.Dao.TeachersDao;
;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * Created by cj on 2017/11/23.
 */
public class TeachersServiceImpl implements TeachersService {
    private TeachersDao teacher=new TeachersDaoImpl();
    //登陆
    @Override
    public List<Teachers> selectTeacher(String tname, String tpassword) {

        return teacher.selectTeacher( tname,tpassword);
    }
//查询老师所有
    @Override
    public List<Teachers> selectTeacherAll() {
        return teacher.selectTeacherAll();

    }

       /*  查询账号*/
    @Override
    public Teachers selectNumber() {

        //取当前日期
        Date date=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMdd");
        String strdate=simpleDateFormat.format(date);


//根据当前日期   查询新的账号
        String newtnumber="";
        List<Teachers> teachernum=teacher.selecttLikeNumber(strdate+"___");
        if (teachernum==null||teachernum.size()==0){
            newtnumber=strdate+"001";
        }
        else {
            //取最大值
            Integer size=  teachernum.size();
            Teachers teachern= teachernum.get(size-1);
            String maxtnumber =teachern.getTnumber();
            //把String转Long
            Long  number= Long.parseLong(maxtnumber);
            number=number+1;
            //把long 转String
            newtnumber=  number.toString();

        }
        Teachers teachers=new Teachers();
        teachers.setTnumber(newtnumber);
        teacher.insert(teachers);
        return teachers;
    }
/*根据条件查询老师*/
    @Override
    public List<Teachers> selectTeacherMyTnumberOrtnameOrTjib(String tnumber, String tname, Integer tjob) {
       return teacher.selectTeacherMyTnumberOrtnameOrTjob(tnumber,tname,tjob);
    }

    @Override
    public Teachers selectMyTid(Integer tid) {
        return  teacher.selectMyTid(tid);

    }



    //增加老师
    @Override
    public boolean insertteacherAll(Teachers teachers) {
       boolean teachers1 = teacher.insertteacherAll(teachers);
       if (teachers1==true){
           return true;
       }
       return false;

    }
/*删除*/
    @Override
    public boolean deleteTeacher(Teachers teachers) {
    teacher.delete(teachers);
    return true;
    }

    @Override
    public List<Teachers> selectTnumberMyId(String tnumber) {
      return   teacher.selecttLikeNumber(tnumber);
    }


}
