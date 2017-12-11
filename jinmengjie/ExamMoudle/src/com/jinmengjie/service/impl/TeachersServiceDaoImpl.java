package com.jinmengjie.service.impl;

import com.jinmengjie.bean.Teachers;

import com.jinmengjie.dao.TeacherDao;
import com.jinmengjie.dao.impl.BaseDaoImpl;
import com.jinmengjie.dao.impl.TeacherDaoImpl;
import com.jinmengjie.service.TeachersServiceDao;
import com.jinmengjie.util.Tnumber;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by 金梦杰 on 2017/11/23/023.
 */
public class TeachersServiceDaoImpl implements TeachersServiceDao {

    //代码优化
    private  TeacherDao teacherDao = new TeacherDaoImpl();
    @Override
    public boolean selectteachers(String tname, String password) {
        TeacherDao teacherDao = new TeacherDaoImpl();
        List<Teachers> teachersList= teacherDao.selectteachers(tname,password);
        if (teachersList.size()==0||teachersList==null){
            return  false;
        }else {
            return  true;
        }

    }

    //查询所有
    @Override
    public List<Teachers> selectAllTechers() {
        TeacherDao teacherDao = new TeacherDaoImpl();
        List<Teachers>teachers = teacherDao.selectAllTechers();
        if (teachers.size()==0||teachers==null){
            //return回去的值要和数据库中的值作比对，没有值就告诉控制器为空，否则返回这个类
            return null;
        }else {
            return teachers;
        }
    }
    //根据账号，姓名，岗位做查询并显示到页面
    @Override
    public List<Teachers> selectteachertBynameOrtnumberOrtjob(Teachers teachers) {
        List<Teachers> teachersList= teacherDao.selectteachertBynameOrtnumberOrtjob(teachers);
        if (teachersList.size()==0||teachersList==null){
            return null;
        }else {
            return teachersList;
        }
    }
    //根据ID做精确查询（教师页面点击编辑要做的处理）
    @Override
    public Teachers selectteacherByttid(Integer tid) {
       Teachers teachers =  teacherDao.selectteacherByttid(tid);
       if (teachers==null){
           return  null;
       }else {
           return teachers;
       }
    }

    @Override
    public void deleteTeacherInfo(Teachers teachers) {
        teacherDao.delete(teachers);
        return ;
    }

    //模糊查询（id）生成账号
    @Override
    public Teachers selectBytid( String tnumber) {
        //先作日期的处理
        //1.查询当前的日期
        Date date = new Date();
        SimpleDateFormat format0 = new SimpleDateFormat("yyyyMMdd");
        String strNow = format0.format(date.getTime());//这个就是把时间戳经过处理得到期望格式的时间
       // System.out.println("格式化结果0：" + time);

        //2.去数据库根据当前日期查询新的账号
        //定义一个当前时间的字符串
        String NowData = "";
        List<Teachers> teachersList = teacherDao.selectteacherBytid(strNow+"___");
        if (teachersList.size()==0||teachersList==null){
          //编号的后三位（用当前时间+拼成的001字符串）
            NowData =  strNow+"001";
        }else {
            //获取到list中的数据
            Integer size =  teachersList.size();
            //list中的最后的一条数据-1得出最新的数据,因为list的是从0开始算的，所以要-1才能得出你要的最后一位数
            Teachers teachers = teachersList.get(size-1);
            //list中只有一条tnumber数据,要把String类型的 Maxtnumber转化为long   因为string不能做++
            String Maxtnumber =  teachers.getTnumber();

            //类型转化
            Long Tnumber =  Long.parseLong(Maxtnumber);
            Tnumber = Tnumber+1;
            NowData = Tnumber.toString();
        }
        //把新查询的账号保存到teacher中
        Teachers teachers = new Teachers();
        teachers.setTnumber(NowData);
        teacherDao.insert(teachers);
        return teachers;
    }

    //教师界面的增加和修改数据
    @Override
    public void saveTeacherInfoAndUpdate(Teachers teachers) {

        teacherDao.saveTeacherInfoAndUpdate(teachers);
        return ;

    }


}
