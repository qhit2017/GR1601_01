package com.jiang.dao;

import com.jiang.bean.Teachers;

import java.util.List;

/**
 * Created by dell on 2017/11/26.
 */
public interface SelectTeachersInfoDao {
    /*根据条件查询老师信息*/
    public List<Teachers> selectTeachersByTnumberOrTnameOrTjob(String tnumber, String tname,Integer tjob);
}
