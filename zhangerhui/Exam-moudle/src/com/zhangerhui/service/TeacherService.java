package com.zhangerhui.service;

import com.zhangerhui.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/11/23/023.
 */
public interface TeacherService {

    public List<Teachers> selectTeachersBytnameAndtpassword(String tname, String tpassword);
    public List<Teachers> selectTeachersallinfo();
    public boolean insertTeachers();

    public List<Teachers> selectThreeTeacher(String tnumber,String tname,Integer tjob);

    public void updateTeachersInfo(Teachers teachers);

    public void deleteTeachersInfo(Teachers teachers);

    public Teachers selectTeacherTnumber();

    public List<Teachers>selectTeacherByTnumber(String tnumber);

    public Teachers selectTeacherByTid(Integer tid);

}
