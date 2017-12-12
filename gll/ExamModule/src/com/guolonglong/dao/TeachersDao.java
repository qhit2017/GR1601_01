package com.guolonglong.dao;

import com.guolonglong.bean.Teachers;
import com.guolonglong.dao.base.PublicDao;

import java.util.List;

/**
 * Created by lenovo on 2017/11/23.
 */
public interface TeachersDao extends PublicDao{
    //查询
    public List<Teachers> selectTeachers(String tname,String tpassword);
    //查询所有
    public List<Teachers> selectTeachersAll();
    //通过账号 姓名 岗位查询
    public List<Teachers> selectTeacherBynumberOrnameOrjob(String tnumber,String tname,Integer tjob);
    //通过账号模糊查询
    public List<Teachers> selectTeacherLikeBynumber(String tnumber);
    //通过 tnumber 查询Teachers
    public List<Teachers> selectTeachersByNumber(String tnumber);
    //通过 tid 查询Teachers
    public Teachers selectTeachersById(Integer tid);


}
