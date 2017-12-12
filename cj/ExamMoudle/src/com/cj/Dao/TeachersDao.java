package com.cj.Dao;

import com.cj.Bean.Teachers;

import java.util.List;

/**
 * Created by cj on 2017/11/23.
 */
public interface TeachersDao extends BaseDao {
//老师登陆
public  List<Teachers> selectTeacher(String tname,String tpassword);
    //主界面显示--查询所有
    public  List<Teachers>selectTeacherAll();

//根据账号查询OR老师名字查询Or岗位
public  List<Teachers>selectTeacherMyTnumberOrtnameOrTjob(String tnumber,String tname,Integer tjob);
    //增加老师账号--才能查询账号是否存在
    public  List<Teachers>selecttLikeNumber(String tnumber);
    //根据ID查询
    public  Teachers selectMyTid( Integer tid);
    //增加
    public  boolean insertteacherAll(Teachers teachers);
    //根据账号差ID
    public List<Teachers> selectTnumberMyId(String tnumber);

}
