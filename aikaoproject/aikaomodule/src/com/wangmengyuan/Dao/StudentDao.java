package com.wangmengyuan.Dao;

import com.wangmengyuan.bean.Students;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/12/7.
 */
public interface StudentDao {
    //查询学生界面信息
    public List<Students> selectAllStudentsinfo();
    //多条件查询
    public List<Students> selectsnumber(String snumber,String sname);
}
