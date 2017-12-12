package com.cj.Service;

import com.cj.Bean.Teachers;

import java.util.List;

/**
 * Created by cj on 2017/11/23.
 */
public interface TeachersService {
//登陆
public List<Teachers> selectTeacher(String tname, String tpassword);
    //主界面  查询老师所有
    public List<Teachers> selectTeacherAll();
    //根据时间取当前日期获取账号
    public Teachers selectNumber();
    //根据账号查询OR老师名字查询Or岗位
public  List<Teachers>selectTeacherMyTnumberOrtnameOrTjib(String tnumber,String tname,Integer tjob);
//根据ID 查询
    public  Teachers selectMyTid( Integer tid);
//增加老师
public  boolean insertteacherAll(Teachers teachers);
//删除
    public boolean deleteTeacher(Teachers teachers);
    //根据账号差ID
    public  List<Teachers>selectTnumberMyId(String tnumber);

}
